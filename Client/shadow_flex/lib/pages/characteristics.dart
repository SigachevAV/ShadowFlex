import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shadow_flex/style/test_style.dart';

class CharacteristicsPage extends StatefulWidget {
  const CharacteristicsPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _CharacteristicsPageState();
}

class _CharacteristicsPageState extends State<CharacteristicsPage> {
  TextStyle style = MyTextStyle().GetTextDecoration();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Тело",
              style: style,
            ),
            Container(
              width: 10,
              child: TextField(),
              alignment: Alignment.topLeft,
            )
          ],
        ),
        Row(
          children: [
            Text(
              "Ловкость",
              style: style,
            ),
            SizedBox(
              width: 20,
              height: 35,
              child: TextField(
                decoration:
                    InputDecoration(fillColor: Colors.amber, filled: true),
              ),
            )
          ],
        ),
        Container(
          child: Row(
            children: [
              Container(
                width: 5,
              ),
              Text(
                "Атлетика",
                style: style,
              ),
              SizedBox(
                width: 10,
                child: TextField(),
              )
            ],
          ),
        ),
      ],
    );
  }
}
