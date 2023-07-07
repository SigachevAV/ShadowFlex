import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/helpers/show_radio_picker.dart';
import 'package:shadow_flex/models/hero.dart';
import 'package:shadow_flex/style/color_sheme.dart';

Future<bool> ChangeGender(BuildContext context) async {
  List<String> models = <String>["Мужской", "Женский"];
  String selected = models[1];
  String gender = '';
  await showMaterialRadioPicker(
    context: context,
    items: models,
    title: "Выберите метатип",
    backgroundColor: ColorShemeMine().GetBackgroundDark(),
    headerColor: ColorShemeMine().GetUninteractiveDark(),
    headerTextColor: ColorShemeMine().GetAkcent(),
    buttonTextColor: ColorShemeMine().GetTextDark(),
    selectedItem: selected,
    onChanged: (value) {
      selected = value;
    },
    onConfirmed: () {
      gender = selected;
    },
  );
  HeroData().SetGeneralInfo("gender", gender);
  return true;
}
