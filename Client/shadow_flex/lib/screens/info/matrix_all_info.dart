import 'package:flutter/material.dart';
import 'package:shadow_flex/models/info_models/matrix.dart';
import 'package:shadow_flex/screens/info/matrix_info.dart';
import 'package:shadow_flex/services/matrix_service.dart';
import 'package:shadow_flex/services/spells_service.dart';
import 'package:shadow_flex/style/color_sheme.dart';
import 'package:shadow_flex/style/test_style.dart';
import 'package:shadow_flex/widgets/arrow_back.dart';
import 'package:shadow_flex/widgets/drawer_sf.dart';
import 'package:shadow_flex/widgets/text_left_margin.dart';

class MatrixAllInfoScreen extends StatefulWidget {
  const MatrixAllInfoScreen({super.key});

  @override
  State<MatrixAllInfoScreen> createState() => _MatrixAllInfoScreenState();
}

class _MatrixAllInfoScreenState extends State<MatrixAllInfoScreen> {
  Future<Map<String, List<MatrixInfo>>?> GetData() {
    return MatrixService().getAll();
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
    final data = snapshot.data as Map<String, List<MatrixInfo>>?;
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
                  builder: (BuildContext context) => MatrixInfoScreen(
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
