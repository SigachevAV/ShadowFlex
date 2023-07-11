import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/helpers/show_number_picker.dart';
import 'package:shadow_flex/models/hero.dart';

Future<bool> ChangeMatrix(String _key, BuildContext context) async {
  int temp = 0;
  await showMaterialNumberPicker(
    context: context,
    minNumber: 0,
    maxNumber: 10,
    onChanged: (value) {
      temp = value;
    },
  );
  HeroData().SetGeneralInfo(_key, temp.toString());
  return true;
}
