import 'dart:io';

import 'package:appthesis/clicable_svg.dart';
import 'package:appthesis/const/routes.dart';
import 'package:appthesis/data_class.dart';
import 'package:appthesis/multiple_choice_with_images_transformator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart'; // BSD-3
import 'package:flutter_svg/flutter_svg.dart'; // MIT d
// this widget stores all questions form where we can acces them this is where we are fetching the questions

class base_widget extends StatelessWidget {
  const base_widget({super.key});
  @override
  Widget build(BuildContext context) {
    //load data has to be here
    return MaterialApp(
      home: Directionality(
        textDirection: TextDirection.ltr,
        child: MediaQuery(
          data: const MediaQueryData(),
          child: _Parent(),
        ),
      ),
      routes: {
         question1: (context) => mul_choise_img_trans(
            "2022-DE-02_Heart_Graphics/", "2022-DE-02-deu.task.md",1),
            //need the def here to find the correct route to ans field
         questionAnsField1: (context) => mul_choise_img_trans_Ans(
            "2022-DE-02_Heart_Graphics/", "2022-DE-02-deu.task.md",1),
        question2: (context) => mul_choise_img_trans(
            "2022-BE-02_Four_Tiles/", "2022-BE-02-deu.task.md",2),
            //need the def here to find the correct route to ans field
         questionAnsField2: (context) => mul_choise_img_trans_Ans(
            "2022-BE-02_Four_Tiles/", "2022-BE-02-deu.task.md",2),
          question3: (context) => mul_choise_img_trans(
            "2022-CA-02_Mysteria/", "2022-CA-02-deu.task.md",3),
            //need the def here to find the correct route to ans field
         questionAnsField3: (context) => mul_choise_img_trans_Ans(
            "2022-CA-02_Mysteria/", "2022-CA-02-deu.task.md",3),
          question4: (context) => clicable_svg_inter(
            "2020-MK-03_Virus/graphics/", "2020-MK-03_taskbody-interactive-interactive.svg",4),
            //need the def here to find the correct route to ans field
         questionAnsField4: (context) => mul_choise_img_trans_Ans(
            "2022-CA-04_Favourite_Gem/", "2022-CA-04-deu.task.md",4),
      },
    );
  }
}

class _Parent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    questionList.add("2022-DE-02_Heart_Graphics/test.md");
    questionList.add("2022-DE-02_Heart_Graphics/test.md");
    questionList.add("2022-DE-02_Heart_Graphics/test.md");
    questionList.add("2022-DE-02_Heart_Graphics/test.md");
    return MaterialApp(
        title: "base_widget",
        home: Scaffold(
          appBar: AppBar(
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            title: const Text("list of all exercises"),
          ),
          body: ListView(
            children: getColumn(context),
          ),
        ));
  }

  List<Widget> getColumn(BuildContext context) {
    int length = questionList.length;
    List<Widget> containers = List.filled(length, const Markdown(data: ""));
    for (int i = 0; i < length; i++) {
      widgetList.add(Data());
      int j=i+1;
      containers[i] = UnconstrainedBox(
        child: TextButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          ),
          onPressed: () {
            int j= i+1;
            Navigator.pushNamed(context, 'question'+'$j');
          },
          child: Container(
            alignment: Alignment.center,
            color: (Colors.blue),
            margin: const EdgeInsets.all(10),
            constraints: const BoxConstraints(
                maxHeight: 200, minHeight: 100, maxWidth: 200, minWidth: 100),
            child: Text(
              '$j', textAlign: TextAlign.center,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black), // have const text
            ),
          ),
        ),
      );
    }
    return containers;
  }
}
