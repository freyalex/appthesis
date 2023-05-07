import 'dart:io';
import 'package:appthesis/const/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart'; // BSD-3
import 'package:flutter_svg/flutter_svg.dart'; // MIT
import 'package:flutter/services.dart';
import 'dart:collection';
import 'package:http/http.dart' as http;
import 'package:dartlang_utils/dartlang_utils.dart' as str;

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
  Widget build(BuildContext context) {
    var url = Uri.parse(
        'https://wettbewerb.informatik-biber.ch/?action=question_standalone&que_id=3862&t=f4692966c4beef6a');
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text("Question Description"),
      ),
      body: FutureBuilder(
        /* future:http.get(url),
        builder: (BuildContext context, AsyncSnapshot<http.Response> snapshot) {
          http.Response? loc=snapshot.data;
          print(loc?.statusCode);
          print(loc?.body);
          return const Center(
            child: CircularProgressIndicator(),
          );
         }*/
        future: rootBundle.loadString(dir + elem),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            String markdown = snapshot.data ?? "";
            if (markdown == "") {
              exit(1);
            }
            init_SVG(markdown);
            markdown = clean(markdown);
            markdown = modify_links(markdown);

            return Markdown(
              data: markdown,
              imageBuilder: (a, v, b) => SvgPicture.asset(
                a.path,
                semanticsLabel: dir + elem,
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          String a = 'questionAnsField' + "$routenum";
          Navigator.pushNamed(context, a);
        },
      ),
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
      if (curr[i].startsWith("![") && curr[i].endsWith("]")) {
        loc = curr[i].substring(1);
        curr[i] = "![](resource:" + dir + (svg[loc] ?? "") + ")";
      }
    }
    return curr.join();
  }
}

class mul_choise_img_trans_Ans extends StatelessWidget {
  final String dir;
  final String elem;
  late Map<String, String> svg;
  @override
  mul_choise_img_trans_Ans(
    this.dir,
    this.elem,
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
          //markdown =modify_links(markdown);
          return Scaffold(
            appBar: AppBar(
              // Here we take the value from the MyHomePage object that was created by
              // the App.build method, and use it to set our appbar title.
              title: Text("Your Answer"),
            ),
            body: ListView(
              children: question_list(markdown, context),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.pop(context);
              },
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
            j++;
            List<String> list = getAns(current);
            for (int current_ans = 0;
                current_ans < list.length - 1;
                current_ans = current_ans + 2) {
              double width = MediaQuery.of(context).size.width / 1.5;
              double height = MediaQuery.of(context).size.height / 2;
              height > width ? height = width : width = height;
              ret.add(
                UnconstrainedBox(
                  child: TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                    onPressed: () async {
                      String ret = "";
                      String curr = (list[current_ans].substring(1));
                      print(list);
                      curr = svg[curr] ?? "";
                      List<String> wow = await work;
                        String undercase=wow[1];
                      if (curr.length > wow[1].length) {
                        undercase = wow[1].padLeft(curr.length).toLowerCase();
                        curr=curr.toLowerCase();
                      } else {
                        curr = curr.padLeft(undercase.length).toLowerCase();
                        undercase=wow[1].toLowerCase();
                      }
                      int k = str.StringUtils.hammingDistance(curr, undercase);
                      ret = wow[1];
                      for (int i = 0; i < wow.length; i = i + 2) {
                       
                        if (curr.length > wow[i].length) {
                          wow[i] = wow[i].padLeft(curr.length);
                        } else {
                          curr = curr.padLeft(wow[i].length);
                          undercase=wow[i].toLowerCase();
                        }
                        if (k > str.StringUtils.hammingDistance(curr, undercase)) {
                          k = str.StringUtils.hammingDistance(curr, undercase);
                          ret = wow[i+1];
                        }
                      }
                      print(ret);
                    },
                    child: Container(
                      color: (Colors.white),
                      margin: const EdgeInsets.all(10),
                      child: SvgPicture.asset(
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
                curr = current.substring(3);
                print(curr);
              },
              child: Container(
                alignment: Alignment.center,
                color: (Colors.blue),
                margin: const EdgeInsets.all(10),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                      maxHeight: 200,
                      minHeight: 150,
                      maxWidth: 200,
                      minWidth: 150),
                  child: Markdown(
                    data: current.substring(2),
                    selectable: false,
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
    return ret;
  }

  List<String> getAns(String str) {
    List<String> curr = str.split(" ");
    for (int i = 0; i < curr.length; i++) {
      //if (curr[i] != modify_links(curr[i]) && curr[i].contains("!")) {
      //  curr[i - 1] = curr[i];
      //}
      curr[i] = modify_links(curr[i]);
      curr[i] = curr[i].replaceAllMapped(" ", (match) => "");
      if (curr[i].contains("!")) {
        continue;
      }
      if (curr[i].contains(RegExp('[^A-Za-z0-9]'))) {
        continue;
      }
      curr[i] = curr[i].replaceAllMapped(RegExp('[^A-Za-z0-9]'), (match) => '');
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
        curr[i] = dir + (svg[loc] ?? "") + ")"; //"![](resource:" +
      }
    }
    curr.removeWhere(
        (element) => !element.contains(RegExp('[a-z]', caseSensitive: false)));
    return curr.join();
  }

  Future<List<String>> get_svg_ans_name(String String_url) async {
    var url = Uri.parse(
        'https://wettbewerb.informatik-biber.ch/?action=question_standalone&que_id=3862&t=f4692966c4beef6a');
    http.Response data = await http.get(url);
    String loc = data.body;
    print(data.statusCode);
    List<String> test = [];
    List<String> test2 = [];
    List<String> curr = loc.split("\n");
    for (int i = 0; i < curr.length; i++) {
      if (curr[i].contains("answer") && curr[i].contains("hidden")) {
        test.addAll(curr[i].split("img src"));
      }
    }

    for (int i = 1; i < test.length; i++) {
      for (var i in test[i].split("\"")) {
        if (i.contains("SaveAnswer")) {
          int left = i.indexOf("(");
          int right = i.indexOf(")");
          test2.add(i.substring(left + 2, right - 1));
        } else if (i.contains(".svg")) {
          test2.add(i);
        }
      }
    }
    return test2;
  }
}
