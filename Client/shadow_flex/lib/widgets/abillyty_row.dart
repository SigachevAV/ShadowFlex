import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';
import 'package:shadow_flex/models/hero.dart';
import 'package:shadow_flex/models/setup_var.dart';
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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (setupVar.rollMode) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                List<int> roll = heroData.Roll(widget.index, 0);
                int hits = roll.removeAt(0);
                log(roll.toString());
                return Dialog(
                  backgroundColor: ColorShemeMine().GetBackgroundDark(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Hits: " + hits.toString()),
                      Text(roll.toString()),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Close'),
                      ),
                    ],
                  ),
                );
              },
            );
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
