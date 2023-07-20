import 'package:flutter/material.dart';
import 'package:shadow_flex/models/info_models/matrix.dart';
import 'package:shadow_flex/services/matrix_service.dart';
import 'package:shadow_flex/style/color_sheme.dart';
import 'package:shadow_flex/style/test_style.dart';
import 'package:shadow_flex/widgets/arrow_back.dart';
import 'package:shadow_flex/widgets/data_card.dart';
import 'package:shadow_flex/widgets/drawer_sf.dart';
import 'package:shadow_flex/widgets/text_left_margin.dart';

class MatrixInfoScreen extends StatefulWidget {
  final int index;
  const MatrixInfoScreen({super.key, required this.index});

  @override
  State<MatrixInfoScreen> createState() => _MatrixInfoScreenState();
}

class _MatrixInfoScreenState extends State<MatrixInfoScreen> {
  Future<MatrixInfo?> GetData() {
    return MatrixService().getById(widget.index);
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
    ;
  }

  Widget futureBuilder(
      BuildContext context, AsyncSnapshot<MatrixInfo?> snapshot) {
    if (!snapshot.hasData) {
      return TextLeftMargin(text: "Загрузка");
    }
    final data = snapshot.data as MatrixInfo?;
    if (data == null) {
      return TextLeftMargin(text: "Поросята остались без дома");
    }
    List<Widget> result = List<Widget>.empty(growable: true);
    result.add(
      DataCardWidget(
        heder: data.name,
        bigData: [
          'Доступ',
          data.access,
          '',
          '',
          'Законность',
          data.legal,
          '',
          '',
          'Тип',
          data.type
        ],
        smolData: ['Проверка', data.check],
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
