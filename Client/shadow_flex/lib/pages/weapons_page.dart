import 'package:flutter/material.dart';
import 'package:shadow_flex/models/hero.dart';
import 'package:shadow_flex/models/melee_weapon.dart';
import 'package:shadow_flex/models/weapon.dart';
import 'package:shadow_flex/style/color_sheme.dart';
import 'package:shadow_flex/style/test_style.dart';
import 'package:shadow_flex/widgets/data_card.dart';
import 'package:shadow_flex/widgets/text_input_decorator.dart';
import 'package:shadow_flex/widgets/text_left_margin.dart';

class WeaponsPage extends StatefulWidget {
  const WeaponsPage({super.key});

  @override
  State<WeaponsPage> createState() => _WeaponsPageState();
}

class _WeaponsPageState extends State<WeaponsPage> {
  void ShowAddWeaponDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String tempName = '';
        String tempDF = '';
        String tempRait = '';

        String tempAmmo = '';
        String tempRS = '';
        return Dialog(
          backgroundColor: ColorShemeMine().GetBackgroundDark(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(height: 10),
              InputTextFF(
                  onChange: (value) {
                    tempName = value;
                  },
                  title: 'Имя'),
              InputTextFF(
                  isNumerical: true,
                  onChange: (value) {
                    tempDF = value;
                  },
                  title: 'СУ'),
              InputTextFF(
                  isNumerical: true,
                  onChange: (value) {
                    tempAmmo = value;
                  },
                  title: 'Боезапас'),
              InputTextFF(
                  onChange: (value) {
                    tempRait = value;
                  },
                  title: 'Рейтинг атаки'),
              InputTextFF(
                  onChange: (value) {
                    tempRS = value;
                  },
                  title: 'Режимы стрельбы'),
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
                      try {
                        HeroData().AddWeapon(Weapon(
                            tempAmmo, tempDF, tempRait, tempName, tempRS));
                      } on Exception catch (e) {
                        Navigator.pop(context);
                      }
                      setState(() {});
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
  }

  void ShowAddMeelyDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String tempName = '';
        String tempDF = '';
        String tempMelee = '';
        return Dialog(
          backgroundColor: ColorShemeMine().GetBackgroundDark(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(height: 10),
              InputTextFF(
                  onChange: (value) {
                    tempName = value;
                  },
                  title: 'Имя'),
              InputTextFF(
                  isNumerical: true,
                  onChange: (value) {
                    tempDF = value;
                  },
                  title: 'СУ'),
              InputTextFF(
                  isNumerical: true,
                  onChange: (value) {
                    tempMelee = value;
                  },
                  title: 'Вплотную'),
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
                      try {
                        HeroData().AddMeleeWeapon(
                            MeleeWeapon(tempDF, tempMelee, tempName));
                      } on Exception catch (e) {
                        Navigator.pop(context);
                      }
                      setState(() {});
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
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Container(
          height: 20,
        ),
        TextLeftMargin(text: "Огнестрельное оружие"),
        Builder(builder: fireBuilder),
        Container(
          height: 35,
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: ColorShemeMine().GetAkcent()),
          ),
          child: TextButton(
            style: TextButton.styleFrom(
                textStyle: MyTextStyle().GetTextMiniAkcent(),
                primary: ColorShemeMine().GetAkcent(),
                padding: const EdgeInsets.fromLTRB(64, 4, 64, 4)),
            onPressed: () {
              ShowAddWeaponDialog();
            },
            child: const Text("Добавить оружие"),
          ),
        ),
        TextLeftMargin(text: "Оружие ближнего боя"),
        Builder(builder: meleeBuilder),
        Container(
          height: 35,
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: ColorShemeMine().GetAkcent()),
          ),
          child: TextButton(
            style: TextButton.styleFrom(
                textStyle: MyTextStyle().GetTextMiniAkcent(),
                primary: ColorShemeMine().GetAkcent(),
                padding: const EdgeInsets.fromLTRB(64, 4, 64, 4)),
            onPressed: () {
              ShowAddMeelyDialog();
            },
            child: const Text("Добавить оружие"),
          ),
        ),
        Container(
          height: 30,
        )
      ]),
    );
  }

  void RemoveMeleeWeapon(MeleeWeapon _weapon) {
    HeroData().RemoveMeleeWeapon(_weapon);
    setState(() {});
  }

  void RemoveWeapon(Weapon _weapon) {
    HeroData().RemoveWeapon(_weapon);
    setState(() {});
  }

  Widget meleeBuilder(BuildContext context) {
    List<Widget> result = List.empty(growable: true);
    List<MeleeWeapon> weapons = HeroData().GetMeelyWeapons();
    for (var i = 0; i < weapons.length; i++) {
      result.add(
        GestureDetector(
          onTap: () {
            RemoveMeleeWeapon(weapons[i]);
          },
          child: DataCardWidget(
              heder: weapons[i].name,
              bigData: ["СУ", weapons[i].dF, "Вплотную", weapons[i].melee]),
        ),
      );
    }
    return Column(
      children: result,
    );
  }

  Widget fireBuilder(BuildContext context) {
    List<Widget> result = List.empty(growable: true);
    List<Weapon> weapons = HeroData().GetWeapon();

    for (var i = 0; i < weapons.length; i++) {
      result.add(GestureDetector(
        onTap: () {
          RemoveWeapon(weapons[i]);
        },
        child: DataCardWidget(
          heder: weapons[i].name,
          bigData: [
            "СУ",
            weapons[i].dF,
            "РС",
            weapons[i].rS,
            "Боезапас",
            weapons[i].ammo
          ],
          smolData: ["Рейтинг атаки", weapons[i].atackRait],
        ),
      ));
    }

    return Column(
      children: result,
    );
  }
}
