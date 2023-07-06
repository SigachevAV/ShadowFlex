import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';
import 'package:shadow_flex/models/harm_types.dart';
import 'package:shadow_flex/models/hero.dart';
import 'package:shadow_flex/style/color_sheme.dart';

class HarmRow extends StatefulWidget {
  final int index;
  const HarmRow({super.key, required this.index});

  @override
  State<HarmRow> createState() => _HarmRowState();
}

class _HarmRowState extends State<HarmRow> {
  String type = '';
  int val = 0;

  @override
  void initState() {
    switch (HeroData().harms[widget.index].type) {
      case HarmTypes.HELTH:
        type = "Физический";
        break;
      case HarmTypes.STUN:
        type = "Оглушающий";
        break;
      case HarmTypes.EXOST:
        type = "Истощение";
        break;
      default:
        break;
    }
    val = HeroData().harms[widget.index].value;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
      child: GestureDetector(
        onTap: () {
          showMaterialNumberPicker(
                  context: context,
                  minNumber: 0,
                  maxNumber: 12,
                  onChanged: (value) {
                    val = value;
                  },
                  onConfirmed: () {})
              .then((value) {
            setState(() {
              HeroData().harms[widget.index].value = val;
              HeroData().UpdateStatusValue();
              log(HeroData().stun[1].toString());
            });
          });
        },
        child: Column(
          children: [
            Container(
              child: Row(
                children: [
                  Container(
                    width: 30,
                  ),
                  Container(width: 200, child: Text(type)),
                  Spacer(
                    flex: 10,
                  ),
                  Text(val.toString()),
                  Container(
                    width: 30,
                  )
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  width: 30,
                ),
                Flexible(
                    flex: 1,
                    child: Container(
                      height: 1,
                      color: ColorShemeMine().GetUnderlineDark(),
                    )),
                Container(
                  width: 30,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
