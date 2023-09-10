import 'dart:async';
import 'dart:math';
import 'package:appthesis/data_class.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart'; // MIT
import 'package:flutter/services.dart';
import 'dart:io';
import 'dart:collection';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:dartlang_utils/dartlang_utils.dart' as str;
import 'package:flutter_markdown/flutter_markdown.dart';


class clicable_svg extends StatelessWidget {
  final String dir;
  final String elem;
  final int routenum;
  late Map<String, String> svg;
  @override
  clicable_svg(
    this.dir,
    this.elem,
    this.routenum,
  );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: rootBundle.loadString(dir + elem),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.hasData) {
          String markdown = snapshot.data ?? "";
          if (markdown == "") {
            exit(1);
          }
          init_SVG(markdown);
          markdown = modify_links(clean(markdown));
          return Container(
              color: Color.fromARGB(255, 255, 255, 255),
              child: GestureDetector(
                onTap: () {
                  String a = 'questionAnsField' + "$routenum";
                  Navigator.pushNamed(context, a);
                },
                onDoubleTap: () => Navigator.pop(context),
                child: Container(
                  color: Color.fromARGB(255, 255, 255, 255),
                  margin: EdgeInsets.fromLTRB(0, 60, 0, 0),
                  child: MarkdownBody(
                    data: markdown,
                    imageBuilder: (a, v, b) => SvgPicture.asset(
                      a.path,
                      semanticsLabel: dir + elem,
                    ),
                  ),
                ),
              ));
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  init_SVG(String markdown) {
    List<String> list = markdown.split('\n');
    int listSize = list.length;
    int i = 0;
    svg = HashMap<String, String>();
    while (i < listSize) {
      String current = list[i].split(' "')[0];
      if (current.startsWith("[") && current.contains("]:")) {
        List<String> list = current.split(": ");
        if (list.length != 2) exit(1);
        svg.addAll({list[0]: list[1]});
      }
      if (current.contains("## Body")) break;
      i++;
    }
  }

  String clean(String markdown) {
    List<String> list = markdown.split('\n');
    int listSize = list.length;
    int i = 0;
    int j = 0;
    String ret = "";
    while (i < listSize) {
      String current = list[i];
      if (current.contains("## Body")) {
        i++;
        while (i < listSize) {
          String current = list[i];
          if (current.contains("## Question/Challenge")) {
            i++;
            continue;
          }
          if (current.contains("#")) {
            break;
          }
          if(current.contains('!')){
             i++;
            continue;
          }
          i++;
          ret = ret + ("\n" + current);
        }
      }
      i++;
    }
    return ret;
  }

  String modify_links(String str) {
    List<String> curr = str.split("![");
    for (int i = 1; i < curr.length; i++) {
      curr[i] = "![" + curr[i];
    }
    List<String> uptd = [];
    for (int i = 0; i < curr.length; i++) {
      uptd.addAll(curr[i].split("]"));
    }
    for (int i = 1; i < uptd.length; i = i + 2) {
      uptd[i] = uptd[i] + "]";
    }
    curr = uptd;
    uptd = [];
    String loc = "";
    for (int i = 1; i < curr.length; i++) {
      if (curr[i].startsWith("![") && curr[i].endsWith("]")) {
        loc = curr[i].substring(1);
        curr[i] = "![](resource:" + dir + (svg[loc] ?? "") + ")";
      }
    }
    return curr.join();
  }
}


class clicable_svg_inter extends StatefulWidget {
  final String dir;
  final String elem;
  final int routenum;
  final String t;
  final int que_id;
  @override
  clicable_svg_inter(this.dir, this.elem, this.routenum,this.t,this.que_id);

  createState() => _clicable_svg_inter(dir, elem, routenum,this.t,this.que_id);
}

class _clicable_svg_inter extends State<clicable_svg_inter> {
  // ans list and list on ans entety
  List<bool> ans = [];
  List<Ans> svg_ans = [];
  // viebox things
  final GlobalKey key = GlobalKey();
  double ratio = 1;
  double width = 1;
  double height = 1;
  late Size size;
  late Size viewbox;
  Offset offset = Offset(0, 0);
  Offset offset_past = Offset(0, 0);

  // svg
  late final String svg;
  String first_part = "";
  String displayedSvg =
      "<svg width=\"240\" height=\"320\"> </svg>"; // the svg to be changed
  // where we are
  final String dir;
  final String elem;
  final int routenum;
  final String t;
  final int que_id;

  @override
  _clicable_svg_inter(this.dir, this.elem, this.routenum,this.t,this.que_id);

  void get_size_offset() {
    //width init is incorrect
    final RenderBox box = key.currentContext!.findRenderObject()! as RenderBox;
    offset_past = offset;
    offset = box.localToGlobal(Offset.zero);
    size = box.size;
    //needs work
    if (!(offset_past == offset)) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    get_svg().then(
      (loaded) => setState(
        () {
          svg = loaded;
          displayedSvg = svg;

          if (svg.contains('viewBox')) {
            int loc = svg.indexOf('viewBox');
            String curr = svg.substring(loc);
            loc = curr.indexOf(">");
            curr = curr.substring(0, loc);
            loc = curr.indexOf("\"");
            curr = curr.substring(loc + 1);
            loc = curr.indexOf("\"");
            curr = curr.substring(0, loc);
            //curr has 4 int x y dx dy
            List<String> str4 = curr.split(" ");
            str4.remove("");
            str4.remove(" ");
            double x = double.parse(str4[2]);
            double y = double.parse(str4[3]);
            ratio = y / x;
            viewbox = Size(x, y);
            if (widgetList[routenum - 1].answer.isEmpty) {
              TapDownDetails details = TapDownDetails(
                  globalPosition: Offset(0, 0), localPosition: Offset(0, 0));
              udpate(details, true);
            } else {
              update_with_bool(get_ans_list());
            }
          } else {
            exit(2);
          }
        },
      ),
    );
  }

  Future<String> get_svg() async {
    return await rootBundle.loadString((dir + elem));
  }

// side cannot assume 0
  Widget build(BuildContext context) {
    width = min(MediaQuery.of(context).size.width,
        MediaQuery.of(context).size.height / ratio);
    height = min(MediaQuery.of(context).size.height,
        MediaQuery.of(context).size.width * ratio);
    WidgetsBinding.instance.addPostFrameCallback((_) => get_size_offset());
    return GestureDetector(
      onDoubleTap: () {
        widgetList[routenum - 1].answer = to_string_ans(ans);
        var response = http.post(
            Uri.parse(
                'https://wettbewerb.informatik-biber.ch/?action=question_standalone&que_id=$que_id&t='+t),
            headers: {
              "Content-Type": "application/x-www-form-urlencoded",
            },
            encoding: Encoding.getByName('utf-8'),
            body: {"answer": to_string_ans(ans)});
        response.then((value) => questionAns[routenum]=(
            value.body.contains("Du hast die richtige Antwort gewählt.")));
        Navigator.pop(context);
      },
      onTapDown: (details) {
        udpate(details, false);
      },
      child: Container(
        color: Color.fromRGBO(255, 255, 255, 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              key: key,
              color: Color.fromRGBO(38, 241, 48, 1),
              child: SvgPicture.string(
                displayedSvg,
                semanticsLabel: dir + elem,
                fit: BoxFit.scaleDown,
                width: width,
                height: height,
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool inside_svg(double x, double y) {
    if (x > offset.dx &&
        x < offset.dx + size.width &&
        y > offset.dy &&
        y < offset.dy + size.height) {
      return true;
    }
    return false;
  }

  String to_string_ans(List<bool> f) {
    String ret = "[";
    for (int i = 0; i < f.length; i++) {
      if (f[i]) {
        ret = ret + '1,';
      } else {
        ret = ret + '0,';
      }
    }
    ret = ret.substring(0, ret.length - 1);
    ret = ret + "]";
    return ret;
  }

  udpate(TapDownDetails details, bool overwirte) {
    final tapPosition = details.globalPosition;
    double x = tapPosition.dx;
    double y = tapPosition.dy;
    if (inside_svg(x, y) || overwirte) {
      //inside Svg
      x = x - offset.dx;
      y = y - offset.dy;
      x = x / size.height * viewbox.height;
      y = y / size.width * viewbox.width;
      // x y are inside svg position
      //tap holds the postion inside the element;

      if (svg_ans.isEmpty) {
        String svg_loc = svg;
        List<String> elem_list = svg_loc.split("<g");

        for (int i = 0; i < elem_list.length; i++) {
          if (i == 0) continue;
          elem_list[i] = "<g" + elem_list[i];
        }
        elem_list[elem_list.length - 1].replaceAll("</svg>", "");
        elem_list.add("</svg>");
        int k = ((elem_list.length - 3) / 3).toInt();
        List<Ans> list = [];
        if (ans.length < k) {
          for (int i = 0; i < k; i++) {
            ans.add(false);
          }
        }
        //+2 everywhere 0 1 2
        for (int i = 0; i < k; i++) {
          if (i == k - 1) {
            list.add(Ans(
                elem_list[i * 3 + 2],
                elem_list[i * 3 + 3] + "</g>" + "\n</svg>",
                elem_list[i * 3 + 4],
                true));
            continue;
          }
          list.add(Ans(elem_list[i * 3 + 2], elem_list[i * 3 + 3] + "</g>",
              elem_list[i * 3 + 4], true));
        }
        first_part = elem_list[0] + elem_list[1];
        svg_ans = list;
      }

      // implement interaction
      for (int i = 0; i < svg_ans.length; i++) {
        svg_ans[i].set_state(x, y);
        ans[i] = svg_ans[i].get_state();
      }
      String new_svg = first_part;
      for (int i = 0; i < svg_ans.length; i++) {
        new_svg = new_svg + "\n" + svg_ans[i].toString();
      }
      displayedSvg = new_svg;
      setState(() {});
    }
  }

  void update_with_bool(List<bool> ans_list) {
    if (svg_ans.isEmpty) {
      String svg_loc = svg;
      List<String> elem_list = svg_loc.split("<g");

      for (int i = 0; i < elem_list.length; i++) {
        if (i == 0) continue;
        elem_list[i] = "<g" + elem_list[i];
      }
      elem_list[elem_list.length - 1].replaceAll("</svg>", "");
      elem_list.add("</svg>");
      int k = ((elem_list.length - 3) / 3).toInt();
      List<Ans> list = [];
      if (ans.length < k) {
        for (int i = 0; i < k; i++) {
          ans.add(false);
        }
      }
      //+2 everywhere 0 1 2
      for (int i = 0; i < k; i++) {
        if (i == k - 1) {
          list.add(Ans(
              elem_list[i * 3 + 2],
              elem_list[i * 3 + 3] + "</g>" + "\n</svg>",
              elem_list[i * 3 + 4],
              true));
          continue;
        }
        list.add(Ans(elem_list[i * 3 + 2], elem_list[i * 3 + 3] + "</g>",
            elem_list[i * 3 + 4], true));
      }
      first_part = elem_list[0] + elem_list[1];
      svg_ans = list;
    }

    for (int i = 0; i < svg_ans.length; i++) {
      svg_ans[i]._state = ans_list[i];
    }
    String new_svg = first_part;
    for (int i = 0; i < svg_ans.length; i++) {
      new_svg = new_svg + "\n" + svg_ans[i].toString();
    }
    displayedSvg = new_svg;
    setState(() {});
  }

  List<bool> get_ans_list() {
    String string_ans = widgetList[routenum - 1].answer;
    List<bool> ret = [];
    while (string_ans != "") {
      if (string_ans.startsWith("0")) {
        ret.add(false);
      }
      if (string_ans.startsWith("1")) {
        ret.add(true);
      }
      string_ans = string_ans.substring(1);
    }
    ans=ret;
    return ret;
  }
}

class Ans {
  // the 3 string for the image
  String _option;
  String _on;
  String _off;

  //the state
  bool _state;

  // the postition inside the svg
  double trans_x = 0;
  double trans_y = 0;

  double _x = 0;
  double _y = 0;

  Ans(this._option, this._on, this._off, this._state) {
    if (_option.contains("translate")) {
      List<String> temp = _option.split("transform=\"");
      temp = temp[1].replaceAll(RegExp("[a-zA-Z()\"<>]"), "").split(" ");
      trans_x = double.parse(temp[0]);
      trans_y = double.parse(temp[1]);
    }
    List<String> curr = _off.split(" d=\"");
    curr = curr[1].split(" ");
    _x = double.parse(curr[0].replaceAll(RegExp("[a-zA-Z]"), "")) + trans_x;
    _y = double.parse(
            (curr[1].replaceAll(RegExp("[a-zA-Z]"), "_")).split("_")[0]) +
        trans_y;
  }
  void set_state(double x, double y) {
    // needs transform for matirx
    // needs viewbox wtf??
    this._state = ((x - _x).abs() < 500 && (y - _y).abs() < 500);
  }

  void fix_multiple(double x, double y, Ans second) {
    double _x = this._x - x;
    double _x1 = second._x - x;

    double _y = this._y - y;
    double _y1 = second._y - y;

    double c = sqrt(_x * _x + _y * _y);
    double c1 = sqrt(_x1 * _x1 + _y1 * _y1);
    bool ans = c < c1;

    _state = ans;
    second._state = !ans;
  }

  bool get_state() {
    return _state;
  }

  @override
  String toString() {
    return _option + (_state ? _on : _off);
  }
}
