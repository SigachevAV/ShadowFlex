import 'package:flutter/material.dart';
import 'package:shadow_flex/style/color_sheme.dart';
import 'package:shadow_flex/style/test_style.dart';

class DataCardWidget extends StatefulWidget {
  final String heder;
  final List<String> bigData;
  final List<String> smolData;
  const DataCardWidget(
      {super.key,
      required this.heder,
      required this.bigData,
      this.smolData = const []});

  @override
  State<DataCardWidget> createState() => _DataCardWidgetState();
}

class _DataCardWidgetState extends State<DataCardWidget> {
  Widget builder(BuildContext context) {
    List<Widget> bigRes = List.empty(growable: true);
    for (var i = 0; i < (widget.bigData.length ~/ 4) + 1; i++) {
      List<Widget> temp = List.empty(growable: true);
      for (var j = 0; j < 4; j++) {
        if (i * 4 + j >= widget.bigData.length) {
          break;
        }
        if (widget.bigData[i * 4 + j] == '') {
          continue;
        }
        temp.add(
          Flexible(
            child: Container(
                margin: EdgeInsets.fromLTRB(((j % 2 == 0) ? 10 : 5), 0, 0, 5),
                child: Text(
                  widget.bigData[i * 4 + j],
                  style: (j % 2 == 0)
                      ? MyTextStyle().GetTextDecoration()
                      : MyTextStyle().GetTextAkcentBold(),
                )),
          ),
        );
      }
      bigRes.add(Row(
        children: temp,
      ));
    }
    List<Widget> smolRes = List.empty(growable: true);
    if (widget.smolData != const <String>[]) {
      smolRes.add(Container(
          margin: EdgeInsets.fromLTRB(10, 3, 10, 3),
          child: Text(widget.smolData[0])));
      smolRes.add(Expanded(
          child: Text(
        widget.smolData[1],
        style: MyTextStyle().GetTextAkcentBold(),
      )));
    }

    return Container(
      margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
      child: Row(
        children: [
          Spacer(flex: 1),
          Flexible(
            flex: 10,
            child: Container(
              decoration: BoxDecoration(
                  color: ColorShemeMine().GetUninteractiveDark(),
                  border: Border(
                      bottom: BorderSide(
                          width: 3, color: ColorShemeMine().GetUnderlineDark()),
                      right: BorderSide(
                          width: 3,
                          color: ColorShemeMine().GetUnderlineDark()))),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Text(
                            widget.heder,
                            style: MyTextStyle().GetTextHeder(),
                          ),
                        ),
                      ] +
                      bigRes +
                      <Widget>[
                        Container(
                          color: ColorShemeMine().GetCardColor(),
                          child: Row(
                            children: smolRes,
                          ),
                        )
                      ]),
            ),
          ),
          Spacer(
            flex: 1,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: builder);
  }
}
