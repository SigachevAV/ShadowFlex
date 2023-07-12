import 'package:flutter/material.dart';
import 'package:shadow_flex/style/test_style.dart';

class TableElementRemovable extends StatefulWidget {
  final String text;
  final Function onTap;
  const TableElementRemovable(
      {super.key, required this.text, required this.onTap});

  @override
  State<TableElementRemovable> createState() => _TableElementRemovableState();
}

class _TableElementRemovableState extends State<TableElementRemovable> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap();
      },
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(5),
        child: Text(widget.text, style: MyTextStyle().GetTextDecoration()),
      ),
    );
  }
}
