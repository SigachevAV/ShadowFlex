import 'package:flutter/material.dart';
import 'package:shadow_flex/style/color_sheme.dart';

class MyTextStyle {
  TextStyle GetTextDecoration() {
    return TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w500,
        color: ColorShemeMine().GetTextDark());
  }

  TextStyle GetTextAkcentDecoration() {
    return TextStyle(
        fontSize: 23,
        fontWeight: FontWeight.w700,
        color: ColorShemeMine().GetAkcent());
  }

  TextStyle GetTextHeder() {
    return TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: ColorShemeMine().GetTextDark(),
    );
  }

  TextStyle GetTextAkcentBold() {
    return TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w700,
      color: ColorShemeMine().GetAkcent(),
    );
  }

  TextStyle GetTextMiniAkcent() {
    return TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w500,
        color: ColorShemeMine().GetAkcent());
  }
}
