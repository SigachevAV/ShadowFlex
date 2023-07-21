import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/helpers/show_number_picker.dart';
import 'package:shadow_flex/models/hero.dart';
import 'package:shadow_flex/style/color_sheme.dart';

Future<bool> ChangeMatrix(
    String _key, String _title, BuildContext context) async {
  int temp = 0;
  await showMaterialNumberPicker(
    context: context,
    title: _title,
    backgroundColor: ColorShemeMine().GetBackgroundDark(),
    headerColor: ColorShemeMine().GetUninteractiveDark(),
    headerTextColor: ColorShemeMine().GetAkcent(),
    buttonTextColor: ColorShemeMine().GetTextDark(),
    minNumber: 0,
    maxNumber: 10,
    onChanged: (value) {
      temp = value;
    },
  );
  HeroData().SetGeneralInfo(_key, temp.toString());
  return true;
}
