import 'package:flutter_material_pickers/flutter_material_pickers.dart';
import 'package:shadow_flex/models/harm_types.dart';
import 'package:shadow_flex/models/hero.dart';
import 'package:shadow_flex/style/color_sheme.dart';

class HarmModels {
  HarmTypes type;
  String name;
  HarmModels(this.name, this.type);

  @override
  String toString() {
    return name;
  }
}

Future<bool?> AddHarmToHero(var context) async {
  List<HarmModels> models = <HarmModels>[
    HarmModels("Физический", HarmTypes.HELTH),
    HarmModels("Оглушающий", HarmTypes.STUN),
    HarmModels("Истощение", HarmTypes.EXOST)
  ];
  HarmTypes type = HarmTypes.HELTH;
  HarmModels selected = models[1];
  int harmValue = 0;
  await showMaterialRadioPicker(
    context: context,
    items: models,
    title: "Тип урона",
    backgroundColor: ColorShemeMine().GetBackgroundDark(),
    headerColor: ColorShemeMine().GetUninteractiveDark(),
    headerTextColor: ColorShemeMine().GetAkcent(),
    buttonTextColor: ColorShemeMine().GetTextDark(),
    selectedItem: selected,
    onChanged: (value) {
      selected = value;
    },
    onConfirmed: () {
      type = selected.type;
    },
  );
  await showMaterialNumberPicker(
      context: context,
      title: "Число урона",
      backgroundColor: ColorShemeMine().GetBackgroundDark(),
      headerColor: ColorShemeMine().GetUninteractiveDark(),
      headerTextColor: ColorShemeMine().GetAkcent(),
      buttonTextColor: ColorShemeMine().GetTextDark(),
      minNumber: 0,
      maxNumber: 12,
      onChanged: (value) {
        harmValue = value;
      });

  HeroData().AddHarm(type, harmValue);
  HeroData().UpdateStatusValue();
  HeroData().Write();
  return true;
}
