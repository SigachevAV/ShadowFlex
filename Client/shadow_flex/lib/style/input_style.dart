import 'package:flutter/material.dart';
import 'package:shadow_flex/style/color_sheme.dart';
import 'package:shadow_flex/style/test_style.dart';

class InputStyle {
  InputDecoration GetDecoratorWithLabel(String _label) {
    return InputDecoration(
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorShemeMine().GetAkcent())),
      enabledBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorShemeMine().GetUnderlineDark(), width: 1.0),
        borderRadius: BorderRadius.all(Radius.zero),
      ),
      disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: ColorShemeMine().GetUnderlineDark(), width: 1.0),
          borderRadius: BorderRadius.all(Radius.zero)),
      labelText: _label,
      labelStyle: MyTextStyle().GetTextDecoration(),
    );
  }
}
