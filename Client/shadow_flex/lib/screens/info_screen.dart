import 'package:flutter/material.dart';
import 'package:shadow_flex/screens/info/adeptus_all_info.dart';
import 'package:shadow_flex/style/color_sheme.dart';
import 'package:shadow_flex/style/test_style.dart';
import 'package:shadow_flex/widgets/drawer_sf.dart';
import 'package:shadow_flex/widgets/text_left_margin.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerSF(),
      backgroundColor: ColorShemeMine().GetBackgroundDark(),
      appBar: AppBar(
        backgroundColor: ColorShemeMine().GetUninteractiveDark(),
        title: Text(
          "Справка",
          style: MyTextStyle().GetTextAkcentDecoration(),
        ),
      ),
      body: Column(children: [
        Container(
          height: 20,
        ),
        GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          AdeptusInfoAllScreen()));
            },
            child: TextLeftMargin(text: "Способности адепта")),
        Container(
          height: 30,
        ),
      ]),
    );
  }
}
