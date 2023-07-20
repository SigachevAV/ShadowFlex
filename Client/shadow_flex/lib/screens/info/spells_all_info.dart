import 'package:flutter/material.dart';
import 'package:shadow_flex/models/info_models/spell.dart';
import 'package:shadow_flex/screens/info/sppell_info.dart';
import 'package:shadow_flex/services/spells_service.dart';
import 'package:shadow_flex/style/color_sheme.dart';
import 'package:shadow_flex/style/test_style.dart';
import 'package:shadow_flex/widgets/arrow_back.dart';
import 'package:shadow_flex/widgets/drawer_sf.dart';
import 'package:shadow_flex/widgets/text_left_margin.dart';

class SpellsAllInfoScreen extends StatefulWidget {
  const SpellsAllInfoScreen({super.key});

  @override
  State<SpellsAllInfoScreen> createState() => _SpellsAllInfoScreenState();
}

class _SpellsAllInfoScreenState extends State<SpellsAllInfoScreen> {
  Future<Map<String, List<SpellInfo>>?> GetData() {
    return SpellsService().getAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerSF(),
      backgroundColor: ColorShemeMine().GetBackgroundDark(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: ColorShemeMine().GetAkcent()),
        backgroundColor: ColorShemeMine().GetUninteractiveDark(),
        title: Text(
          "Силы адепта",
          style: MyTextStyle().GetTextAkcentDecoration(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 20,
            ),
            ArrowBack(),
            FutureBuilder(future: GetData(), builder: futureBuilder),
            Container(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }

  Widget futureBuilder(BuildContext context,
      AsyncSnapshot<Map<String, List<SpellInfo>>?> snapshot) {
    if (!snapshot.hasData) {
      return TextLeftMargin(text: "Загрузка");
    }
    final data = snapshot.data as Map<String, List<SpellInfo>>?;
    if (data == null) {
      return TextLeftMargin(text: "Поросята остались без дома");
    }
    List<Widget> result = List<Widget>.empty(growable: true);

    for (var key in data.keys) {
      result.add(
        Container(
          margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: ColorShemeMine().GetAkcent(), width: 1),
            ),
          ),
          child: Text(
            key.toString(),
            style: MyTextStyle().GetTextAkcentBold(),
          ),
        ),
      );
      for (var element in data[key]!) {
        result.add(GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => SpellInfoScreen(
                        index: element.id,
                      ))),
          child: Container(
              margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
              child: TextLeftMargin(text: element.name)),
        ));
      }
    }
    return Column(
      children: result,
    );
  }
}
