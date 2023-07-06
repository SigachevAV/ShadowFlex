import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:shadow_flex/models/hero.dart';
import 'package:shadow_flex/style/color_sheme.dart';
import 'package:shadow_flex/style/test_style.dart';
import 'package:shadow_flex/widgets/harm_row.dart';
import 'package:shadow_flex/widgets/status_grid.dart';
import 'package:shadow_flex/widgets/text_left_margin.dart';

class StatusPage extends StatefulWidget {
  const StatusPage({super.key});

  @override
  State<StatusPage> createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  Widget BuildList(BuildContext context, StateSetter stateSetter) {
    List<Widget> list = List.empty(growable: true);
    for (var i = 0; i < HeroData().harms.length; i++) {
      log(HeroData().harms[i].value.toString() + " " + i.toString());
      list.add(HarmRow(
        harm: HeroData().harms[i],
        NotifyParent: Refresh,
      ));
    }
    return Column(children: list);
  }

  void Refresh() {
    HeroData().UpdateStatusValue();
    HeroData().Write();
    setState(() {
      HeroData().UpdateStatusValue();
      HeroData().harms.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() {}),
      child: Column(children: [
        Container(
          height: 21,
        ),
        TextLeftMargin(text: "Физический урон"),
        StatusGrid(statuses: HeroData().helth, size: 18),
        TextLeftMargin(text: "Оглушающий урон"),
        StatusGrid(statuses: HeroData().stun, size: 12),
        TextLeftMargin(text: "Травмы"),
        StatefulBuilder(builder: BuildList)
      ]),
    );
  }
}
