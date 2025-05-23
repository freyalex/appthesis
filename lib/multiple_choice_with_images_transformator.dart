import 'dart:io';
import 'package:appthesis/data_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart'; // BSD-3
import 'package:flutter_svg/flutter_svg.dart'; // MIT
import 'package:flutter/services.dart';
import 'dart:collection';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

class mul_choise_img_trans extends StatelessWidget {
  final String dir;
  final String elem;
  final int routenum;
  late Map<String, String> svg;
  @override
  mul_choise_img_trans(
    this.dir,
    this.elem,
    this.routenum,
  );
  @override
  Widget build (BuildContext context) {
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
                  String a = 'questionAnsField' + "$routenum"+'_'+lang;
                  Navigator.pushNamed(context, a);
                },
                onDoubleTap: () => Navigator.pop(context),
                child: Container(
                  color: Color.fromARGB(255, 255, 255, 255),
                  margin: EdgeInsets.fromLTRB(0, 60, 0, 0),
                  child: MarkdownBody(
                    data: markdown,
                    imageBuilder: (a, v, b) => ConstrainedBox(
                      constraints: BoxConstraints(minHeight: 0,maxHeight:svg.length>6?50: MediaQuery.of(context).size.height/4,),
                    child:
                    SvgPicture.asset(
                      dir+a.path,
                      semanticsLabel: dir + elem,
                      fit: BoxFit.scaleDown,
                      
                    ),),
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
          if (current.contains("## Question/Challenge - for the brochures")) {
            i++;
            continue;
          }
          if (current.contains("#")) {
            break;
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
      if (curr[i].startsWith("![") && curr[i].endsWith("]")  && curr[i].length!=3)  {
        loc = curr[i].substring(1);
        curr[i] = "![](resource:" + /*dir +*/ (svg[loc] ?? "") + ")";
      }else if(curr[i].startsWith("![") && curr[i].endsWith("]")  && curr[i].length==3){
        curr[i+1].split("\n");
      }
    }
    return curr.join();
  }
}

class mul_choise_img_trans_Ans extends StatelessWidget {
  final String dir;
  final String elem;
  final int routenum;
  final String t;
  final int que_id;
  late Map<String, String> svg;
  @override
  mul_choise_img_trans_Ans(this.dir, this.elem, this.routenum,this.t,this.que_id);

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
          return Container(
            color: Color.fromARGB(255, 255, 255, 255),
            child: GestureDetector(
              onDoubleTap: () => Navigator.pop(context),
              child: ListView(
                children: question_list(markdown, context),
              ),
            ),
          );
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

  List<Widget> question_list(String markdown, BuildContext context) {
    List<String> list = markdown.split('\n');
    int listSize = list.length;
    int i = 0;
    int j = 0;
    String curr = "";
    List<Widget> ret = [];
    while (i < listSize) {
      String current = list[i];
      if (current.contains("## Answer Options")) {
        i++;
        while (i < listSize) {
          String current = list[i];
          if (current.contains("#")) {
            break;
          }
          if (current.contains("!")) {
           
            Future<List<String>> work = get_svg_ans_name("");
            List<String> list = getAns(current);
            for (int current_ans = 0;
                current_ans < list.length - 1;
                current_ans = current_ans + 2) {
              double width = MediaQuery.of(context).size.width / 1.5;
              double height = MediaQuery.of(context).size.height / 2;
              height > width ? height = width : width = height;
              //strings are pointers
              
              j++; 
              String a = (j).toString();//this is important
              
              ret.add(
                UnconstrainedBox(
                  child: TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                    onPressed: () async {
                      List<String> wow = await work;
                      widgetList[routenum - 1].answer = wow[int.parse(a) - 1];
                      var response = http.post(
                          Uri.parse(
                              'https://wettbewerb.informatik-biber.ch/?action=question_standalone&que_id=$que_id&t='+t),
                          headers: {
                            "Content-Type": "application/x-www-form-urlencoded",
                          },
                          encoding: Encoding.getByName('utf-8'),
                          body: {"answer": widgetList[routenum - 1].answer});
                      response.then((value) => questionAns[routenum-1]=value.body
                          .contains("Du hast die richtige Antwort gewählt."));
                    },
                    child: Container(
                      color: (Colors.white),
                      margin: const EdgeInsets.all(10),
                      child: SvgPicture.asset(
                         dir+
                        (list[current_ans + 1]
                            .substring(0, list[current_ans + 1].length - 1)),
                        semanticsLabel: dir + elem,
                        width: width,
                      ),
                    ),
                  ),
                ),
              );
            }
            i++;
            continue;
          }

          if (current == "" || current.startsWith("-")) {
            i++;
            continue;
          }

          j++;
          ret.add(
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () {
                curr = current.substring(3).replaceAll("_", "").replaceAll("|", "");
                while(curr.startsWith(" ")){
                  curr=curr.substring(1);
                }
                widgetList[routenum - 1].answer = curr;
                var response = http.post(
                    Uri.parse(
                         'https://wettbewerb.informatik-biber.ch/?action=question_standalone&que_id=$que_id&t='+t),
                    headers: {
                      "Content-Type": "application/x-www-form-urlencoded",
                    },
                    encoding: Encoding.getByName('utf-8'),
                    body: {"answer":widgetList[routenum - 1].answer});
                response.then((value) => questionAns[routenum]=value.body
                    .contains("Du hast die richtige Antwort gewählt."));
              },
              child: Container(
                alignment: Alignment.center,
                color: (Colors.blue),
                margin: const EdgeInsets.all(10),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                      maxHeight: 500,
                      minHeight: 100,
                      maxWidth: 500,
                      minWidth: 100),
                  child: MarkdownBody(
                    data: current.substring(3).replaceAll("|", ""),
                    selectable: false,
                    fitContent: true,
                    listItemCrossAxisAlignment: MarkdownListItemCrossAxisAlignment.baseline,
                  ),
                ),
              ),
            ),
          );
          i++;
        }
      }
      i++;
    }

    ret.shuffle();
    return ret;
  }

  List<String> getAns(String str) {
    List<String> curr = str.split(" ");

    for (int i = 0; i < curr.length; i++) {
      curr[i] = modify_links(curr[i]);
      curr[i] = curr[i].replaceAllMapped(" ", (match) => "");
      if (curr[i].contains("!")) {
        continue;
      }
      if (curr[i].contains(RegExp('[^A-Za-z0-9]'))) {
        continue;
      }
      curr[i] = curr[i].replaceAllMapped(RegExp('[^A-Za-z0-9]'), (match) => '');
      curr[i] =curr[i].replaceAllMapped(RegExp('[()]'), (match) => '');
      curr.removeWhere((element) =>
          !element.contains(RegExp('[a-z]', caseSensitive: false)));
    }
    curr.removeWhere(
        (element) => !element.contains(RegExp('[a-z]', caseSensitive: false)));

    return curr;
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
    for (int i = 0; i < curr.length; i++) {
      if (curr[i].startsWith("![") && curr[i].endsWith("]")) {
        loc = curr[i].substring(1);
        curr[i] =  (svg[loc] ?? "") + ")"; //"![](resource:" +
      }
    }

   curr.removeWhere(
        (element) => !element.contains(RegExp('[a-z]', caseSensitive: false)));
    return curr.join();
  }

  Future<List<String>> get_svg_ans_name(String String_url) async {
    var url = Uri.parse(
        'https://wettbewerb.informatik-biber.ch/?action=question_standalone&que_id=$que_id&t='+t);
    http.Response data = await http.get(url);
    String loc = data.body;
    print(data.statusCode);

    List<String> test = [];
    List<String> test2 = [];
    List<String> curr = loc.split("\n");
    bool event = false;
    for (int i = 0; i < curr.length; i++) {
      if (!event) {
        event = curr[i].contains("answer");
      }
      if (event) {
        test.addAll(curr[i].split("img src"));
      }
    }

    for (int i = 1; i < test.length; i++) {
      for (var i in test[i].split("\"")) {
        if (i.contains("SaveAnswer") && !i.contains("function")) {
          int left = i.indexOf("(");
          int right = i.indexOf(")");
          test2.add(i.substring(left + 2, right - 1));
        }
      }
    }
    test2.sort();
    return test2;
  }

}
