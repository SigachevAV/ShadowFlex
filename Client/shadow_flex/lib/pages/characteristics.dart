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
    HeroData hero = HeroData();
    log(hero.Roll(530, 0).toString());
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
          AbillytyRow(
            name: "Тело",
            offset: 0,
            index: 0,
          ),
          AbillytyRow(
            name: "Ловкость",
            offset: 0,
            index: 100,
          ),
          AbillytyRow(
            name: "Атлетика",
            offset: 1,
            index: 110,
          ),
          AbillytyRow(
            name: "Ближний бой",
            offset: 1,
            index: 120,
          ),
          AbillytyRow(
            name: "Экзотическое оружие",
            offset: 1,
            index: 120,
          ),
          AbillytyRow(
            name: "Огнестрельное оружие",
            offset: 1,
            index: 140,
          ),
          // ПИСАТЬ ЗДЕСЬ
          AbillytyRow(
            name: "Скрытность", 
            offset: 1, 
            index: 150,
            ),
          AbillytyRow(
            name: "Реакция",
            offset: 0,
            index: 200,
            ),
          AbillytyRow(
            name: "Вождение", 
            offset: 1, 
            index: 210,
            ),
          AbillytyRow(
            name: "Сила", 
            offset: 0, 
            index: 300,
            ),
          AbillytyRow(
            name: "Воля",
            offset: 0,
            index: 400,
            ),
          AbillytyRow(
            name: "Логика", 
          offset: 0, 
          index: 500,
          ),
          AbillytyRow(
            name: "Биотех", 
            offset: 1, 
            index: 510,
            ),
          AbillytyRow(
            name: "Взлом", 
            offset: 1, 
            index: 520,
            ),
          AbillytyRow(
            name: "Электроника", 
            offset: 1, 
            index: 530,
            ), 
          AbillytyRow(
            name: "Инженерное дело", 
            offset: 1, 
            index: 540,
            ),
          AbillytyRow(
            name: "Интуиция", 
            offset: 0, 
            index: 600,
            ),
          AbillytyRow(
            name: "Навигация", 
            offset: 1, 
            index: 610,
            ),
          AbillytyRow(
            name: "Внимательность", 
            offset: 1, 
            index: 620,
            ),
          AbillytyRow(
            name: "Харизма", 
            offset: 0, 
            index: 700,
            ),
          AbillytyRow(
            name: "Обман", 
            offset: 1, 
            index: 710,
            ),
          AbillytyRow(
            name: "Влияние", 
            offset: 1, 
            index: 720,
            ),
          AbillytyRow(
            name: "Магия", 
            offset: 0, 
            index: 800,
            ),
          AbillytyRow(
            name: "Астрал", 
            offset: 1, 
            index: 810,
            ),
          AbillytyRow(
            name: "Призыв", 
            offset: 1, 
            index: 820,
            ),
          AbillytyRow(
            name: "Зачарование", 
            offset: 1, 
            index: 830,
            ),
          AbillytyRow(
            name: "Колдовство", 
            offset: 1, 
            index: 840,
            ),
          AbillytyRow(
            name: "Резонанс", 
            offset: 0, 
            index: 900,
            ),
          AbillytyRow(
            name: "Таскинг", 
            offset: 1, 
            index: 910,
            ),
          AbillytyRow(
            name: "Эдж", 
            offset: 0, 
            index: 1000,
            )

          
        ],
      ),
    );
  }
}
