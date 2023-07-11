import 'package:flutter/material.dart';
import 'package:shadow_flex/models/hero.dart';
import 'package:shadow_flex/models/trait.dart';
import 'package:shadow_flex/style/color_sheme.dart';
import 'package:shadow_flex/style/test_style.dart';
import 'package:shadow_flex/widgets/text_input_decorator.dart';
import 'package:shadow_flex/widgets/text_left_margin.dart';

class QualitiesAndConnectionsPage extends StatefulWidget {
  const QualitiesAndConnectionsPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QualitiesAndConnectionsPage();
}

class _QualitiesAndConnectionsPage extends State<QualitiesAndConnectionsPage> {
  TextStyle style = MyTextStyle().GetTextDecoration();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 20,
          ),
          const TextLeftMargin(
            text: "Качества",
          ),
          Padding(
              padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
              child: Builder(builder: traitBuilder)),
          Container(
            height: 35,
            margin: const EdgeInsets.only(top: 10, bottom: 20),
            decoration: BoxDecoration(
              border: Border.all(color: ColorShemeMine().GetAkcent()),
            ),
            child: TextButton(
              style: TextButton.styleFrom(
                  textStyle: MyTextStyle().GetTextMiniAkcent(),
                  padding: const EdgeInsets.fromLTRB(64, 4, 64, 4)),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    String tempName = '';
                    String tempKarma = '';
                    return Dialog(
                      backgroundColor: ColorShemeMine().GetBackgroundDark(),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(height: 10),
                          //TODO ADD FORM
                          InputTextFF(
                              onChange: ((value) {
                                tempName = value;
                              }),
                              title: "Качество"),
                          InputTextFF(
                              onChange: ((value) {
                                tempKarma = value;
                              }),
                              title: "Карма"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Закрыть'),
                              ),
                              TextButton(
                                onPressed: () {
                                  int? temp = int.tryParse(tempKarma);
                                  if (temp == null) {
                                    temp = 0;
                                  }
                                  HeroData().AddTrait(Trait(temp, tempName));
                                  Navigator.pop(context);
                                  setState(() {});
                                },
                                child: const Text('Добавить'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: const Text("Добавить качество"),
            ),
          ),
          const TextLeftMargin(
            text: "Знакомства",
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
            // padding: EdgeInsets.zero,
            child: Table(
              columnWidths: {
                0: FractionColumnWidth(0.5),
                1: FractionColumnWidth(0.3),
                2: FractionColumnWidth(0.2),
              },
              border: TableBorder.all(
                width: 1,
                color: ColorShemeMine().GetUnderlineDark(),
              ),
              children: [
                TableRow(
                  children: <Widget>[
                    Container(
                      height: 27,
                      alignment: Alignment.center,
                      child: const Text("Имя"),
                    ),
                    Container(
                      height: 27,
                      alignment: Alignment.center,
                      child: const Text("Лояльность"),
                    ),
                    Container(
                      height: 27,
                      alignment: Alignment.center,
                      child: const Text("Связь"),
                    ),
                  ],
                ),
                TableRow(
                  children: <Widget>[
                    Container(
                      height: 27,
                    ),
                    Container(
                      height: 27,
                    ),
                    Container(
                      height: 27,
                    )
                  ],
                ),
              ],
            ),
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
                  padding: const EdgeInsets.fromLTRB(64, 4, 64, 4)),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      backgroundColor: ColorShemeMine().GetBackgroundDark(),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Container(height: 10),
                          //TODO ADD FORM
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Закрыть'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Добавить'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: const Text("Добавить знакомство"),
            ),
          ),
          Container(
            height: 30,
          ),
        ],
      ),
    );
  }

  Widget traitBuilder(BuildContext context) {
    List<Widget> result = List.empty(growable: true);

    return Table(
      border: TableBorder.all(
        width: 1,
        color: ColorShemeMine().GetUnderlineDark(),
      ),
      children: [
        TableRow(
          children: <Widget>[
            Container(
              height: 27,
              alignment: Alignment.center,
              child: const Text("Название"),
            ),
            Container(
              height: 27,
              alignment: Alignment.center,
              child: const Text("Карма"),
            )
          ],
        ),
        TableRow(
          children: <Widget>[
            Container(
              height: 27,
            ),
            Container(
              height: 27,
            ),
          ],
        ),
      ],
    );
  }
}
