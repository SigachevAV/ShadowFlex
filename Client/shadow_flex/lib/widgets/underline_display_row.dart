import 'package:flutter/material.dart';
import 'package:shadow_flex/style/color_sheme.dart';
import 'package:shadow_flex/style/test_style.dart';

class UnderlineDisplayRow extends StatefulWidget {
  final String name;
  final String value;
  final int offset;
  const UnderlineDisplayRow(
      {super.key,
      required this.name,
      required this.value,
      required this.offset});

  @override
  State<UnderlineDisplayRow> createState() => _UnderlineDisplayRowState();
}

class _UnderlineDisplayRowState extends State<UnderlineDisplayRow> {
  TextStyle style = MyTextStyle().GetTextDecoration();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
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
                    widget.value,
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
