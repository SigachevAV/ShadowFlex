import 'package:flutter/material.dart';
import 'package:shadow_flex/functions/change_gender.dart';
import 'package:shadow_flex/functions/change_metatype.dart';
import 'package:shadow_flex/models/hero.dart';
import 'package:shadow_flex/models/metatypes.dart';
import 'package:shadow_flex/style/color_sheme.dart';
import 'package:flutter/services.dart';
import 'package:shadow_flex/style/input_style.dart';

import 'package:shadow_flex/style/test_style.dart';
import 'package:shadow_flex/widgets/general_information.dart';

class GeneralInfoPage extends StatefulWidget {
  const GeneralInfoPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _GeneralInfoPageState();
}

class _GeneralInfoPageState extends State<GeneralInfoPage> {
  TextStyle style = MyTextStyle().GetTextDecoration();
  TextEditingController metatypeController = TextEditingController();
  TextEditingController genderController = TextEditingController();

  String metatype = '';

  Future<void> Update() async {
    await HeroData().Load();
    setState(() {
      genderController.text = HeroData().GetGeneralInfo('gender');

      metatypeController.text = GetMetatypeString();
    });
  }

  String GetMetatypeString() {
    String result = '';
    switch (HeroData().metatype) {
      case Metatype.DWARF:
        result = "Гном";
        break;
      case Metatype.ELVE:
        result = "Эльф";
        break;
      case Metatype.HUMAN:
        result = "Человек";
        break;
      case Metatype.ORC:
        result = "Орк";
        break;
      case Metatype.TROLL:
        result = "Троль";
        break;
      default:
        break;
    }
    return result;
  }

  @override
  void initState() {
    super.initState();
    Update();
  }

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
            mapKey: "name",
          ),

          // Тут должен быть выбор Метатипа
          Row(children: [
            Spacer(
              flex: 1,
            ),
            Flexible(
              flex: 10,
              child: GestureDetector(
                onTap: () {
                  ChangeMetatype(context).then((value) {
                    setState(() {
                      metatypeController.text = GetMetatypeString();
                    });
                  });
                },
                child: TextFormField(
                  style: style,
                  controller: metatypeController,
                  enabled: false,
                  decoration: InputStyle().GetDecoratorWithLabel("Метатип"),
                ),
              ),
            ),
            Spacer(
              flex: 1,
            )
          ]),

          GeneralInf(
            title: "Этнос",
            fill: "",
            mapKey: "etnos",
          ),

          GeneralInf(
            title: "Возраст",
            fill: "",
            isNumerical: true,
            mapKey: "age",
          ),

          // Тут должен быть Пол
          Row(
            children: [
              Spacer(
                flex: 1,
              ),
              Flexible(
                flex: 10,
                child: GestureDetector(
                  onTap: () {
                    ChangeGender(context).then((value) {
                      setState(() {
                        genderController.text =
                            HeroData().GetGeneralInfo("gender");
                      });
                    });
                  },
                  child: TextFormField(
                    style: style,
                    controller: genderController,
                    enabled: false,
                    decoration: InputStyle().GetDecoratorWithLabel("Пол"),
                  ),
                ),
              ),
              Spacer(
                flex: 1,
              ),
            ],
          ),

          GeneralInf(
            title: "Рост",
            fill: "",
            mapKey: "heit",
            isNumerical: true,
          ),

          GeneralInf(
            title: "Вес",
            fill: "",
            mapKey: "weith",
            isNumerical: true,
          ),

          GeneralInf(
            title: "Репутация",
            fill: "",
            mapKey: "reputation",
          ),

          GeneralInf(
            title: "Розыск",
            fill: "",
            mapKey: "gtaStar",
          ),

          GeneralInf(
            title: "Карма",
            fill: "",
            mapKey: 'karma',
          ),

          GeneralInf(
            title: "Общая карма",
            fill: "",
            mapKey: "totalKarma",
          ),

          GeneralInf(
            title: "Разное",
            fill: "",
            mapKey: "another",
          ),

          GeneralInf(
            title: "Основной уровень жизни",
            fill: "",
            mapKey: "lifeClass",
          ),

          GeneralInf(
            title: "Нюйены",
            fill: "",
            mapKey: "money",
            isNumerical: true,
          ),

          GeneralInf(
            title: "Лицензии",
            fill: "",
            mapKey: "licens",
          ),

          GeneralInf(
            title: "Поддельные удостоверения",
            fill: "",
            mapKey: "fakeLicens",
          ),

          GeneralInf(
            title: "Уровень жизни альтер эго",
            fill: "",
            mapKey: "fakeLifeClass",
          ),

          Container(
            height: 30,
          )
        ],
      ),
    );
  }
}
