import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';
import 'package:shadow_flex/models/harm.dart';
import 'package:shadow_flex/models/harm_types.dart';
import 'package:shadow_flex/models/hero.dart';
import 'package:shadow_flex/style/color_sheme.dart';

class HarmRow extends StatefulWidget {
  final Harm harm;
  final Function() NotifyParent;
  const HarmRow({super.key, required this.harm, required this.NotifyParent});

  @override
  State<HarmRow> createState() => _HarmRowState();
}

class _HarmRowState extends State<HarmRow> {
  String type = '';
  int val = 0;

  @override
  void initState() {
    Update();
  }

  void Update() {
    GetType();
    val = widget.harm.value;
    log(type + " " + val.toString());
  }

  String GetType() {
    switch (widget.harm.type) {
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
    return type;
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
                  title: "Число урона",
                  backgroundColor: ColorShemeMine().GetBackgroundDark(),
                  headerColor: ColorShemeMine().GetUninteractiveDark(),
                  headerTextColor: ColorShemeMine().GetAkcent(),
                  buttonTextColor: ColorShemeMine().GetTextDark(),
                  selectedNumber: val,
                  onChanged: (value) {
                    val = value;
                  },
                  onConfirmed: () {})
              .then((value) {
            widget.harm.value = val;
            log(HeroData().stun[1].toString());
            setState(() {
              log('message');
            });
            Update();
            widget.NotifyParent();
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
                  Container(width: 200, child: Text(GetType())),
                  Spacer(
                    flex: 10,
                  ),
                  Text(widget.harm.value.toString()),
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
