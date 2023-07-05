import 'package:flutter/material.dart';
import 'package:shadow_flex/style/color_sheme.dart';
import 'package:flutter/services.dart';

import 'package:shadow_flex/style/test_style.dart';
import 'package:shadow_flex/widgets/general_information.dart';
import 'package:shadow_flex/widgets/text_left_margin.dart';


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
          TextButton(
            style: TextButton.styleFrom(
              textStyle: MyTextStyle().GetTextDecoration(),
              padding: const EdgeInsets.all(10.0),
            ),
            onPressed: () {}, 
            child: const Text("Добавить качество"),
          ),
          Container(height: 30,),
        ],
      ),
    );
  }

}