import 'package:flutter/material.dart';
import 'package:shadow_flex/models/info_models/adept.dart';
import 'package:shadow_flex/screens/info/adeptus_info.dart';
import 'package:shadow_flex/services/adepts_service.dart';
import 'package:shadow_flex/style/color_sheme.dart';
import 'package:shadow_flex/style/test_style.dart';
import 'package:shadow_flex/widgets/arrow_back.dart';
import 'package:shadow_flex/widgets/drawer_sf.dart';
import 'package:shadow_flex/widgets/text_left_margin.dart';

class AdeptusInfoAllScreen extends StatefulWidget {
  const AdeptusInfoAllScreen({super.key});

  @override
  State<AdeptusInfoAllScreen> createState() => _AdeptusInfoAllScreenState();
}

class _AdeptusInfoAllScreenState extends State<AdeptusInfoAllScreen> {
  Future<List<AdeptInfo>?> GetData() {
    return AdeptsService().getAll();
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

  Widget futureBuilder(BuildContext context, AsyncSnapshot snapshot) {
    if (!snapshot.hasData) {
      return TextLeftMargin(text: "Загрузка");
    }
    final data = snapshot.data as List<AdeptInfo>?;
    if (data == null) {
      return TextLeftMargin(text: "Поросята остались без дома");
    }
    List<Widget> result = List<Widget>.empty(growable: true);
    for (var i = 0; i < data.length; i++) {
      result.add(GestureDetector(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => AdeptusInfoScreen(
                      adeptusId: data[i].id,
                    ))),
        child: Container(
            margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
            child: TextLeftMargin(text: data[i].name)),
      ));
    }
    return Column(
      children: result,
    );
  }
}
