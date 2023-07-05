import 'package:flutter/material.dart';
import 'package:shadow_flex/style/color_sheme.dart';
import 'package:flutter/services.dart';

import 'package:shadow_flex/style/test_style.dart';
import 'package:shadow_flex/widgets/general_information.dart';


class GeneralInfoPage extends StatefulWidget {
  const GeneralInfoPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _GeneralInfoPageState();
  
}

class _GeneralInfoPageState extends State<GeneralInfoPage> {
    TextStyle style = MyTextStyle().GetTextDecoration();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 20,            
          ),

          GeneralInf(
            title: "Имя/Псевдоним", 
            fill: "",
            ),

          
          // Тут должен быть выбор Метатипа
          TextFormField(
            style: style,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: "Метатип доделать",
              labelStyle: MyTextStyle().GetTextMiniAkcent(),
            ),
          ),

          GeneralInf(
            title: "Этнос", 
            fill: "",
            ),

          GeneralInf(
            title: "Возраст", 
            fill: "",
            isNumerical: true,
            ),

          // Тут должен быть Пол
          TextFormField(
            style: style,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Пол доделать",
              labelStyle: MyTextStyle().GetTextMiniAkcent(),
            ),
          ),

          GeneralInf(
            title:"Рост", 
            fill: "",
            isNumerical: true,),
          
          GeneralInf(
            title:"Вес", 
            fill: "",
            isNumerical: true,),
          
          GeneralInf(
            title:"Репутация", 
            fill: "",
            ),

          GeneralInf(
            title:"Розыск", 
            fill: "",
            ),

          GeneralInf(
            title:"Карма", 
            fill: "",
            ),

          GeneralInf(
            title:"Общая карма", 
            fill: "",
            ),

          GeneralInf(
            title:"Разное", 
            fill: "",
            ),

          GeneralInf(
            title:"Основной уровень жизни", 
            fill: "",
            ),

          GeneralInf(
            title:"Нюйены", 
            fill: "",
            isNumerical: true,),

          GeneralInf(
            title:"Лицензии", 
            fill: "",
            ),

          GeneralInf(
            title:"Поддельные удостоверения", 
            fill: "",
            ),

          GeneralInf(
            title:"Уровень жизни альтер эго", 
            fill: "",
            ),

          Container(height: 30,)
        ],
      ),
    );
  }
}