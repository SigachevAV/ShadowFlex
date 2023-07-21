import 'package:flutter/material.dart';
import 'package:shadow_flex/models/info_models/adept.dart';
import 'package:shadow_flex/services/adepts_service.dart';
import 'package:shadow_flex/style/color_sheme.dart';
import 'package:shadow_flex/style/test_style.dart';
import 'package:shadow_flex/widgets/arrow_back.dart';
import 'package:shadow_flex/widgets/data_card.dart';
import 'package:shadow_flex/widgets/drawer_sf.dart';
import 'package:shadow_flex/widgets/text_left_margin.dart';

class AdeptusInfoScreen extends StatefulWidget {
  final int adeptusId;
  const AdeptusInfoScreen({super.key, required this.adeptusId});

  @override
  State<AdeptusInfoScreen> createState() => _AdeptusInfoScreenState();
}

class _AdeptusInfoScreenState extends State<AdeptusInfoScreen> {
  Future<AdeptInfo?> GetData() {
    return AdeptsService().getById(widget.adeptusId);
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
          "Способности адепта",
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

  Widget futureBuilder(
      BuildContext context, AsyncSnapshot<AdeptInfo?> snapshot) {
    if (!snapshot.hasData) {
      return TextLeftMargin(text: "Загрузка");
    }
    final data = snapshot.data as AdeptInfo?;
    if (data == null) {
      return TextLeftMargin(text: "Поросята остались без дома");
    }
    List<Widget> result = List<Widget>.empty(growable: true);
    result.add(
      DataCardWidget(
        heder: data.name,
        bigData: ['Цена', data.cost, '', '', 'Активация', data.activation],
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
