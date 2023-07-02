import 'dart:async';
import 'dart:math';
import 'package:appthesis/data_class.dart';
import 'package:dartlang_utils/dartlang_extensions.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart'; // MIT
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dartlang_utils/dartlang_utils.dart' as str;

class clicable_svg_inter extends StatefulWidget {
  final String dir;
  final String elem;

  @override
  clicable_svg_inter(this.dir, this.elem);

  _clicable_svg_inter createState() => _clicable_svg_inter(dir, elem);
}

class _clicable_svg_inter extends State<clicable_svg_inter> {
  // ans list and list on ans entety
  List<bool> ans = [];
  List<Ans> svg_ans=[];
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
  String first_part="";
  String displayedSvg =
      "<svg width=\"240\" height=\"320\"> </svg>"; // the svg to be changed
  // where we are 
  final String dir;
  final String elem;


  @override
  _clicable_svg_inter(this.dir, this.elem);
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
          } else {
            exit(2);
          }
          //WidgetsBinding.instance
          //    .addPostFrameCallback((_) => get_size_offset());
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
      onDoubleTap: ()  {
        var response = http.post(
              Uri.parse(
                  'https://wettbewerb.informatik-biber.ch/?action=question_standalone&que_id=3509&t=411012285942d43f'),
              headers: {
                "Content-Type": "application/x-www-form-urlencoded",
              },
              encoding: Encoding.getByName('utf-8'),
              body: {"answer": to_string_ans(ans)});
          response.then((value) =>
        print(value.body.contains("Du hast die richtige Antwort gewählt.")));
        print(widgetList);
        Navigator.pop(context);
      },
      
      onTapDown: (details) {
        final tapPosition = details.globalPosition;
        double x = tapPosition.dx;
        double y = tapPosition.dy;
        if (inside_svg(x, y)) {
          //inside Svg
          x = x - offset.dx;
          y = y - offset.dy;
          x = x / size.height * viewbox.height;
          y = y / size.width * viewbox.width;
          // x y are inside svg position
          //tap holds the postion inside the element;


          if(svg_ans.isEmpty){
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
          first_part= elem_list[0] + elem_list[1];
          svg_ans=list;
          }

          // implement interaction
          for (int i = 0; i < svg_ans.length; i++) {
            svg_ans[i].set_state(x, y);
            ans[i] = svg_ans[i].get_state();
          }
          String new_svg = first_part;
          for (int i = 0; i <  svg_ans.length; i++) {
            new_svg = new_svg + "\n" + svg_ans[i].toString();
          }
          print(to_string_ans(ans));
          displayedSvg = new_svg;
          setState(() {});
        }
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

  String to_string_ans(List<bool> f){
    String ret="[";
    for(int i=0;i<f.length;i++){
      if(f[i]){
        ret=ret+'1,';
      }else{
        ret=ret+'0,';
      }
    }
    ret=ret.substring(0,ret.length-1);
    ret=ret+"]";
    return ret;
  }
}


class Ans{
  // the 3 string for the image
  String _option;
  String _on;
  String _off;

  //the state
  bool _state;

  // the postition inside the svg
  double trans_x=0;
  double trans_y=0;

  double _x =0;
  double _y =0;

  Ans(this._option, this._on, this._off, this._state) {
     if(_option.contains("translate")){
    List<String> temp=_option.split("transform=\"");
    temp=temp[1].replaceAll(RegExp("[a-zA-Z()\"<>]"), "").split(" ");
    trans_x= double.parse(temp[0]);
    trans_y= double.parse(temp[1]);
    }
    List<String> curr = _off.split(" d=\"");
    curr = curr[1].split(" ");
    _x = double.parse(curr[0].replaceAll(RegExp("[a-zA-Z]"), ""))+trans_x;
    _y = double.parse(
        (curr[1].replaceAll(RegExp("[a-zA-Z]"), "_")).split("_")[0])+trans_y;
    
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
