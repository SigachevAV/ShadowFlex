import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shadow_flex/models/hero.dart';
import 'package:shadow_flex/models/setup_var.dart';
import 'package:shadow_flex/style/color_sheme.dart';
import 'package:shadow_flex/style/test_style.dart';

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
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            if (setupVar.rollMode) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  List<int> roll = heroData.Roll(widget.index, 0);
                  int hits = roll.removeAt(0);
                  log(roll.toString());
                  return Dialog(
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
            }
          },
          child: Row(
            children: [
              Spacer(
                flex: 3 + 2 * widget.offset,
              ),
              Container(
                width: 250,
                child: Text(
                  widget.name,
                  style: style,
                ),
              ),
              Spacer(
                flex: 10 - 2 * widget.offset,
              ),
              Container(
                width: 20,
                height: 30,
                child: Center(
                  child: Text(
                    heroData.GetAbility(widget.index).toString(),
                    style: style,
                  ),
                ),
              ),
              Spacer(
                flex: 3,
              ),
            ],
          ),
        ),
        Row(
          children: [
            Flexible(
              child: Container(),
              flex: 1 + 1 * widget.offset,
            ),
            Flexible(
              child: Container(
                height: 1,
                color: ColorShemeMine().GetUnderlineDark(),
              ),
              flex: 15 - widget.offset,
            ),
            Container(
              width: 10,
            ),
            Spacer(
              flex: 1,
            )
          ],
        )
      ],
    );
  }
}
