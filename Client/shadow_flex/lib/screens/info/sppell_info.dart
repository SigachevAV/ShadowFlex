import 'package:flutter/material.dart';
import 'package:shadow_flex/models/info_models/spell.dart';
import 'package:shadow_flex/services/spells_service.dart';
import 'package:shadow_flex/style/color_sheme.dart';
import 'package:shadow_flex/style/test_style.dart';
import 'package:shadow_flex/widgets/arrow_back.dart';
import 'package:shadow_flex/widgets/data_card.dart';
import 'package:shadow_flex/widgets/drawer_sf.dart';
import 'package:shadow_flex/widgets/text_left_margin.dart';

class SpellInfoScreen extends StatefulWidget {
  final int index;
  const SpellInfoScreen({super.key, required this.index});

  @override
  State<SpellInfoScreen> createState() => _SpellInfoScreenState();
}

class _SpellInfoScreenState extends State<SpellInfoScreen> {
  Future<SpellInfo?> GetData() {
    return SpellsService().getById(widget.index);
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
          "Заклинания",
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
    ;
  }

  Widget futureBuilder(
      BuildContext context, AsyncSnapshot<SpellInfo?> snapshot) {
    if (!snapshot.hasData) {
      return TextLeftMargin(text: "Загрузка");
    }
    final data = snapshot.data as SpellInfo?;
    if (data == null) {
      return TextLeftMargin(text: "Поросята остались без дома");
    }
    List<String> tmpStr = List.empty(growable: true);
    if (data.damage != 'Special') {
      tmpStr.addAll([
        '',
        '',
        'Тип урона',
        data.damage,
      ]);
    }
    List<Widget> result = List<Widget>.empty(growable: true);
    result.add(
      DataCardWidget(
        heder: data.name,
        bigData: [
              'Категория',
              data.category,
              '',
              '',
              'Длительность',
              data.duration,
              '',
              '',
              'Радиус',
              data.range,
            ] +
            tmpStr,
        smolData: ['Истощение', data.dv.toString()],
      ),
    );
    result.add(Container(
        margin: EdgeInsets.fromLTRB(30, 20, 30, 0),
        child: Text(
          data.description,
          textAlign: TextAlign.justify,
          style: MyTextStyle().GetTextDecoration(),
        )));
    return Column(
      children: result,
    );
  }
}
