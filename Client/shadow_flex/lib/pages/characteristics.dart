import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shadow_flex/models/hero.dart';
import 'package:shadow_flex/style/test_style.dart';
import 'package:shadow_flex/widgets/abillyty_row.dart';

class CharacteristicsPage extends StatefulWidget {
  const CharacteristicsPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _CharacteristicsPageState();
}

class _CharacteristicsPageState extends State<CharacteristicsPage> {
  TextStyle style = MyTextStyle().GetTextDecoration();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 20,
          ),
          const AbillytyRow(
            name: "Тело",
            offset: 0,
            index: 0,
          ),
          const AbillytyRow(
            name: "Ловкость",
            offset: 0,
            index: 100,
          ),
          const AbillytyRow(
            name: "Атлетика",
            offset: 1,
            index: 110,
          ),
          const AbillytyRow(
            name: "Ближний бой",
            offset: 1,
            index: 120,
          ),
          const AbillytyRow(
            name: "Экзотическое оружие",
            offset: 1,
            index: 130,
          ),
          const AbillytyRow(
            name: "Огнестрельное оружие",
            offset: 1,
            index: 140,
          ),
          // ПИСАТЬ ЗДЕСЬ
          const AbillytyRow(
            name: "Скрытность",
            offset: 1,
            index: 150,
          ),
          const AbillytyRow(
            name: "Реакция",
            offset: 0,
            index: 200,
          ),
          const AbillytyRow(
            name: "Вождение",
            offset: 1,
            index: 210,
          ),
          const AbillytyRow(
            name: "Сила",
            offset: 0,
            index: 300,
          ),
          const AbillytyRow(
            name: "Воля",
            offset: 0,
            index: 400,
          ),
          const AbillytyRow(
            name: "Логика",
            offset: 0,
            index: 500,
          ),
          const AbillytyRow(
            name: "Биотех",
            offset: 1,
            index: 510,
          ),
          const AbillytyRow(
            name: "Взлом",
            offset: 1,
            index: 520,
          ),
          const AbillytyRow(
            name: "Электроника",
            offset: 1,
            index: 530,
          ),
          const AbillytyRow(
            name: "Инженерное дело",
            offset: 1,
            index: 540,
          ),
          const AbillytyRow(
            name: "Интуиция",
            offset: 0,
            index: 600,
          ),
          const AbillytyRow(
            name: "Навигация",
            offset: 1,
            index: 610,
          ),
          const AbillytyRow(
            name: "Внимательность",
            offset: 1,
            index: 620,
          ),
          const AbillytyRow(
            name: "Харизма",
            offset: 0,
            index: 700,
          ),
          const AbillytyRow(
            name: "Обман",
            offset: 1,
            index: 710,
          ),
          const AbillytyRow(
            name: "Влияние",
            offset: 1,
            index: 720,
          ),
          const AbillytyRow(
            name: "Магия",
            offset: 0,
            index: 800,
          ),
          const AbillytyRow(
            name: "Астрал",
            offset: 1,
            index: 810,
          ),
          const AbillytyRow(
            name: "Призыв",
            offset: 1,
            index: 820,
          ),
          const AbillytyRow(
            name: "Зачарование",
            offset: 1,
            index: 830,
          ),
          const AbillytyRow(
            name: "Колдовство",
            offset: 1,
            index: 840,
          ),
          const AbillytyRow(
            name: "Резонанс",
            offset: 0,
            index: 900,
          ),
          const AbillytyRow(
            name: "Таскинг",
            offset: 1,
            index: 910,
          ),
          const AbillytyRow(
            name: "Эдж",
            offset: 0,
            index: 1000,
          ),
          Container(
            height: 40,
          )
        ],
      ),
    );
  }
}
