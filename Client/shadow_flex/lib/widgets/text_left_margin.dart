import 'package:flutter/material.dart';
import 'package:shadow_flex/style/test_style.dart';

class TextLeftMargin extends StatelessWidget {
  final String text;
  const TextLeftMargin({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: MyTextStyle().GetTextDecoration(),
      ),
    );
  }
}
