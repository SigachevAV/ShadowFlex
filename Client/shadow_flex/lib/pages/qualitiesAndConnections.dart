import 'package:flutter/material.dart';
import 'package:shadow_flex/models/connections.dart';
import 'package:shadow_flex/models/hero.dart';
import 'package:shadow_flex/models/trait.dart';
import 'package:shadow_flex/style/color_sheme.dart';
import 'package:shadow_flex/style/test_style.dart';
import 'package:shadow_flex/widgets/table_element.dart';
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
            child: Builder(builder: traitBuilder),
          ),
          Container(
            height: 35,
            margin: const EdgeInsets.only(top: 10, bottom: 20),
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
                              isNumerical: true,
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
              child: Builder(
                builder: connectionBuilder,
              )),
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
                    String tempName = '';
                    String tempLoyal = '';
                    String tempConnection = '';

                    return Dialog(
                      backgroundColor: ColorShemeMine().GetBackgroundDark(),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(height: 10),
                          //TODO ADD FORM
                          InputTextFF(
                              onChange: (value) {
                                tempName = value;
                              },
                              title: 'Имя'),
                          InputTextFF(
                              isNumerical: true,
                              onChange: (value) {
                                tempLoyal = value;
                              },
                              title: 'Лояльность'),
                          InputTextFF(
                            onChange: (value) {
                              tempConnection = value;
                            },
                            title: 'Связь',
                            isNumerical: true,
                          ),
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
                                  try {
                                    int tempIntLoyal = int.parse(tempLoyal);
                                    int tempIntConnection =
                                        int.parse(tempConnection);
                                    HeroData().AddConnection(Connection(
                                        tempName,
                                        tempIntConnection,
                                        tempIntLoyal));
                                  } on Exception catch (e) {
                                    Navigator.pop(context);
                                  }
                                  setState(() {});
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

  void removeTrait(Trait _trait) {
    HeroData().RemoveTrait(_trait);
    setState(() {});
  }

  void removeConnection(Connection _connection) {
    HeroData().RemoveConnection(_connection);
    setState(() {});
  }

  Widget connectionBuilder(BuildContext context) {
    List<TableRow> result = List.empty(growable: true);
    List<Connection> connections = HeroData().GetConnections();

    result.add(
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
    );
    for (var i = 0; i < connections.length; i++) {
      result.add(TableRow(children: <Widget>[
        TableElementRemovable(
            text: connections[i].name,
            onTap: () {
              removeConnection(connections[i]);
            }),
        TableElementRemovable(
            text: connections[i].loyal.toString(),
            onTap: () {
              removeConnection(connections[i]);
            }),
        TableElementRemovable(
            text: connections[i].connection.toString(),
            onTap: () {
              removeConnection(connections[i]);
            })
      ]));
    }

    return Table(
        columnWidths: {
          0: FractionColumnWidth(0.5),
          1: FractionColumnWidth(0.3),
          2: FractionColumnWidth(0.2),
        },
        border: TableBorder.all(
          width: 1,
          color: ColorShemeMine().GetUnderlineDark(),
        ),
        children: result);
  }

  Widget traitBuilder(BuildContext context) {
    List<TableRow> result = List.empty(growable: true);
    List<Trait> traits = HeroData().GetTraits();

    result.add(
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
    );

    for (var i = 0; i < traits.length; i++) {
      result.add(
        TableRow(
          children: <Widget>[
            TableElementRemovable(
                text: traits[i].trait,
                onTap: () {
                  removeTrait(traits[i]);
                }),
            TableElementRemovable(
                text: traits[i].karma.toString(),
                onTap: () {
                  removeTrait(traits[i]);
                }),
          ],
        ),
      );
    }

    return Table(
        columnWidths: {
          0: FractionColumnWidth(0.7),
          1: FractionColumnWidth(0.3),
        },
        border: TableBorder.all(
          width: 1,
          color: ColorShemeMine().GetUnderlineDark(),
        ),
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: result);
  }
}
