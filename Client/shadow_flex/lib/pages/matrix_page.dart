import 'package:flutter/material.dart';
import 'package:shadow_flex/functions/change_matrix.dart';
import 'package:shadow_flex/models/hero.dart';
import 'package:shadow_flex/style/color_sheme.dart';
import 'package:shadow_flex/style/test_style.dart';
import 'package:shadow_flex/widgets/data_card.dart';
import 'package:shadow_flex/widgets/general_information.dart';
import 'package:shadow_flex/widgets/hex_row.dart';
import 'package:shadow_flex/widgets/matrix_data_row.dart';
import 'package:shadow_flex/widgets/table_element.dart';
import 'package:shadow_flex/widgets/text_input_decorator.dart';
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
        MatrixDataRow(mapKey: "matrixInit", name: "Инициатива в матрице"),
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
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
          child: Builder(builder: builder),
        ),
        Container(
          height: 35,
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: ColorShemeMine().GetAkcent()),
          ),
          child: TextButton(
            style: TextButton.styleFrom(
                textStyle: MyTextStyle().GetTextMiniAkcent(),
                primary: ColorShemeMine().GetAkcent(),
                padding: const EdgeInsets.fromLTRB(64, 4, 64, 4)),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  String tempName = 'name';
                  return Dialog(
                    backgroundColor: ColorShemeMine().GetBackgroundDark(),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(height: 10),
                        InputTextFF(
                            onChange: (value) {
                              tempName = value;
                            },
                            title: 'Имя'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Закрыть',
                                style: MyTextStyle().GetTextMiniAkcent(),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                try {
                                  HeroData().AddProgram(
                                      (tempName == '') ? 'name' : tempName);
                                } on Exception catch (e) {
                                  Navigator.pop(context);
                                }
                                setState(() {});
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Добавить',
                                style: MyTextStyle().GetTextMiniAkcent(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            child: const Text("Добавить програму"),
          ),
        ),
        TextLeftMargin(text: "Счётчик состояний матрицы"),
        HexRow(lenght: 12),
        Container(
          height: 20,
        ),
      ]),
    );
  }

  void RemoveProgram(String _program) {
    HeroData().RemoveProgram(_program);
    setState(() {});
  }

  Widget builder(BuildContext context) {
    List<TableRow> result = List.empty(growable: true);
    List<String> programs = HeroData().GetPrograms();
    result.add(
      TableRow(
        children: [
          Container(
            height: 27,
            color: ColorShemeMine().GetCardColor(),
            alignment: Alignment.center,
            child: const Text("Програмы"),
          ),
        ],
      ),
    );
    for (var i = 0; i < programs.length; i++) {
      result.add(
        TableRow(
          children: [
            TableElementRemovable(
                text: programs[i],
                onTap: () {
                  RemoveProgram(programs[i]);
                }),
          ],
        ),
      );
    }
    return Table(
      border: TableBorder.all(
        width: 1,
        color: ColorShemeMine().GetUnderlineDark(),
      ),
      children: result,
    );
  }
}
