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
    HeroData anotherHero = HeroData();
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
            name: "Огнестрельное оружие",
            offset: 1,
            index: 130,
          ),
          
        ],
      ),
    );
  }
}
