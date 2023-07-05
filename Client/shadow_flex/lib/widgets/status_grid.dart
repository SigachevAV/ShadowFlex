import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:shadow_flex/style/color_sheme.dart';
import 'package:shadow_flex/style/test_style.dart';

class StatusGrid extends StatefulWidget {
  final List<int> statuses;
  final int size;
  const StatusGrid({super.key, required this.statuses, required this.size});

  @override
  State<StatusGrid> createState() => _StatusGridState();
}

class _StatusGridState extends State<StatusGrid> {
  List<Widget> GetGrid() {
    List<Widget> result = List.empty(growable: true);
    int helphy = widget.statuses[0];
    int damaged = widget.statuses[1];
    for (var i = 0; i < widget.size; i++) {
      String text = "";
      Color? borderColor;
      Color? fillColor;
      int index = i;
      if ((index + 1) % 3 == 0) {
        log("have text");
        text += (-1 * (index + 1) ~/ 3).toString();
      }
      if (damaged > 0) {
        fillColor = ColorShemeMine().GetAkcent();
        borderColor = ColorShemeMine().GetUnderlineDark();
        damaged -= 1;
        helphy -= 1;
      } else if (damaged == 0 && helphy > 0) {
        borderColor = ColorShemeMine().GetUnderlineDark();
        helphy -= 1;
      } else if (damaged == 0 && helphy == 0) {
        borderColor = ColorShemeMine().GetUninteractiveDark();
      }
      result.add(Container(
        height: 55,
        width: 55,
        child: Center(
          child: Text(
            text,
            style: MyTextStyle().GetTextDecoration(),
          ),
        ),
        decoration: BoxDecoration(
            border: Border.all(color: borderColor!), color: fillColor),
      ));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(30, 10, 30, 20),
      child: GridView.count(
        primary: false,
        shrinkWrap: true,
        crossAxisCount: 6,
        children: GetGrid(),
      ),
    );
  }
}
