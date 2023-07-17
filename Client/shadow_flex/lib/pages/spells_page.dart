import 'package:flutter/material.dart';
import 'package:shadow_flex/models/adept.dart';
import 'package:shadow_flex/widgets/data_card.dart';
import 'package:shadow_flex/widgets/text_left_margin.dart';
import 'package:shadow_flex/models/spell.dart';

import '../models/hero.dart';
import '../style/color_sheme.dart';
import '../style/test_style.dart';
import '../widgets/text_input_decorator.dart';

class SpellsPage extends StatefulWidget {
  const SpellsPage({super.key});

  @override
  State<SpellsPage> createState() => _SpellsPageState();
}

class _SpellsPageState extends State<SpellsPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Container(
          height: 20,
        ),
        const TextLeftMargin(text: 'Заклинания / Заготовки / Ритуалы / Сложные формы'),
        Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Builder(builder: spellsBuilder),
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
                  primary: ColorShemeMine().GetAkcent(),
                  padding: const EdgeInsets.fromLTRB(64, 4, 64, 4)),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    String tempName = '';
                    String tempType = '';
                    String tempDistance = '';
                    String tempDuration = '';
                    String tempExhaust = '';
                    return Dialog(
                      backgroundColor: ColorShemeMine().GetBackgroundDark(),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(height: 10),
                          //TODO ADD FORM
                          InputTextFF(
                              onChange: ((value) {
                                tempName = value;
                              }),
                              title: "Название"),
                          InputTextFF(
                              onChange: ((value) {
                                tempType = value;
                              }),
                              title: "Тип"),
                          InputTextFF(
                              onChange: ((value) {
                                tempDistance = value;
                              }),
                              title: "Дистанция"),
                          InputTextFF(
                              onChange: ((value) {
                                tempDuration = value;
                              }),
                              title: "Длительность"),
                          InputTextFF(
                              isNumerical: true,
                              onChange: ((value) {
                                tempExhaust = value;
                              }),
                              title: "Истощение"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child:  Text('Закрыть', style: MyTextStyle().GetTextMiniAkcent()),
                              ),
                              TextButton(
                                onPressed: () {
                                  HeroData().AddSpell(Spell(tempName, tempType, tempDistance, tempDuration, tempExhaust));
                                  Navigator.pop(context);
                                  setState(() {});
                                },
                                child: Text('Добавить', style: MyTextStyle().GetTextMiniAkcent()),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: const Text("Добавить"),
            ),
          ),
        const TextLeftMargin(text: 'Силы адепта или прочие способности'),
        Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Builder(builder: adeptsBuilder),
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
                  primary: ColorShemeMine().GetAkcent(),
                  padding: const EdgeInsets.fromLTRB(64, 4, 64, 4)),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    String tempName = '';
                    String tempLevel = '';
                    String tempNote = '';
                    return Dialog(
                      backgroundColor: ColorShemeMine().GetBackgroundDark(),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(height: 10),
                          //TODO ADD FORM
                          InputTextFF(
                              onChange: ((value) {
                                tempName = value;
                              }),
                              title: "Название"),
                          InputTextFF(
                              isNumerical: true,
                              onChange: ((value) {
                                tempLevel = value;
                              }),
                              title: "Уровень"),
                          InputTextFF(
                              onChange: ((value) {
                                tempNote = value;
                              }),
                              title: "Заметки"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child:  Text('Закрыть', style: MyTextStyle().GetTextMiniAkcent()),
                              ),
                              TextButton(
                                onPressed: () {
                                  HeroData().AddAdept(Adept(tempName, tempLevel, tempNote));
                                  Navigator.pop(context);
                                  setState(() {});
                                },
                                child: Text('Добавить', style: MyTextStyle().GetTextMiniAkcent()),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: const Text("Добавить"),
            ),
          ),
        Container(
          height: 35,
        ),
      ],)   
    );
  }

  void RemoveSpell(Spell _spell) {
    HeroData().RemoveSpell(_spell);
    setState(() {});
  }

  Widget spellsBuilder(BuildContext context) {
    List<GestureDetector> result = List.empty(growable: true);
    List<Spell> spells = HeroData().GetSpells();

    for (var i = 0; i < spells.length; i++) {
      result.add(
        GestureDetector(
          onTap: () => RemoveSpell(spells[i]),
          child: DataCardWidget(
            heder: spells[i].name,
            bigData: [
              'Тип/Цель',
              spells[i].type,
              'Дистанция',
              spells[i].distance,
              'Длительность',
              spells[i].duration,
              'Истощение',
              spells[i].exhaust
          ])
        )
      );
    }

    return Column(children: result);
  }

  void RemoveAdept(Adept _adept) {
    HeroData().RemoveAdept(_adept);
    setState(() {});
  }

  Widget adeptsBuilder(BuildContext context) {
    List<GestureDetector> result = List.empty(growable: true);
    List<Adept> adepts = HeroData().GetAdepts();

    for (var i = 0; i < adepts.length; i++) {
      result.add(
        GestureDetector(
          onTap: () => RemoveAdept(adepts[i]),
          child:  DataCardWidget(
            heder: adepts[i].name,
            bigData: [
              'Уровень',
              adepts[i].level
            ],
            smolData: [
              'Заметки',
              adepts[i].note,
            ],
          ),
        )
      );
    }

    return Column(children: result);
  }
}