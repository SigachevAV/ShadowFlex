import 'package:flutter/material.dart';
import 'package:shadow_flex/functions/change_matrix.dart';
import 'package:shadow_flex/models/hero.dart';
import 'package:shadow_flex/style/color_sheme.dart';
import 'package:shadow_flex/style/test_style.dart';
import 'package:shadow_flex/widgets/data_card.dart';
import 'package:shadow_flex/widgets/general_information.dart';
import 'package:shadow_flex/widgets/hex_row.dart';
import 'package:shadow_flex/widgets/matrix_data_row.dart';
import 'package:shadow_flex/widgets/text_left_margin.dart';

class MatrixPage extends StatefulWidget {
  const MatrixPage({super.key});

  @override
  State<MatrixPage> createState() => _MatrixPageState();
}

class _MatrixPageState extends State<MatrixPage> {
  TextStyle style = MyTextStyle().GetTextDecoration();
  HeroData data = HeroData();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Container(
          height: 20,
        ),
        TextLeftMargin(text: "Характеристики деки"),
        MatrixDataRow(mapKey: "matrixPen", name: "Проникновение"),
        MatrixDataRow(mapKey: "matrixDodge", name: "Ускользание"),
        MatrixDataRow(mapKey: "matrixPower", name: "Вычислительная мощность"),
        MatrixDataRow(mapKey: "matrixSheld", name: "Сетевой экран"),
        GeneralInf(
          title: "Устройства/Рейтинг",
          fill: "",
          mapKey: "matrixGear",
          maxLines: null,
        ),
        TextLeftMargin(text: "Счётчик состояний матрицы"),
        HexRow(lenght: 12),
        Container(
          height: 20,
        ),
      ]),
    );
  }
}
