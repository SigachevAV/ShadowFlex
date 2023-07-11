import 'dart:developer';
// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:shadow_flex/models/hero.dart';
import 'package:shadow_flex/style/color_sheme.dart';
import 'package:flutter/services.dart';

import 'package:shadow_flex/style/test_style.dart';
import 'package:shadow_flex/widgets/general_information.dart';
import 'package:shadow_flex/widgets/text_left_margin.dart';

import '../style/color_sheme.dart';
import '../style/test_style.dart';


// void _addQuality() {
//   Widget builder(BuildContext context) {
//     return Column(
//       children: [
//         showDialog(
//         context: context,
//         builder: (BuildContext context) {
//         return Dialog(
//           backgroundColor: ColorShemeMine().GetBackgroundDark(),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//           ),
//         );
//         },
//         ),
//       ],
//     ),
//   },
// },

class QualitiesAndConnectionsPage extends StatefulWidget {
  const QualitiesAndConnectionsPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QualitiesAndConnectionsPage();
  
}

class _QualitiesAndConnectionsPage extends State<QualitiesAndConnectionsPage> {
    TextStyle style = MyTextStyle().GetTextDecoration();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 20,            
          ),

          const TextLeftMargin(
            text: "Качества", 
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
            child: Table(     
              border: TableBorder.all(width: 1, color: ColorShemeMine().GetUnderlineDark(), ),
              children: [
                TableRow(
                  children: <Widget>[                      
                    Container(                      
                      height: 27,
                      alignment: Alignment.center,
                      child: const Text("Название"),
                                                
                    ),
                    Container(
                      height: 27,
                      alignment: Alignment.center,
                      child: const Text("Карма"), 
                    )
                  ],
                ),
                TableRow(
                    children: <Widget>[
                      Container(
                        height: 27,
                      ),
                      Container(
                        height: 27,
                      ),
                    ], 
                  ),
              ],              
            ),
          ),
          Container(
            height: 35,
            margin: const EdgeInsets.only(top: 10, bottom: 20),
            decoration: BoxDecoration(
              border: Border.all(color: ColorShemeMine().GetAkcent()),
              ),
            child: TextButton(
              style: TextButton.styleFrom(
                textStyle: MyTextStyle().GetTextMiniAkcent(),
                padding: const EdgeInsets.fromLTRB(64, 4, 64, 4)),
                onPressed: () {
                  showDialog(
                  context: context,
                  builder: (BuildContext context) {
                  return Dialog(
                    backgroundColor: ColorShemeMine().GetBackgroundDark(),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Container(height: 10),
                        const GeneralInf(
                        title: "Название",
                          fill: ""
                          ),
                        const GeneralInf(
                        title: "Карма",
                          fill: ""
                          ),  
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                              Navigator.pop(context);
                              },
                              child: const Text('Закрыть'),
                            ),
                            TextButton(
                              onPressed: () {
                              Navigator.pop(context);
                              },
                              child: const Text('Добавить'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
                }, 
                child: const Text("Добавить качество"),
            ),
            ), 
            const TextLeftMargin(
                text: "Знакомства",
              ),            
            
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
            // padding: EdgeInsets.zero,
            child: Table(   
              columnWidths: {
                0: FractionColumnWidth(0.5),
                1: FractionColumnWidth(0.3),
                2: FractionColumnWidth(0.2),
              }, 
              border: TableBorder.all(width: 1, color: ColorShemeMine().GetUnderlineDark(), ),
              children: [
                TableRow(                  
                  children: <Widget>[                                           
                        Container(                            
                          height: 27,                                                    
                          alignment: Alignment.center,
                          child: const Text("Имя"),                                                
                        ),
                        Container(
                          height: 27,                      
                          alignment: Alignment.center,
                          child: const Text("Лояльность"), 
                        ),
                        Container(
                          height: 27,                     
                          alignment: Alignment.center,
                          child: const Text("Связь"), 
                        ),
                  ],
                ),
              
                TableRow(
                    children: <Widget>[
                      Container(
                        height: 27,
                        
                      ),
                      Container(
                        height: 27,
                      ),
                      Container(
                        height: 27,
                      )
                    ], 
                ),
              ],              
            ),
          ),
          Container(
            height: 35,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: ColorShemeMine().GetAkcent()),
              ),
            child: TextButton(
              style: TextButton.styleFrom(
                textStyle: MyTextStyle().GetTextMiniAkcent(),
                padding: const EdgeInsets.fromLTRB(64, 4, 64, 4)),
                onPressed: () {
                  showDialog(
                  context: context,
                  builder: (BuildContext context) {
                  return Dialog(
                    backgroundColor: ColorShemeMine().GetBackgroundDark(),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Container(height: 10),
                        const GeneralInf(
                          title: "Имя",
                          fill: ""
                          ),
                        const GeneralInf(
                          title: "Лояльность",
                          fill: ""
                          ),
                        const GeneralInf(
                          title: "Связь",
                          fill: ""),  
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                              Navigator.pop(context);
                              },
                              child: const Text('Закрыть'),
                            ),
                            TextButton(
                              onPressed: () {
                              Navigator.pop(context);
                              },
                              child: const Text('Добавить'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
                }, 
                child: const Text("Добавить знакомство"),
            ),
            ),
          Container(height: 30,),
        ],
      ),
    );
  }

}


