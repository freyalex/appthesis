import 'dart:io';

import 'package:appthesis/clicable_svg.dart';
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
        'question1_de': (context) => mul_choise_img_trans(
            "2022-DE-02_Heart_Graphics/", "2022-DE-02-deu.task.md", 1),
        //need the def here to find the correct route to ans field
        'questionAnsField1_de': (context) => mul_choise_img_trans_Ans(
            "2022-DE-02_Heart_Graphics/", "2022-DE-02-deu.task.md", 1,"b802e67760119fd8",3868),
        'question2_de': (context) => mul_choise_img_trans(
            "2022-BE-02_Four_Tiles/", "2022-BE-02-deu.task.md", 2),
        //need the def here to find the correct route to ans field
        'questionAnsField2_de': (context) => mul_choise_img_trans_Ans(
            "2022-BE-02_Four_Tiles/", "2022-BE-02-deu.task.md", 2,"1780bf0b391778f6",3861),
        'question3_de': (context) => mul_choise_img_trans(
            "2022-CA-02_Mysteria/", "2022-CA-02-deu.task.md", 3),
        //need the def here to find the correct route to ans field
        'questionAnsField3_de': (context) => mul_choise_img_trans_Ans(
            "2022-CA-02_Mysteria/", "2022-CA-02-deu.task.md", 3,"f4692966c4beef6a",3862),
        'question4_de': (context) =>
            clicable_svg("2020-MK-03_Virus/", "2020-MK-03-deu.task.md", 4),
        //need the def her
        //e to find the correct route to ans field
        'questionAnsField4': (context) => clicable_svg_inter(
            "2020-MK-03_Virus/graphics/",
            "2020-MK-03_taskbody-interactive-interactive.svg",
            4),





         'question1_fr': (context) => mul_choise_img_trans(
            "2022-DE-02_Heart_Graphics/", "2022-DE-02-fra.task.md", 1),
        //need the def here to find the correct route to ans field
        'questionAnsField1_fr': (context) => mul_choise_img_trans_Ans(
            "2022-DE-02_Heart_Graphics/", "2022-DE-02-fra.task.md", 1,"a08d246ce19815fe",3938),
        'question2_fr': (context) => mul_choise_img_trans(
            "2022-BE-02_Four_Tiles/", "2022-BE-02-fra.task.md", 2),
        //need the def here to find the correct route to ans field
        'questionAnsField2_fr': (context) => mul_choise_img_trans_Ans(
            "2022-BE-02_Four_Tiles/", "2022-BE-02-fra.task.md", 2,"d8b95897c0df58b6",3931),
        'question3_fr': (context) => mul_choise_img_trans(
            "2022-CA-02_Mysteria/", "2022-CA-02-fra.task.md", 3),
        //need the def here to find the correct route to ans field
        'questionAnsField3_fr': (context) => mul_choise_img_trans_Ans(
            "2022-CA-02_Mysteria/", "2022-CA-02-fra.task.md", 3,"6442ffa922a6589c",3932),
        'question4_fr': (context) =>
            clicable_svg("2020-MK-03_Virus/", "2020-MK-03-fra.task.md", 4),
        //need the def here to find the correct route to ans field
        'questionAnsField4_fr': (context) => clicable_svg_inter(
            "2020-MK-03_Virus/graphics/",
            "2020-MK-03_taskbody-interactive-interactive.svg",
            4),

          'question1_ita': (context) => mul_choise_img_trans(
            "2022-DE-02_Heart_Graphics/", "2022-DE-02-ita.task.md", 1),
        //need the def here to find the correct route to ans field
        'questionAnsField1_ita': (context) => mul_choise_img_trans_Ans(
            "2022-DE-02_Heart_Graphics/", "2022-DE-02-ita.task.md", 1,"eb6321d77eac5e77",3971),
        'question2_ita': (context) => mul_choise_img_trans(
            "2022-BE-02_Four_Tiles/", "2022-BE-02-ita.task.md", 2),
        //need the def here to find the correct route to ans field
        'questionAnsField2_ita': (context) => mul_choise_img_trans_Ans(
            "2022-BE-02_Four_Tiles/", "2022-BE-02-ita.task.md", 2,"cf7b49c46da3eb5c",3964),
        'question3_ita': (context) => mul_choise_img_trans(
            "2022-CA-02_Mysteria/", "2022-CA-02-ita.task.md", 3),
        //need the def here to find the correct route to ans field
        'questionAnsField3_ita': (context) => mul_choise_img_trans_Ans(
            "2022-CA-02_Mysteria/", "2022-CA-02-ita.task.md", 3,"53e490b209f98bef",3965),
        'question4_ita': (context) =>
            clicable_svg("2020-MK-03_Virus/", "2020-MK-03-ita.task.md", 4),
        //need the def here to find the correct route to ans field
        'questionAnsField4_fr': (context) => clicable_svg_inter(
            "2020-MK-03_Virus/graphics/",
            "2020-MK-03_taskbody-interactive-interactive.svg",
            4),
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
      int j = i + 1;
      containers[i] = UnconstrainedBox(
        child: TextButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          ),
          onPressed: () {
            int j = i + 1;
            Navigator.pushNamed(context, 'question' + '$j' + '_' + lang);
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
