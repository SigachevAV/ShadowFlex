import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shadow_flex/models/armor.dart';
import 'package:shadow_flex/models/augmentation.dart';
import 'package:shadow_flex/models/hero.dart';
import 'package:shadow_flex/style/color_sheme.dart';
import 'package:shadow_flex/style/test_style.dart';
import 'package:shadow_flex/widgets/data_card.dart';
import 'package:shadow_flex/widgets/text_input_decorator.dart';
import 'package:shadow_flex/widgets/text_left_margin.dart';

class ArmorsPage extends StatefulWidget {
  const ArmorsPage({super.key});

  @override
  State<ArmorsPage> createState() => _ArmorsPageState();
}

class _ArmorsPageState extends State<ArmorsPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        Container(
          height: 20,
        ),
        const TextLeftMargin(text: 'Броня'),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Builder(builder: armorsBuilder),
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
                  String tempRating = '';
                  String tempEffect = '';
                  return Dialog(
                    backgroundColor: ColorShemeMine().GetBackgroundDark(),
                    child: SingleChildScrollView(
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
                                tempRating = value;
                              }),
                              title: "Рейтинг"),
                          InputTextFF(
                              onChange: ((value) {
                                tempEffect = value;
                              }),
                              title: "Эффект"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('Закрыть',
                                    style: MyTextStyle().GetTextMiniAkcent()),
                              ),
                              TextButton(
                                onPressed: () {
                                  HeroData().AddArmor(
                                      Armor(tempName, tempRating, tempEffect));
                                  Navigator.pop(context);
                                  setState(() {});
                                },
                                child: Text('Добавить',
                                    style: MyTextStyle().GetTextMiniAkcent()),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            child: const Text("Добавить"),
          ),
        ),
        const TextLeftMargin(text: 'Аугментация'),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Builder(builder: augmentationsBuilder),
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
                  String tempRating = '';
                  String tempEntity = '';
                  String tempNote = '';
                  return Dialog(
                    backgroundColor: ColorShemeMine().GetBackgroundDark(),
                    child: SingleChildScrollView(
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
                                tempRating = value;
                              }),
                              title: "Рейтинг"),
                          InputTextFF(
                              isNumerical: true,
                              onChange: ((value) {
                                tempEntity = value;
                              }),
                              title: "Сущность"),
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
                                child: Text('Закрыть',
                                    style: MyTextStyle().GetTextMiniAkcent()),
                              ),
                              TextButton(
                                onPressed: () {
                                  HeroData().AddAugmentation(Augmentation(
                                      tempName,
                                      tempRating,
                                      tempEntity,
                                      tempNote));
                                  Navigator.pop(context);
                                  setState(() {});
                                },
                                child: Text('Добавить',
                                    style: MyTextStyle().GetTextMiniAkcent()),
                              ),
                            ],
                          ),
                        ],
                      ),
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
      ],
    ));
  }

  void RemoveArmor(Armor _armor) {
    HeroData().RemoveArmor(_armor);
    setState(() {});
  }

  Widget armorsBuilder(BuildContext context) {
    List<GestureDetector> result = List.empty(growable: true);
    List<Armor> armors = HeroData().GetArmors();

    for (var i = 0; i < armors.length; i++) {
      result.add(GestureDetector(
          onTap: () => RemoveArmor(armors[i]),
          child: DataCardWidget(heder: armors[i].name, bigData: [
            'Рейтинг',
            armors[i].rating,
            '',
            '',
            'Эффект',
            armors[i].effect,
          ])));
    }

    return Column(children: result);
  }

  void RemoveAugmentation(Augmentation _augmentation) {
    HeroData().RemoveAugmentation(_augmentation);
    setState(() {});
  }

  Widget augmentationsBuilder(BuildContext context) {
    List<GestureDetector> result = List.empty(growable: true);
    List<Augmentation> augmentations = HeroData().GetAugmentations();

    for (var i = 0; i < augmentations.length; i++) {
      result.add(GestureDetector(
        onTap: () => RemoveAugmentation(augmentations[i]),
        child: DataCardWidget(
            heder: augmentations[i].name,
            bigData: [
              'Рейтинг',
              augmentations[i].rating,
              'Сущность',
              augmentations[i].entity
            ],
            smolData: (augmentations[i].note != '')
                ? [
                    'Заметки',
                    augmentations[i].note,
                  ]
                : const []),
      ));
    }

    return Column(children: result);
  }
}
