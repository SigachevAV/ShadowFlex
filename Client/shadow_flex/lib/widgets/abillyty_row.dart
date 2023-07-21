import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';
import 'package:shadow_flex/models/hero.dart';
import 'package:shadow_flex/models/setup_var.dart';
import 'package:shadow_flex/my_flutter_app_icons.dart';
import 'package:shadow_flex/style/color_sheme.dart';
import 'package:shadow_flex/style/test_style.dart';
import 'package:shadow_flex/widgets/underline_display_row.dart';

class AbillytyRow extends StatefulWidget {
  final int offset;
  final String name;
  final int index;
  const AbillytyRow(
      {Key? key, required this.name, required this.offset, required this.index})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _AbillytyRowState();
}

class _AbillytyRowState extends State<AbillytyRow> {
  TextStyle style = MyTextStyle().GetTextDecoration();
  HeroData heroData = HeroData();
  SetupVar setupVar = SetupVar();
  int stat = 0;

  void ShowRolledDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        List<int> roll = heroData.Roll(widget.index, 0);
        int hits = roll.removeAt(0);
        List<Widget> result = List.empty(growable: true);
        for (var i = 0; i < roll.length / 6; i++) {
          List<Widget> temp = List.empty(growable: true);
          for (var j = 0; j < 6; j++) {
            if (i * 6 + j >= roll.length) {
              break;
            }
            Widget? tempIcon;

            switch (roll[i * 6 + j]) {
              case 6:
                tempIcon = (Icon(
                  MyFlutterApp.dice_six_,
                  size: 40,
                  color: ColorShemeMine().GetAkcent(),
                ));
                break;
              case 5:
                tempIcon = (Icon(
                  MyFlutterApp.dice_five_,
                  size: 40,
                  color: ColorShemeMine().GetAkcent(),
                ));
                break;
              case 4:
                tempIcon = (Icon(
                  MyFlutterApp.dice_four_,
                  size: 40,
                  color: ColorShemeMine().GetCardColor(),
                ));
                break;
              case 3:
                tempIcon = (Icon(
                  MyFlutterApp.dice_three_,
                  size: 40,
                  color: ColorShemeMine().GetCardColor(),
                ));
                break;
              case 2:
                tempIcon = (Icon(
                  MyFlutterApp.dice_two_,
                  size: 40,
                  color: ColorShemeMine().GetCardColor(),
                ));
                break;
              case 1:
                tempIcon = (Icon(
                  MyFlutterApp.dice_one_,
                  size: 40,
                  color: Colors.red,
                ));
                break;
              default:
                break;
            }
            temp.add(Container(
              margin: EdgeInsets.all(1),
              child: tempIcon,
            ));
          }

          result.add(Container(
            margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
            child: Row(
              children: temp,
            ),
          ));
        }
        String resultStatus = '';
        switch (hits) {
          case -1:
            resultStatus = "Glitch";
            break;
          case -2:
            resultStatus = "Critical Glitch";
            break;
          default:
            resultStatus = "Hits: " + hits.toString();
            break;
        }

        log(roll.toString());
        return Dialog(
          backgroundColor: ColorShemeMine().GetBackgroundDark(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Text(
                      resultStatus,
                      style: MyTextStyle().GetTextHeder(),
                    ),
                  ),
                ] +
                result +
                [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Close',
                      style: MyTextStyle().GetTextMiniAkcent(),
                    ),
                  ),
                ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (setupVar.rollMode) {
            ShowRolledDialog();
          } else {
            showMaterialNumberPicker(
              context: context,
              title: widget.name,
              maxNumber: 6,
              minNumber: 0,
              backgroundColor: ColorShemeMine().GetBackgroundDark(),
              headerColor: ColorShemeMine().GetUninteractiveDark(),
              headerTextColor: ColorShemeMine().GetAkcent(),
              buttonTextColor: ColorShemeMine().GetTextDark(),
              selectedNumber: heroData.GetAbility(widget.index),
              onChanged: (value) =>
                  setState(() => heroData.SetAbillyty(widget.index, value)),
            );
          }
        },
        child: UnderlineDisplayRow(
            name: widget.name,
            value: HeroData().GetAbility(widget.index).toString(),
            offset: widget.offset));
  }
}
