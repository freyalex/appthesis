import 'dart:math';

import 'package:appthesis/clicable_svg.dart';
import 'package:appthesis/data_class.dart';
import 'package:appthesis/multiple_choice_with_images_transformator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart'; // BSD-3// MIT d

//12 interactiv //5 6 broken SVG // 9 eignet sich nicht  // 23 ????  // 27 to long //32 bad svg //24 question????? not properly working
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
            "2022-DE-02_Heart_Graphics/",
            "2022-DE-02-deu.task.md",
            1,
            "b802e67760119fd8",
            3868),
        'question2_de': (context) => mul_choise_img_trans(
            "2022-BE-02_Four_Tiles/", "2022-BE-02-deu.task.md", 2),
        //need the def here to find the correct route to ans field
        'questionAnsField2_de': (context) => mul_choise_img_trans_Ans(
            "2022-BE-02_Four_Tiles/",
            "2022-BE-02-deu.task.md",
            2,
            "1780bf0b391778f6",
            3861),
        'question3_de': (context) => mul_choise_img_trans(
            "2022-CA-02_Mysteria/", "2022-CA-02-deu.task.md", 3),
        //need the def here to find the correct route to ans field
        'questionAnsField3_de': (context) => mul_choise_img_trans_Ans(
            "2022-CA-02_Mysteria/",
            "2022-CA-02-deu.task.md",
            3,
            "f4692966c4beef6a",
            3862),
        'question4_de': (context) =>
            clicable_svg("2020-MK-03_Virus/", "2020-MK-03-deu.task.md", 4),
        //need the def her
        //e to find the correct route to ans field
        'questionAnsField4': (context) => clicable_svg_inter(
            "2020-MK-03_Virus/graphics/",
            "2020-MK-03_taskbody-interactive-interactive.svg",
            4,
            "411012285942d43f",
            3509),
        'question1_fr': (context) => mul_choise_img_trans(
            "2022-DE-02_Heart_Graphics/", "2022-DE-02-fra.task.md", 1),
        //need the def here to find the correct route to ans field
        'questionAnsField1_fr': (context) => mul_choise_img_trans_Ans(
            "2022-DE-02_Heart_Graphics/",
            "2022-DE-02-fra.task.md",
            1,
            "a08d246ce19815fe",
            3938),
        'question2_fr': (context) => mul_choise_img_trans(
            "2022-BE-02_Four_Tiles/", "2022-BE-02-fra.task.md", 2),
        //need the def here to find the correct route to ans field
        'questionAnsField2_fr': (context) => mul_choise_img_trans_Ans(
            "2022-BE-02_Four_Tiles/",
            "2022-BE-02-fra.task.md",
            2,
            "d8b95897c0df58b6",
            3931),
        'question3_fr': (context) => mul_choise_img_trans(
            "2022-CA-02_Mysteria/", "2022-CA-02-fra.task.md", 3),
        //need the def here to find the correct route to ans field
        'questionAnsField3_fr': (context) => mul_choise_img_trans_Ans(
            "2022-CA-02_Mysteria/",
            "2022-CA-02-fra.task.md",
            3,
            "6442ffa922a6589c",
            3932),
        'question4_fr': (context) =>
            clicable_svg("2020-MK-03_Virus/", "2020-MK-03-fra.task.md", 4),
        //need the def here to find the correct route to ans field
        'questionAnsField4_fr': (context) => clicable_svg_inter(
            "2020-MK-03_Virus/graphics/",
            "2020-MK-03_taskbody-interactive-interactive.svg",
            4,
            "411012285942d43f",
            3509),

        'question1_ita': (context) => mul_choise_img_trans(
            "2022-DE-02_Heart_Graphics/", "2022-DE-02-ita.task.md", 1),
        //need the def here to find the correct route to ans field
        'questionAnsField1_ita': (context) => mul_choise_img_trans_Ans(
            "2022-DE-02_Heart_Graphics/",
            "2022-DE-02-ita.task.md",
            1,
            "eb6321d77eac5e77",
            3971),
        'question2_ita': (context) => mul_choise_img_trans(
            "2022-BE-02_Four_Tiles/", "2022-BE-02-ita.task.md", 2),
        //need the def here to find the correct route to ans field
        'questionAnsField2_ita': (context) => mul_choise_img_trans_Ans(
            "2022-BE-02_Four_Tiles/",
            "2022-BE-02-ita.task.md",
            2,
            "cf7b49c46da3eb5c",
            3964),
        'question3_ita': (context) => mul_choise_img_trans(
            "2022-CA-02_Mysteria/", "2022-CA-02-ita.task.md", 3),
        //need the def here to find the correct route to ans field
        'questionAnsField3_ita': (context) => mul_choise_img_trans_Ans(
            "2022-CA-02_Mysteria/",
            "2022-CA-02-ita.task.md",
            3,
            "53e490b209f98bef",
            3965),
        'question4_ita': (context) =>
            clicable_svg("2020-MK-03_Virus/", "2020-MK-03-ita.task.md", 4),
        //need the def here to find the correct route to ans field
        'questionAnsField4_ita': (context) => clicable_svg_inter(
            "2020-MK-03_Virus/graphics/",
            "2020-MK-03_taskbody-interactive-interactive.svg",
            4,
            "411012285942d43f",
            3509),

        'question5_de': (context) => mul_choise_img_trans(
            "2020-AT-01_Growing_Plants/", "2020-AT-01-deu.task.md", 5),
        'questionAnsField5_de': (context) => mul_choise_img_trans_Ans(
            "2020-AT-01_Growing_Plants/",
            "2020-AT-01-deu.task.md",
            5,
            "fa83203570e6fba3",
            3523),

        'question5_fr': (context) => mul_choise_img_trans(
            "2020-AT-01_Growing_Plants/", "2020-AT-01-fra.task.md", 5),
        'questionAnsField5_fr': (context) => mul_choise_img_trans_Ans(
            "2020-AT-01_Growing_Plants/",
            "2020-AT-01-fra.task.md",
            5,
            "09541cc227090a2f",
            3604),

        'question5_ita': (context) => mul_choise_img_trans(
            "2020-AT-01_Growing_Plants/", "2020-AT-01-ita.task.md", 5),
        'questionAnsField5_ita': (context) => mul_choise_img_trans_Ans(
            "2020-AT-01_Growing_Plants/",
            "2020-AT-01-ita.task.md",
            5,
            "004a409522467825",
            3539),

        'question6_de': (context) => mul_choise_img_trans(
            "2020-BE-03_Stars_and_moons/", "2020-BE-03-deu.task.md", 6),
        'questionAnsField6_de': (context) => mul_choise_img_trans_Ans(
            "2020-BE-03_Stars_and_moons/",
            "2020-BE-03-deu.task.md",
            6,
            "67daaa61cebabfc4",
            3524),

        'question6_fr': (context) => mul_choise_img_trans(
            "2020-BE-03_Stars_and_moons/", "2020-BE-03-fra.task.md", 6),
        'questionAnsField6_fr': (context) => mul_choise_img_trans_Ans(
            "2020-AT-01_Growing_Plants/",
            "2020-AT-01-fra.task.md",
            6,
            "32290edc2fb79644",
            3605),

        'question6_ita': (context) => mul_choise_img_trans(
            "2020-BE-03_Stars_and_moons/", "2020-BE-03-ita.task.md", 6),
        'questionAnsField6_ita': (context) => mul_choise_img_trans_Ans(
            "2020-AT-01_Growing_Plants/",
            "2020-AT-01-ita.task.md",
            6,
            "49fd143a9a9fc295",
            3540),

        'question7_de': (context) => mul_choise_img_trans(
            "2020-CH-01c_Formal_Languages/", "2020-CH-01c-deu.task.md", 7),
        'questionAnsField7_de': (context) => mul_choise_img_trans_Ans(
            "2020-CH-01c_Formal_Languages/",
            "2020-CH-01c-deu.task.md",
            7,
            "6e26e8a6de8c7bec",
            3517),

        'question7_fr': (context) => mul_choise_img_trans(
            "2020-CH-01c_Formal_Languages/", "2020-CH-01c-fra.task.md", 7),
        'questionAnsField7_fr': (context) => mul_choise_img_trans_Ans(
            "2020-CH-01c_Formal_Languages/",
            "2020-CH-01c-fra.task.md",
            7,
            "8cdbc00482561bb6",
            3598),

        'question7_ita': (context) => mul_choise_img_trans(
            "2020-CH-01c_Formal_Languages/", "2020-CH-01c-ita.task.md", 7),
        'questionAnsField7_ita': (context) => mul_choise_img_trans_Ans(
            "2020-CH-01c_Formal_Languages/",
            "2020-CH-01c-ita.task.md",
            7,
            "8b5d027f58bb4326",
            3536),

        'question8_de': (context) => mul_choise_img_trans(
            "2020-CH-03a_Damaged_Secret_Table/", "2020-CH-03a-deu.task.md", 8),
        'questionAnsField8_de': (context) => mul_choise_img_trans_Ans(
            "2020-CH-03a_Damaged_Secret_Table/",
            "2020-CH-03a-deu.task.md",
            8,
            "2171c40ac6899763",
            3525),

        'question8_fr': (context) => mul_choise_img_trans(
            "2020-CH-03a_Damaged_Secret_Table/", "2020-CH-03a-fra.task.md", 8),
        'questionAnsField8_fr': (context) => mul_choise_img_trans_Ans(
            "2020-CH-03a_Damaged_Secret_Table/",
            "2020-CH-03a-fra.task.md",
            8,
            "25f42e259d54d1a8",
            3606),

        'question8_ita': (context) => mul_choise_img_trans(
            "2020-CH-03a_Damaged_Secret_Table/", "2020-CH-03a-ita.task.md", 8),
        'questionAnsField8_ita': (context) => mul_choise_img_trans_Ans(
            "2020-CH-03a_Damaged_Secret_Table/",
            "2020-CH-03a-ita.task.md",
            8,
            "ef1771426e25b452",
            3541),

        'question9_de': (context) => mul_choise_img_trans(
            "2020-CH-07_Beaver_at_the_Castle/", "2020-CH-07-deu.task.md", 9),
        'questionAnsField9_de': (context) => mul_choise_img_trans_Ans(
            "2020-CH-07_Beaver_at_the_Castle/",
            "2020-CH-07-deu.task.md",
            9,
            "1dce0f586f25e5e4",
            3526),

        'question9_fr': (context) => mul_choise_img_trans(
            "2020-CH-07_Beaver_at_the_Castle/", "2020-CH-07-fra.task.md", 9),
        'questionAnsField9_fr': (context) => mul_choise_img_trans_Ans(
            "2020-CH-07_Beaver_at_the_Castle/",
            "2020-CH-07-fra.task.md",
            9,
            "2cf214663d8309ce",
            3607),

        'question9_ita': (context) => mul_choise_img_trans(
            "2020-CH-07_Beaver_at_the_Castle/", "2020-CH-07-ita.task.md", 9),
        'questionAnsField9_ita': (context) => mul_choise_img_trans_Ans(
            "2020-CH-07_Beaver_at_the_Castle/",
            "2020-CH-07-ita.task.md",
            9,
            "747c56877c2fc3bc",
            3542),

        'question10_de': (context) => mul_choise_img_trans(
            "2020-CH-09b_Secret_Digits/", "2020-CH-09b-deu.task.md", 10),
        'questionAnsField10_de': (context) => mul_choise_img_trans_Ans(
            "2020-CH-09b_Secret_Digits/",
            "2020-CH-09b-deu.task.md",
            10,
            "19f7099288900788",
            3527),

        'question10_fr': (context) => mul_choise_img_trans(
            "2020-CH-09b_Secret_Digits/", "2020-CH-09b-fra.task.md", 10),
        'questionAnsField10_fr': (context) => mul_choise_img_trans_Ans(
            "2020-CH-09b_Secret_Digits/",
            "2020-CH-09b-fra.task.md",
            10,
            "6d35efb355a5eaf7",
            3608),

        'question10_ita': (context) => mul_choise_img_trans(
            "2020-CH-09b_Secret_Digits/", "2020-CH-09b-fra.task.md", 10),
        'questionAnsField10_ita': (context) => mul_choise_img_trans_Ans(
            "2020-CH-09b_Secret_Digits/",
            "2020-CH-09b-fra.task.md",
            10,
            "a807dbee40d75d8c",
            3543),

        'question11_de': (context) => mul_choise_img_trans(
            "2020-CH-15_Water_Taxi/", "2020-CH-15-deu.task.md", 11),
        'questionAnsField11_de': (context) => mul_choise_img_trans_Ans(
            "2020-CH-15_Water_Taxi/",
            "2020-CH-15-deu.task.md",
            11,
            "8c5b105a8d439a7b",
            3528),

        'question11_fr': (context) => mul_choise_img_trans(
            "2020-CH-15_Water_Taxi/", "2020-CH-15-fra.task.md", 11),
        'questionAnsField11_fr': (context) => mul_choise_img_trans_Ans(
            "2020-CH-15_Water_Taxi/",
            "2020-CH-15-fra.task.md",
            11,
            "8ac7eac6f29fa9af",
            3609),

        'question11_ita': (context) => mul_choise_img_trans(
            "2020-CH-15_Water_Taxi/", "2020-CH-15-ita.task.md", 11),
        'questionAnsField11_ita': (context) => mul_choise_img_trans_Ans(
            "2020-CH-15_Water_Taxi/",
            "2020-CH-15-ita.task.md",
            11,
            "cacb4e1dadee189a",
            3544),

        'question12_de': (context) => mul_choise_img_trans(
            "2020-CH-18_Relax/", "2020-CH-18-deu.task.md", 12),
        'questionAnsField12_de': (context) => mul_choise_img_trans_Ans(
            "2020-CH-18_Relax/",
            "2020-CH-18-deu.task.md",
            12,
            "68326cf49b0da068",
            3522),

        'question12_fr': (context) => mul_choise_img_trans(
            "2020-CH-18_Relax/", "2020-CH-18-fra.task.md", 12),
        'questionAnsField12_fr': (context) => mul_choise_img_trans_Ans(
            "2020-CH-18_Relax/",
            "2020-CH-18-fra.task.md",
            12,
            "6ab328e51b2c9cd7",
            3603),

        'question12_ita': (context) => mul_choise_img_trans(
            "2020-CH-18_Relax/", "2020-CH-18-ita.task.md", 12),
        'questionAnsField12_ita': (context) => mul_choise_img_trans_Ans(
            "2020-CH-18_Relax/",
            "2020-CH-18-ita.task.md",
            12,
            "c9728495f8031a77",
            3564),

        'question13_de': (context) => mul_choise_img_trans(
            "2020-CH-21_Exhibition_Tour/", "2020-CH-21-deu.task.md", 13),
        'questionAnsField13_de': (context) => mul_choise_img_trans_Ans(
            "2020-CH-21_Exhibition_Tour/",
            "2020-CH-21-deu.task.md",
            13,
            "6c635184a6978f2b",
            3529),

        'question13_fr': (context) => mul_choise_img_trans(
            "2020-CH-21_Exhibition_Tour/", "2020-CH-21-fra.task.md", 13),
        'questionAnsField13_fr': (context) => mul_choise_img_trans_Ans(
            "2020-CH-21_Exhibition_Tour/",
            "2020-CH-21-fra.task.md",
            13,
            "a9078cdc6fa85714",
            3610),

        'question13_ita': (context) => mul_choise_img_trans(
            "2020-CH-21_Exhibition_Tour/", "2020-CH-21-ita.task.md", 13),
        'questionAnsField13_ita': (context) => mul_choise_img_trans_Ans(
            "2020-CH-21_Exhibition_Tour/",
            "2020-CH-21-ita.task.md",
            13,
            "c3eb14852e71f32f",
            3545),

        'question14_de': (context) => mul_choise_img_trans(
            "2020-CN-04_Jigsaw_puzzle/", "2020-CN-04-deu.task.md", 14),
        'questionAnsField14_de': (context) => mul_choise_img_trans_Ans(
            "2020-CN-04_Jigsaw_puzzle/",
            "2020-CN-04-deu.task.md",
            14,
            "2ba4728ff3c690ff",
            3530),

        'question14_fr': (context) => mul_choise_img_trans(
            "2020-CN-04_Jigsaw_puzzle/", "2020-CN-04-fra.task.md", 14),
        'questionAnsField14_fr': (context) => mul_choise_img_trans_Ans(
            "2020-CN-04_Jigsaw_puzzle/",
            "2020-CN-04-fra.task.md",
            14,
            "a727fde4e1ceb3cf",
            3611),

        'question14_ita': (context) => mul_choise_img_trans(
            "2020-CN-04_Jigsaw_puzzle/", "2020-CN-04-ita.task.md", 14),
        'questionAnsField14_ita': (context) => mul_choise_img_trans_Ans(
            "2020-CN-04_Jigsaw_puzzle/",
            "2020-CN-04-ita.task.md",
            14,
            "8cc9c90582da24f6",
            3546),

        'question15_de': (context) => mul_choise_img_trans(
            "2020-ID-04_DNA/", "2020-ID-04-deu.task.md", 15),
        'questionAnsField15_de': (context) => mul_choise_img_trans_Ans(
            "2020-ID-04_DNA/",
            "2020-ID-04-deu.task.md",
            15,
            "c342cd10fc68a684",
            3531),

        'question15_fr': (context) => mul_choise_img_trans(
            "2020-ID-04_DNA/", "2020-ID-04-fra.task.md", 15),
        'questionAnsField15_fr': (context) => mul_choise_img_trans_Ans(
            "2020-ID-04_DNA/",
            "2020-ID-04-fra.task.md",
            15,
            "751ff50e6c1a1783",
            3612),

        'question15_ita': (context) => mul_choise_img_trans(
            "2020-ID-04_DNA/", "2020-ID-04-ita.task.md", 15),
        'questionAnsField15_ita': (context) => mul_choise_img_trans_Ans(
            "2020-ID-04_DNA/",
            "2020-ID-04-ita.task.md",
            15,
            "f42c651508f1d4ec",
            3547),

        'question16_de': (context) => mul_choise_img_trans(
            "2020-IE-09_Bowls/", "2020-IE-09-deu.task.md", 16),
        'questionAnsField16_de': (context) => mul_choise_img_trans_Ans(
            "2020-IE-09_Bowls/",
            "2020-IE-09-deu.task.md",
            16,
            "d774bd8738798b14",
            3532),

        'question16_fr': (context) => mul_choise_img_trans(
            "2020-IE-09_Bowls/", "2020-IE-09-fra.task.md", 16),
        'questionAnsField16_fr': (context) => mul_choise_img_trans_Ans(
            "2020-IE-09_Bowls/",
            "2020-IE-09-fra.task.md",
            16,
            "b48e7340943a2182",
            3613),

        'question16_ita': (context) => mul_choise_img_trans(
            "2020-IE-09_Bowls/", "2020-IE-09-ita.task.md", 16),
        'questionAnsField16_ita': (context) => mul_choise_img_trans_Ans(
            "2020-IE-09_Bowls/",
            "2020-IE-09-ita.task.md",
            16,
            "bd1553807ce3def8",
            3548),

        'question17_de': (context) => mul_choise_img_trans(
            "2020-IN-26_Snakes_and_Ladders/", "2020-IN-26-deu.task.md", 17),
        'questionAnsField17_de': (context) => mul_choise_img_trans_Ans(
            "2020-IN-26_Snakes_and_Ladders/",
            "2020-IN-26-deu.task.md",
            17,
            "70f9f30a4fea3c70",
            3533),

        'question17_fr': (context) => mul_choise_img_trans(
            "2020-IN-26_Snakes_and_Ladders/", "2020-IN-26-fra.task.md", 17),
        'questionAnsField17_fr': (context) => mul_choise_img_trans_Ans(
            "2020-IN-26_Snakes_and_Ladders/",
            "2020-IN-26-fra.task.md",
            17,
            "750e8e865bc15e1b",
            3614),

        'question17_ita': (context) => mul_choise_img_trans(
            "2020-IN-26_Snakes_and_Ladders/", "2020-IN-26-ita.task.md", 17),
        'questionAnsField17_ita': (context) => mul_choise_img_trans_Ans(
            "2020-IN-26_Snakes_and_Ladders/",
            "2020-IN-26-ita.task.md",
            17,
            "67e7cbf92c4a426d",
            3549),

        'question18_de': (context) => mul_choise_img_trans(
            "2020-IR-03_Money_Bags/", "2020-IR-03-deu.task.md", 18),
        'questionAnsField18_de': (context) => mul_choise_img_trans_Ans(
            "2020-IR-03_Money_Bags/",
            "2020-IR-03-deu.task.md",
            18,
            "457db5d3fba8cfcd",
            3534),

        'question18_fr': (context) => mul_choise_img_trans(
            "2020-IR-03_Money_Bags/", "2020-IR-03-fra.task.md", 18),
        'questionAnsField18_fr': (context) => mul_choise_img_trans_Ans(
            "2020-IR-03_Money_Bags/",
            "2020-IR-03-fra.task.md",
            18,
            "49f666c1b6c9c694",
            3615),

        'question18_ita': (context) => mul_choise_img_trans(
            "2020-IR-03_Money_Bags/", "2020-IR-03-ita.task.md", 18),
        'questionAnsField18_ita': (context) => mul_choise_img_trans_Ans(
            "2020-IR-03_Money_Bags/",
            "2020-IR-03-ita.task.md",
            18,
            "23f46f5ed578fa1f",
            3550),

        'question19_de': (context) => mul_choise_img_trans(
            "2020-IS-02_Teddy_Bear_hunt/", "2020-IS-02-deu.task.md", 19),
        'questionAnsField19_de': (context) => mul_choise_img_trans_Ans(
            "2020-IS-02_Teddy_Bear_hunt/",
            "2020-IS-02-deu.task.md",
            19,
            "7f0f70929e98f364",
            3551),

        'question19_fr': (context) => mul_choise_img_trans(
            "2020-IS-02_Teddy_Bear_hunt/", "2020-IS-02-fra.task.md", 19),
        'questionAnsField19_fr': (context) => mul_choise_img_trans_Ans(
            "2020-IS-02_Teddy_Bear_hunt/",
            "2020-IS-02-fra.task.md",
            19,
            "3d54eb06743faf47",
            3616),

        'question19_ita': (context) => mul_choise_img_trans(
            "2020-IS-02_Teddy_Bear_hunt/", "2020-IS-02-ita.task.md", 19),
        'questionAnsField19_ita': (context) => mul_choise_img_trans_Ans(
            "2020-IS-02_Teddy_Bear_hunt/",
            "2020-IS-02-ita.task.md",
            19,
            "8a04741468cbc961",
            3567),

        'question20_de': (context) => mul_choise_img_trans(
            "2020-JP-04_Heaviest_mark/", "2020-JP-04-deu.task.md", 20),
        'questionAnsField20_de': (context) => mul_choise_img_trans_Ans(
            "2020-JP-04_Heaviest_mark/",
            "2020-JP-04-deu.task.md",
            20,
            "323e7d6c0984fc84",
            3552),

        'question20_fr': (context) => mul_choise_img_trans(
            "2020-JP-04_Heaviest_mark/", "2020-JP-04-fra.task.md", 20),
        'questionAnsField20_fr': (context) => mul_choise_img_trans_Ans(
            "2020-JP-04_Heaviest_mark/",
            "2020-JP-04-fra.task.md",
            20,
            "79131aa012da9192",
            3617),

        'question20_ita': (context) => mul_choise_img_trans(
            "2020-JP-04_Heaviest_mark/", "2020-JP-04-ita.task.md", 20),
        'questionAnsField20_ita': (context) => mul_choise_img_trans_Ans(
            "2020-JP-04_Heaviest_mark/",
            "2020-JP-04-ita.task.md",
            20,
            "3ce3bf168693a28f",
            3570),

        'question21_de': (context) => mul_choise_img_trans(
            "2020-LT-01_Jumping_Kangaroo/", "2020-LT-01-deu.task.md", 21),
        'questionAnsField21_de': (context) => mul_choise_img_trans_Ans(
            "2020-LT-01_Jumping_Kangaroo/",
            "2020-LT-01-deu.task.md",
            21,
            "a7c407ccebafde97",
            3553),

        'question21_fr': (context) => mul_choise_img_trans(
            "2020-LT-01_Jumping_Kangaroo/", "2020-LT-01-fra.task.md", 21),
        'questionAnsField21_fr': (context) => mul_choise_img_trans_Ans(
            "2020-LT-01_Jumping_Kangaroo/",
            "2020-LT-01-fra.task.md",
            21,
            "4e60ce9bf30bfe21",
            3618),

        'question21_ita': (context) => mul_choise_img_trans(
            "2020-LT-01_Jumping_Kangaroo/", "2020-LT-01-ita.task.md", 21),
        'questionAnsField21_ita': (context) => mul_choise_img_trans_Ans(
            "2020-LT-01_Jumping_Kangaroo/",
            "2020-LT-01-ita.task.md",
            21,
            "585cba28eac26f75",
            3571),

        'question22_de': (context) => mul_choise_img_trans(
            "2020-LT-05_Five_Beavers/", "2020-LT-05-deu.task.md", 22),
        'questionAnsField22_de': (context) => mul_choise_img_trans_Ans(
            "2020-LT-05_Five_Beavers/",
            "2020-LT-05-deu.task.md",
            22,
            "1b7c061ffcc8cb7a",
            3554),

        'question22_fr': (context) => mul_choise_img_trans(
            "2020-LT-05_Five_Beavers/", "2020-LT-05-fra.task.md", 22),
        'questionAnsField22_fr': (context) => mul_choise_img_trans_Ans(
            "2020-LT-05_Five_Beavers/",
            "2020-LT-05-fra.task.md",
            22,
            "37548f4844561ab4",
            3619),

        'question22_ita': (context) => mul_choise_img_trans(
            "2020-LT-05_Five_Beavers/", "2020-LT-05-ita.task.md", 22),
        'questionAnsField22_ita': (context) => mul_choise_img_trans_Ans(
            "2020-LT-05_Five_Beavers/",
            "2020-LT-05-ita.task.md",
            22,
            "57f3e5a0e86e8599",
            3572),

        'question23_de': (context) => mul_choise_img_trans(
            "2020-LT-06_Robot_Parking/", "2020-LT-06-deu.task.md", 23),
        'questionAnsField23_de': (context) => mul_choise_img_trans_Ans(
            "2020-LT-06_Robot_Parking/",
            "2020-LT-06-deu.task.md",
            23,
            "6c8dd36126c78bc5",
            3555),

        'question23_fr': (context) => mul_choise_img_trans(
            "2020-LT-06_Robot_Parking/", "2020-LT-06-fra.task.md", 23),
        'questionAnsField23_fr': (context) => mul_choise_img_trans_Ans(
            "2020-LT-06_Robot_Parking/",
            "2020-LT-06-fra.task.md",
            23,
            "ec33ef537019be37",
            3620),

        'question23_ita': (context) => mul_choise_img_trans(
            "2020-LT-06_Robot_Parking/", "2020-LT-06-ita.task.md", 23),
        'questionAnsField23_ita': (context) => mul_choise_img_trans_Ans(
            "2020-LT-06_Robot_Parking/",
            "2020-LT-06-ita.task.md",
            23,
            "356370e5d7bf1f1f",
            3573),

        'question24_de': (context) => mul_choise_img_trans(
            "2020-PK-02_Log_Classifier_v2/", "2020-PK-02-deu.task.md", 24),
        'questionAnsField24_de': (context) => mul_choise_img_trans_Ans(
            "2020-PK-02_Log_Classifier_v2/",
            "2020-PK-02-deu.task.md",
            24,
            "886a7891ed55fd8f",
            3556),

        'question24_fr': (context) => mul_choise_img_trans(
            "2020-PK-02_Log_Classifier_v2/", "2020-PK-02-fra.task.md", 24),
        'questionAnsField24_fr': (context) => mul_choise_img_trans_Ans(
            "2020-PK-02_Log_Classifier_v2/",
            "2020-PK-02-fra.task.md",
            24,
            "dd201906976df56f",
            3621),

        'question24_ita': (context) => mul_choise_img_trans(
            "2020-PK-02_Log_Classifier_v2/", "2020-PK-02-ita.task.md", 24),
        'questionAnsField24_ita': (context) => mul_choise_img_trans_Ans(
            "2020-PK-02_Log_Classifier_v2/",
            "2020-PK-02-ita.task.md",
            24,
            "7d837da1f2f396e8",
            3575),

        'question25_de': (context) => mul_choise_img_trans(
            "2020-PK-03_Magic_Potions/", "2020-PK-03-deu.task.md", 25),
        'questionAnsField25_de': (context) => mul_choise_img_trans_Ans(
            "2020-PK-03_Magic_Potions/",
            "2020-PK-03-deu.task.md",
            25,
            "4780169a7005b7e7",
            3557),

        'question25_fr': (context) => mul_choise_img_trans(
            "2020-PK-03_Magic_Potions/", "2020-PK-03-fra.task.md", 25),
        'questionAnsField25_fr': (context) => mul_choise_img_trans_Ans(
            "2020-PK-03_Magic_Potions/",
            "2020-PK-03-fra.task.md",
            25,
            "80dcdc5d5117519c",
            3576),

        'question25_ita': (context) => mul_choise_img_trans(
            "2020-PK-03_Magic_Potions/", "2020-PK-03-ita.task.md", 25),
        'questionAnsField25_ita': (context) => mul_choise_img_trans_Ans(
            "2020-PK-03_Magic_Potions/",
            "2020-PK-03-ita.task.md",
            25,
            "5da4b8d749468aac",
            3622),

        'question26_de': (context) => mul_choise_img_trans(
            "2020-SI-01_Train_trip/", "2020-SI-01-deu.task.md", 26),
        'questionAnsField26_de': (context) => mul_choise_img_trans_Ans(
            "2020-SI-01_Train_trip/",
            "2020-SI-01-deu.task.md",
            26,
            "48f2d6a41638eabc",
            3558),

        'question26_fr': (context) => mul_choise_img_trans(
            "2020-SI-01_Train_trip/", "2020-SI-01-fra.task.md", 26),
        'questionAnsField26_fr': (context) => mul_choise_img_trans_Ans(
            "2020-SI-01_Train_trip/",
            "2020-SI-01-fra.task.md",
            26,
            "78083ff05525530b",
            3623),

        'question26_ita': (context) => mul_choise_img_trans(
            "2020-SI-01_Train_trip/", "2020-SI-01-ita.task.md", 26),
        'questionAnsField26_ita': (context) => mul_choise_img_trans_Ans(
            "2020-SI-01_Train_trip/",
            "2020-SI-01-ita.task.md",
            26,
            "79939b4e3448890a",
            3579),

        'question27_de': (context) => mul_choise_img_trans(
            "2020-SK-01_theater_performance/", "2020-SK-01-deu.task.md", 27),
        'questionAnsField27_de': (context) => mul_choise_img_trans_Ans(
            "2020-SK-01_theater_performance/",
            "2020-SK-01-deu.task.md",
            27,
            "7d2364458f3fb981",
            3559),

        'question27_fr': (context) => mul_choise_img_trans(
            "2020-SK-01_theater_performance/", "2020-SK-01-fra.task.md", 27),
        'questionAnsField27_fr': (context) => mul_choise_img_trans_Ans(
            "2020-SK-01_theater_performance/",
            "2020-SK-01-fra.task.md",
            27,
            "9d2849257abc41b2",
            3624),

        'question27_ita': (context) => mul_choise_img_trans(
            "2020-SK-01_theater_performance/", "2020-SK-01-ita.task.md", 27),
        'questionAnsField27_ita': (context) => mul_choise_img_trans_Ans(
            "2020-SK-01_theater_performance/",
            "2020-SK-01-ita.task.md",
            27,
            "1789c217dd49c940",
            3580),

        'question28_de': (context) => mul_choise_img_trans(
            "2020-SK-02_towns_and_highways/", "2020-SK-02-deu.task.md", 28),
        'questionAnsField28_de': (context) => mul_choise_img_trans_Ans(
            "2020-SK-02_towns_and_highways/",
            "2020-SK-02-deu.task.md",
            28,
            "04e597099e3104e1",
            3560),

        'question28_fr': (context) => mul_choise_img_trans(
            "2020-SK-02_towns_and_highways/", "2020-SK-02-fra.task.md", 28),
        'questionAnsField28_fr': (context) => mul_choise_img_trans_Ans(
            "2020-SK-02_towns_and_highways/",
            "2020-SK-02-fra.task.md",
            28,
            "67efcc16c42dee10",
            3625),

        'question28_ita': (context) => mul_choise_img_trans(
            "2020-SK-02_towns_and_highways/", "2020-SK-02-ita.task.md", 28),
        'questionAnsField28_ita': (context) => mul_choise_img_trans_Ans(
            "2020-SK-02_towns_and_highways/",
            "2020-SK-02-ita.task.md",
            28,
            "5c8c09fc08941157",
            3581),

        'question29_de': (context) => mul_choise_img_trans(
            "2020-VN-04_Marbles_and_Boxes/", "2020-VN-04-deu.task.md", 29),
        'questionAnsField29_de': (context) => mul_choise_img_trans_Ans(
            "2020-VN-04_Marbles_and_Boxes/",
            "2020-VN-04-deu.task.md",
            29,
            "cc502d062ea76162",
            3561),

        'question29_fr': (context) => mul_choise_img_trans(
            "2020-VN-04_Marbles_and_Boxes/", "2020-VN-04-fra.task.md", 29),
        'questionAnsField29_fr': (context) => mul_choise_img_trans_Ans(
            "2020-VN-04_Marbles_and_Boxes/",
            "2020-VN-04-fra.task.md",
            29,
            "2dede4deef4ce1d3",
            3626),

        'question29_ita': (context) => mul_choise_img_trans(
            "2020-VN-04_Marbles_and_Boxes/", "2020-VN-04-ita.task.md", 29),
        'questionAnsField29_ita': (context) => mul_choise_img_trans_Ans(
            "2020-VN-04_Marbles_and_Boxes/",
            "2020-VN-04-ita.task.md",
            29,
            "5571551d9a117c2a",
            3587),

        'question30_de': (context) => mul_choise_img_trans(
            "2021-AT-04_Hashing/", "2021-AT-04-deu.task.md", 30),
        'questionAnsField30_de': (context) => mul_choise_img_trans_Ans(
            "2021-AT-04_Hashing/",
            "2021-AT-04-deu.task.md",
            30,
            "6b118501fab8a9d6",
            3667),

        'question30_fr': (context) => mul_choise_img_trans(
            "2021-AT-04_Hashing/", "2021-AT-04-fra.task.md", 30),
        'questionAnsField30_fr': (context) => mul_choise_img_trans_Ans(
            "2021-AT-04_Hashing/",
            "2021-AT-04-fra.task.md",
            30,
            "4af898a233adb257",
            3702),

        'question30_ita': (context) => mul_choise_img_trans(
            "2021-AT-04_Hashing/", "2021-AT-04-ita.task.md", 30),
        'questionAnsField30_ita': (context) => mul_choise_img_trans_Ans(
            "2021-AT-04_Hashing/",
            "2021-AT-04-fra.task.md",
            30,
            "a16e37b79fe188ef",
            3789),

        'question31_de': (context) => mul_choise_img_trans(
            "2021-CA-02_Spider_Quilts/", "2021-CA-02-deu.task.md", 31),
        'questionAnsField31_de': (context) => mul_choise_img_trans_Ans(
            "2021-CA-02_Spider_Quilts/",
            "2021-CA-02-deu.task.md",
            31,
            "5eb96bcfc9d5fae8",
            3670),

        'question31_fr': (context) => mul_choise_img_trans(
            "2021-CA-02_Spider_Quilts/", "2021-CA-02-fra.task.md", 31),
        'questionAnsField31_fr': (context) => mul_choise_img_trans_Ans(
            "2021-CA-02_Spider_Quilts/",
            "2021-CA-02-fra.task.md",
            31,
            "9d21bae5fa644972",
            3705),

        'question31_ita': (context) => mul_choise_img_trans(
            "2021-CA-02_Spider_Quilts/", "2021-CA-02-ita.task.md", 31),
        'questionAnsField31_ita': (context) => mul_choise_img_trans_Ans(
            "2021-CA-02_Spider_Quilts/",
            "2021-CA-02-ita.task.md",
            31,
            "ea0053ad7ed1763a",
            3792),

        'question32_de': (context) => mul_choise_img_trans(
            "2021-CH-07a_Calculating_with_hats/",
            "2021-CH-07a-deu.task.md",
            32),
        'questionAnsField32_de': (context) => mul_choise_img_trans_Ans(
            "2021-CH-07a_Calculating_with_hats/",
            "2021-CH-07a-deu.task.md",
            32,
            "b3df4e10d4ec0209",
            3671),

        'question32_fr': (context) => mul_choise_img_trans(
            "2021-CH-07a_Calculating_with_hats/",
            "2021-CH-07a-fra.task.md",
            32),
        'questionAnsField32_fr': (context) => mul_choise_img_trans_Ans(
            "2021-CH-07a_Calculating_with_hats/",
            "2021-CH-07a-fra.task.md",
            32,
            "f9c8881ade7a09b9",
            3707),

        'question32_ita': (context) => mul_choise_img_trans(
            "2021-CH-07a_Calculating_with_hats/",
            "2021-CH-07a-ita.task.md",
            32),
        'questionAnsField32_ita': (context) => mul_choise_img_trans_Ans(
            "2021-CH-07a_Calculating_with_hats/",
            "2021-CH-07a-ita.task.md",
            32,
            "770abff6db8cdce8",
            3794),

        'question33_de': (context) => mul_choise_img_trans(
            "2021-DE-07_Turtle_Path/", "2021-DE-07-deu.task.md", 33),
        'questionAnsField33_de': (context) => mul_choise_img_trans_Ans(
            "2021-DE-07_Turtle_Path/",
            "2021-DE-07-deu.task.md",
            33,
            "e388b5bcaea5fe07",
            3677),

        'question33_fr': (context) => mul_choise_img_trans(
            "2021-DE-07_Turtle_Path/", "2021-DE-07-fra.task.md", 33),
        'questionAnsField33_fr': (context) => mul_choise_img_trans_Ans(
            "2021-DE-07_Turtle_Path/",
            "2021-DE-07-fra.task.md",
            33,
            "07374fd45157bd29",
            3713),

        'question33_ita': (context) => mul_choise_img_trans(
            "2021-DE-07_Turtle_Path/", "2021-DE-07-ita.task.md", 33),
        'questionAnsField33_ita': (context) => mul_choise_img_trans_Ans(
            "2021-DE-07_Turtle_Path/",
            "2021-DE-07-ita.task.md",
            33,
            "2b154a548ea2e5ae",
            3800),

        'question34_de': (context) => mul_choise_img_trans(
            "2021-HU-05c_Stamping/", "2021-HU-05c-deu.task.md", 34),
        'questionAnsField34_de': (context) => mul_choise_img_trans_Ans(
            "2021-HU-05c_Stamping/",
            "2021-HU-05c-deu.task.md",
            34,
            "02ac0a5ff3ac5e04",
            3683),

        'question34_fr': (context) => mul_choise_img_trans(
            "2021-HU-05c_Stamping/", "2021-HU-05c-fra.task.md", 34),
        'questionAnsField34_fr': (context) => mul_choise_img_trans_Ans(
            "2021-HU-05c_Stamping/",
            "2021-HU-05c-fra.task.md",
            34,
            "a641859af3b9c281",
            3717),

        'question34_ita': (context) => mul_choise_img_trans(
            "2021-HU-05c_Stamping/", "2021-HU-05c-ita.task.md", 34),
        'questionAnsField34_ita': (context) => mul_choise_img_trans_Ans(
            "2021-HU-05c_Stamping/",
            "2021-HU-05c-ita.task.md",
            34,
            "59714e6102d#54aef",
            3804),

        'question35_de': (context) => mul_choise_img_trans(
            "2021-IE-02_Coin_bag/", "2021-IE-02-deu.task.md", 35),
        'questionAnsField35_de': (context) => mul_choise_img_trans_Ans(
            "2021-IE-02_Coin_bag/",
            "2021-IE-02-deu.task.md",
            35,
            "2595558c560bacfd",
            3685),

        'question35_fr': (context) => mul_choise_img_trans(
            "2021-IE-02_Coin_bag/", "2021-IE-02-deu.task.md", 35),
        'questionAnsField35_fr': (context) => mul_choise_img_trans_Ans(
            "2021-IE-02_Coin_bag/",
            "2021-IE-02-deu.task.md",
            35,
            "99b115c0b6534516",
            3719),

        'question35_ita': (context) => mul_choise_img_trans(
            "2021-IE-02_Coin_bag/", "2021-IE-02-deu.task.md", 35),
        'questionAnsField35_ita': (context) => mul_choise_img_trans_Ans(
            "2021-IE-02_Coin_bag/",
            "2021-IE-02-deu.task.md",
            35,
            "d73c1bcad07895e9",
            3806),

        'question36_de': (context) => mul_choise_img_trans(
            "2021-IE-04_Football_jerseys/", "2021-IE-04-deu.task.md", 36),
        'questionAnsField36_de': (context) => mul_choise_img_trans_Ans(
            "2021-IE-04_Football_jerseys/",
            "2021-IE-04-deu.task.md",
            36,
            "1f47307e02080f45",
            3686),

        'question36_fr': (context) => mul_choise_img_trans(
            "2021-IE-04_Football_jerseys/", "2021-IE-04-fra.task.md", 36),
        'questionAnsField36_fr': (context) => mul_choise_img_trans_Ans(
            "2021-IE-04_Football_jerseys/",
            "2021-IE-04-fra.task.md",
            36,
            "cd6f271bccb38853",
            3720),

        'question36_ita': (context) => mul_choise_img_trans(
            "2021-IE-04_Football_jerseys/", "2021-IE-04-ita.task.md", 36),
        'questionAnsField36_ita': (context) => mul_choise_img_trans_Ans(
            "2021-IE-04_Football_jerseys/",
            "2021-IE-04-ita.task.md",
            36,
            "cb9886d550f4631b",
            3807),

        'question37_de': (context) => mul_choise_img_trans(
            "2021-LT-01_Meeting_race/", "2021-LT-01-deu.task.md", 37),
        'questionAnsField37_de': (context) => mul_choise_img_trans_Ans(
            "2021-LT-01_Meeting_race/",
            "2021-LT-01-deu.task.md",
            37,
            "2839ae333b9e7b1b",
            3689),

        'question37_fr': (context) => mul_choise_img_trans(
            "2021-LT-01_Meeting_race/", "2021-LT-01-fra.task.md", 37),
        'questionAnsField37_fr': (context) => mul_choise_img_trans_Ans(
            "2021-LT-01_Meeting_race/",
            "2021-LT-01-fra.task.md",
            37,
            "be54d97337b50ab2",
            3723),

        'question37_ita': (context) => mul_choise_img_trans(
            "2021-LT-01_Meeting_race/", "2021-LT-01-ita.task.md", 37),
        'questionAnsField37_ita': (context) => mul_choise_img_trans_Ans(
            "2021-LT-01_Meeting_race/",
            "2021-LT-01-ita.task.md",
            37,
            "cc933890277af6cb",
            3810),

        'question38_de': (context) => mul_choise_img_trans(
            "2021-PH-03_Great_Wall_of_Beavaria/", "2021-PH-03-deu.task.md", 38),
        'questionAnsField38_de': (context) => mul_choise_img_trans_Ans(
            "2021-PH-03_Great_Wall_of_Beavaria/",
            "2021-PH-03-deu.task.md",
            38,
            "a71c17cfdea3ceae",
            3691),

        'question38_fr': (context) => mul_choise_img_trans(
            "2021-PH-03_Great_Wall_of_Beavaria/", "2021-PH-03-deu.task.md", 38),
        'questionAnsField38_fr': (context) => mul_choise_img_trans_Ans(
            "2021-PH-03_Great_Wall_of_Beavaria/",
            "2021-PH-03-deu.task.md",
            38,
            "600e9ad1a0030d28",
            3725),

        'question38_ita': (context) => mul_choise_img_trans(
            "2021-PH-03_Great_Wall_of_Beavaria/", "2021-PH-03-deu.task.md", 38),
        'questionAnsField38_ita': (context) => mul_choise_img_trans_Ans(
            "2021-PH-03_Great_Wall_of_Beavaria/",
            "2021-PH-03-deu.task.md",
            38,
            "884830447fdfd233",
            3812),

        'question39_de': (context) => mul_choise_img_trans(
            "2021-SK-01_Necklaces/", "2021-SK-01-deu.task.md", 39),
        'questionAnsField39_de': (context) => mul_choise_img_trans_Ans(
            "2021-SK-01_Necklaces/",
            "2021-SK-01-deu.task.md",
            39,
            "606c377197daa8e8",
            3694),

        'question39_fr': (context) => mul_choise_img_trans(
            "2021-SK-01_Necklaces/", "2021-SK-01-deu.task.md", 39),
        'questionAnsField39_fr': (context) => mul_choise_img_trans_Ans(
            "2021-SK-01_Necklaces/",
            "2021-SK-01-deu.task.md",
            39,
            "cc232f652dc3d133",
            3728),

        'question39_ita': (context) => mul_choise_img_trans(
            "2021-SK-01_Necklaces/", "2021-SK-01-deu.task.md", 39),
        'questionAnsField39_ita': (context) => mul_choise_img_trans_Ans(
            "2021-SK-01_Necklaces/",
            "2021-SK-01-deu.task.md",
            39,
            "be84b1fb3de358d9",
            3815),

        'question40_de': (context) => mul_choise_img_trans(
            "2021-SV-01_ADeskTouble/", "2021-SV-01-deu.task.md", 40),
        'questionAnsField40_de': (context) => mul_choise_img_trans_Ans(
            "2021-SV-01_ADeskTouble/",
            "2021-SV-01-deu.task.md",
            40,
            "44f156a99e35a103",
            3695),

        'question40_fr': (context) => mul_choise_img_trans(
            "2021-SV-01_ADeskTouble/", "2021-SV-01-fra.task.md", 40),
        'questionAnsField40_fr': (context) => mul_choise_img_trans_Ans(
            "2021-SV-01_ADeskTouble/",
            "2021-SV-01-fra.task.md",
            40,
            "19efaab92c9240e3",
            3729),

        'question40_ita': (context) => mul_choise_img_trans(
            "2021-SV-01_ADeskTouble/", "2021-SV-01-ita.task.md", 40),
        'questionAnsField40_ita': (context) => mul_choise_img_trans_Ans(
            "2021-SV-01_ADeskTouble/",
            "2021-SV-01-ita.task.md",
            40,
            "194875c1d306a205",
            3816),

        'question41_de': (context) => mul_choise_img_trans(
            "2022-AT-04_Lists/", "2022-AT-04-deu.task.md", 41),
        'questionAnsField41_de': (context) => mul_choise_img_trans_Ans(
            "2022-AT-04_Lists/",
            "2022-AT-04-deu.task.md",
            41,
            "39a4962e03f9e60d",
            3859),

        'question41_fr': (context) => mul_choise_img_trans(
            "2022-AT-04_Lists/", "2022-AT-04-fra.task.md", 41),
        'questionAnsField41_fr': (context) => mul_choise_img_trans_Ans(
            "2022-AT-04_Lists/",
            "2022-AT-04-fra.task.md",
            41,
            "75e3a0db1c04418d",
            3929),

        'question41_ita': (context) => mul_choise_img_trans(
            "2022-AT-04_Lists/", "2022-AT-04-ita.task.md", 41),
        'questionAnsField41_ita': (context) => mul_choise_img_trans_Ans(
            "2022-AT-04_Lists/",
            "2022-AT-04-ita.task.md",
            41,
            "87badc652649fa6a",
            3962),

        'question42_de': (context) => mul_choise_img_trans(
            "2022-CA-04_Favourite_Gem/", "2022-CA-04-deu.task.md", 42),
        'questionAnsField42_de': (context) => mul_choise_img_trans_Ans(
            "2022-CA-04_Favourite_Gem/",
            "2022-CA-04-deu.task.md",
            42,
            "ddab5ceca40fd00a",
            3863),

        'question42_fr': (context) => mul_choise_img_trans(
            "2022-CA-04_Favourite_Gem/", "2022-CA-04-fra.task.md", 42),
        'questionAnsField42_fr': (context) => mul_choise_img_trans_Ans(
            "2022-CA-04_Favourite_Gem/",
            "2022-CA-04-fra.task.md",
            42,
            "6afb45b4667c6570",
            3933),

        'question42_ita': (context) => mul_choise_img_trans(
            "2022-CA-04_Favourite_Gem/", "2022-CA-04-ita.task.md", 42),
        'questionAnsField42_ita': (context) => mul_choise_img_trans_Ans(
            "2022-CA-04_Favourite_Gem/",
            "2022-CA-04-ita.task.md",
            42,
            "c234df1ee533e240",
            3966),

        'question43_de': (context) => mul_choise_img_trans(
            "2022-CA-06_Nuts_and_Bolts/", "2022-CA-06-deu.task.md", 43),
        'questionAnsField43_de': (context) => mul_choise_img_trans_Ans(
            "2022-CA-06_Nuts_and_Bolts/",
            "2022-CA-06-deu.task.md",
            43,
            "a66445226b947fce",
            3864),

        'question43_fr': (context) => mul_choise_img_trans(
            "2022-CA-06_Nuts_and_Bolts/", "2022-CA-06-fra.task.md", 43),
        'questionAnsField43_fr': (context) => mul_choise_img_trans_Ans(
            "2022-CA-06_Nuts_and_Bolts/",
            "2022-CA-06-fra.task.md",
            43,
            "441268db8b434e73",
            3934),

        'question43_ita': (context) => mul_choise_img_trans(
            "2022-CA-06_Nuts_and_Bolts/", "2022-CA-06-ita.task.md", 43),
        'questionAnsField43_ita': (context) => mul_choise_img_trans_Ans(
            "2022-CA-06_Nuts_and_Bolts/",
            "2022-CA-06-ita.task.md",
            43,
            "728ae40dffb46624",
            3967),

        'question44_de': (context) => mul_choise_img_trans(
            "2022-KR-03_Hamberger_Recipe/", "2022-KR-03-deu.task.md", 44),
        'questionAnsField44_de': (context) => mul_choise_img_trans_Ans(
            "2022-KR-03_Hamberger_Recipe/",
            "2022-KR-03-deu.task.md",
            44,
            "9dd9a97c245ee9d6",
            3876),

        'question44_fr': (context) => mul_choise_img_trans(
            "2022-KR-03_Hamberger_Recipe/", "2022-KR-03-fra.task.md", 44),
        'questionAnsField44_fr': (context) => mul_choise_img_trans_Ans(
            "2022-KR-03_Hamberger_Recipe/",
            "2022-KR-03-fra.task.md",
            44,
            "6708d1c47a6cb2e5",
            3946),

        'question44_ita': (context) => mul_choise_img_trans(
            "2022-KR-03_Hamberger_Recipe/", "2022-KR-03-ita.task.md", 44),
        'questionAnsField44_ita': (context) => mul_choise_img_trans_Ans(
            "2022-KR-03_Hamberger_Recipe/",
            "2022-KR-03-ita.task.md",
            44,
            "94c713a06b282f7f",
            3979),

        'question45_de': (context) => mul_choise_img_trans(
            "2022-LV-03_Tic-Tac-Toe_fields/", "2022-LV-03-deu.task.md", 45),
        'questionAnsField45_de': (context) => mul_choise_img_trans_Ans(
            "2022-LV-03_Tic-Tac-Toe_fields/",
            "2022-LV-03-deu.task.md",
            45,
            "9a1831ec3ef37a35",
            3878),

        'question45_fr': (context) => mul_choise_img_trans(
            "2022-LV-03_Tic-Tac-Toe_fields/", "2022-LV-03-fra.task.md", 45),
        'questionAnsField45_fr': (context) => mul_choise_img_trans_Ans(
            "2022-LV-03_Tic-Tac-Toe_fields/",
            "2022-LV-03-fra.task.md",
            45,
            "bce26c645fea8aa7",
            3948),

        'question45_ita': (context) => mul_choise_img_trans(
            "2022-LV-03_Tic-Tac-Toe_fields/", "2022-LV-03-ita.task.md", 45),
        'questionAnsField45_ita': (context) => mul_choise_img_trans_Ans(
            "2022-LV-03_Tic-Tac-Toe_fields/",
            "2022-LV-03-ita.task.md",
            45,
            "9b10e9b981570aaf",
            3981),

        'question46_de': (context) => mul_choise_img_trans(
            "2022-MK-01_Treasure_Box/", "2022-MK-01-deu.task.md", 46),
        'questionAnsField46_de': (context) => mul_choise_img_trans_Ans(
            "2022-MK-01_Treasure_Box/",
            "2022-MK-01-deu.task.md",
            46,
            "33e65403d7b960f7",
            3879),

        'question46_fr': (context) => mul_choise_img_trans(
            "2022-MK-01_Treasure_Box/", "2022-MK-01-fra.task.md", 46),
        'questionAnsField46_fr': (context) => mul_choise_img_trans_Ans(
            "2022-MK-01_Treasure_Box/",
            "2022-MK-01-fra.task.md",
            46,
            "44836e42a98fbfe6",
            3949),

        'question46_ita': (context) => mul_choise_img_trans(
            "2022-MK-01_Treasure_Box/", "2022-MK-01-ita.task.md", 46),
        'questionAnsField46_ita': (context) => mul_choise_img_trans_Ans(
            "2022-MK-01_Treasure_Box/",
            "2022-MK-01-ita.task.md",
            46,
            "7983bc63e56522f5",
            3982),

        'question47_de': (context) => mul_choise_img_trans(
            "2022-SK-02_Embroidery_machine/", "2022-SK-02-deu.task.md", 47),
        'questionAnsField47_de': (context) => mul_choise_img_trans_Ans(
            "2022-SK-02_Embroidery_machine/",
            "2022-SK-02-deu.task.md",
            47,
            "e1f3d867b1f1156b",
            3883),

        'question47_fr': (context) => mul_choise_img_trans(
            "2022-SK-02_Embroidery_machine/", "2022-SK-02-fra.task.md", 47),
        'questionAnsField47_fr': (context) => mul_choise_img_trans_Ans(
            "2022-SK-02_Embroidery_machine/",
            "2022-SK-02-fra.task.md",
            47,
            "57b80ba13555d39a",
            3953),

        'question47_ita': (context) => mul_choise_img_trans(
            "2022-SK-02_Embroidery_machine/", "2022-SK-02-ita.task.md", 47),
        'questionAnsField47_ita': (context) => mul_choise_img_trans_Ans(
            "2022-SK-02_Embroidery_machine/",
            "2022-SK-02-ita.task.md",
            47,
            "98912dd7bc7c7a32",
            3986),

        'question48_de': (context) => mul_choise_img_trans(
            "2022-SK-03_Sailor_necklace/", "2022-SK-03-deu.task.md", 48),
        'questionAnsField48_de': (context) => mul_choise_img_trans_Ans(
            "2022-SK-03_Sailor_necklace/",
            "2022-SK-03-deu.task.md",
            48,
            "8bc1772e9c9a058e",
            3884),

        'question48_fr': (context) => mul_choise_img_trans(
            "2022-SK-03_Sailor_necklace/", "2022-SK-03-fra.task.md", 48),
        'questionAnsField48_fr': (context) => mul_choise_img_trans_Ans(
            "2022-SK-03_Sailor_necklace/",
            "2022-SK-03-fra.task.md",
            48,
            "f1b46ca0a77069e2",
            3954),

        'question48_ita': (context) => mul_choise_img_trans(
            "2022-SK-03_Sailor_necklace/", "2022-SK-03-ita.task.md", 48),
        'questionAnsField48_ita': (context) => mul_choise_img_trans_Ans(
            "2022-SK-03_Sailor_necklace/",
            "2022-SK-03-ita.task.md",
            48,
            "2b8c2f93d98579fd",
            3987),

        'question49_de': (context) => mul_choise_img_trans(
            "2022-SK-04_Cipher_8/", "2022-SK-04-deu.task.md", 49),
        'questionAnsField49_de': (context) => mul_choise_img_trans_Ans(
            "2022-SK-04_Cipher_8/",
            "2022-SK-04-deu.task.md",
            49,
            "2a2a31e4ea263d35",
            3885),

        'question49_fr': (context) => mul_choise_img_trans(
            "2022-SK-04_Cipher_8/", "2022-SK-04-fra.task.md", 49),
        'questionAnsField49_fr': (context) => mul_choise_img_trans_Ans(
            "2022-SK-04_Cipher_8/",
            "2022-SK-04-fra.task.md",
            49,
            "5da162356223de17",
            3955),

        'question49_ita': (context) => mul_choise_img_trans(
            "2022-SK-04_Cipher_8/", "2022-SK-04-ita.task.md", 49),
        'questionAnsField49_ita': (context) => mul_choise_img_trans_Ans(
            "2022-SK-04_Cipher_8/",
            "2022-SK-04-ita.task.md",
            49,
            "a721d022c7421f4c",
            3988),

        'question50_de': (context) => mul_choise_img_trans(
            "2022-TR-02_Rug_Weaving/", "2022-TR-02-deu.task.md", 50),
        'questionAnsField50_de': (context) => mul_choise_img_trans_Ans(
            "2022-SK-04_Cipher_8/",
            "2022-SK-04-deu.task.md",
            49,
            "07ba060188d985e5",
            3886),

        'question50_fr': (context) => mul_choise_img_trans(
            "2022-TR-02_Rug_Weaving/", "2022-TR-02-fra.task.md", 50),
        'questionAnsField50_fr': (context) => mul_choise_img_trans_Ans(
            "2022-TR-02_Rug_Weaving/",
            "2022-TR-02-fra.task.md",
            50,
            "a2020c89a2da7fad",
            3956),

        'question50_ita': (context) => mul_choise_img_trans(
            "2022-TR-02_Rug_Weaving/", "2022-TR-02-ita.task.md", 50),
        'questionAnsField50_ita': (context) => mul_choise_img_trans_Ans(
            "2022-TR-02_Rug_Weaving/",
            "2022-TR-02-ita.task.md",
            50,
            "751ae8c26675878e",
            3989),

        'question51_de': (context) => mul_choise_img_trans(
            "2022-UZ-03_Maze/", "2022-UZ-03-deu.task.md", 51),
        'questionAnsField51_de': (context) => mul_choise_img_trans_Ans(
            "2022-UZ-03_Maze/",
            "2022-UZ-03-deu.task.md",
            51,
            "0cf8ca5fa1081c6f",
            3888),

        'question51_fr': (context) => mul_choise_img_trans(
            "2022-UZ-03_Maze/", "2022-UZ-03-fra.task.md", 51),
        'questionAnsField51_fr': (context) => mul_choise_img_trans_Ans(
            "2022-UZ-03_Maze/",
            "2022-UZ-03-fra.task.md",
            51,
            "9d3cdcf6fa9ed1bd",
            3958),

        'question51_ita': (context) => mul_choise_img_trans(
            "2022-UZ-03_Maze/", "2022-UZ-03-ita.task.md", 51),
        'questionAnsField51_ita': (context) => mul_choise_img_trans_Ans(
            "2022-UZ-03_Maze/",
            "2022-UZ-03-ita.task.md",
            51,
            "bfffca9890b7232f",
            3991),
        'button': (context) => _Game(),
        'lang': (context) => _lang(),
        'ans': (context) => Ans(),
      },
    );
  }
}

class _Parent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    questionList = [];
    questionAns = [];
    widgetList = [];
    for (int i = 0; i < size[0]; i++) {
      questionList.add("");
      questionAns.add(false);
    }
    return MaterialApp(
        title: "base_widget",
        home: Scaffold(
          appBar: AppBar(
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            title: const Text("list of all exercises"),
            actions: [button_lang(context), button(context)], //button(context)
          ),
          body: ListView(
            children: getColumn(context),
          ),
        ));
  }

  Widget button(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pushNamed(context, 'button');
      },
      icon: const Icon(Icons.width_wide),
    );
  }

  Widget button_lang(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pushNamed(context, 'lang');
      },
      icon: const Icon(Icons.abc),
    );
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

class _Game extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    questionList = [];
    questionAns = [];
    widgetList = [];
    for (int i = 0; i < size[0]; i++) {
      questionList.add("");
      questionAns.add(false);
    }
    return MaterialApp(
        title: "base_widget",
        home: Scaffold(
          appBar: AppBar(
            actions: [button(context)],
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            title: const Text("Game"),
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
    Set random = Set();
    while (random.length != 5) {
      random.add(Random().nextInt(50) + 1);
    }
    List<Widget> containers2 = [];
    for (int i = 0; i < length; i++) {
      if (random.contains(i)) {
        containers2.add(containers[i]);
      }
    }
    return containers2;
  }

  Widget button(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pushNamed(context, 'ans');
      },
      icon: const Icon(Icons.account_balance_wallet_rounded),
    );
  }
}

class Ans extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int ret = 0;
    for (int i = 0; i < questionAns.length; i++) {
      if (questionAns[i]) {
        ret++;
      }
    }
    return Container(
      color: Colors.white,
        child: TextButton(
            onPressed: () => Navigator.of(context)
              ..pop()
              ..pop(),
            child: Text("you answered " + ret.toString() + "  tasks correctly" ,selectionColor: Colors.black,)));
  }
}

class _lang extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(255, 255, 255, 1),
      child: ListView(
        children: [
          TextButton(
              onPressed: () {
                lang = "de";
                Navigator.pop(context);
              },
              child: Text("Deutsch")),
          TextButton(
              onPressed: () {
                lang = "fr";
                Navigator.pop(context);
              },
              child: Text("Francais")),
          TextButton(
              onPressed: () {
                lang = "ita";
                Navigator.pop(context);
              },
              child: Text("Itanilano")),
        ],
      ),
    );
  }
}
