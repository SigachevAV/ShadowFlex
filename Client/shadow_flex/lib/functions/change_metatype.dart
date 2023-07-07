import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/helpers/show_radio_picker.dart';
import 'package:shadow_flex/models/hero.dart';
import 'package:shadow_flex/models/metatypes.dart';
import 'package:shadow_flex/style/color_sheme.dart';

class MetatypeModel {
  Metatype type;
  String name;
  MetatypeModel(this.name, this.type);

  @override
  String toString() {
    return name;
  }
}

Future<bool> ChangeMetatype(BuildContext context) async {
  List<MetatypeModel> models = <MetatypeModel>[
    MetatypeModel("Человек", Metatype.HUMAN),
    MetatypeModel("Орк", Metatype.ORC),
    MetatypeModel("Гном", Metatype.DWARF),
    MetatypeModel("Эльф", Metatype.ELVE),
    MetatypeModel("Троль", Metatype.TROLL)
  ];
  Metatype metatype = Metatype.HUMAN;
  MetatypeModel selected = models[1];
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
      metatype = selected.type;
    },
  );
  HeroData().metatype = metatype;
  HeroData().Write();
  return true;
}
