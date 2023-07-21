import 'package:flutter/material.dart';
import 'package:shadow_flex/models/hero.dart';
import 'package:shadow_flex/style/color_sheme.dart';
import 'package:shadow_flex/style/test_style.dart';
import 'package:shadow_flex/widgets/drawer_sf.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerSF(),
      backgroundColor: ColorShemeMine().GetBackgroundDark(),
      appBar: AppBar(
        backgroundColor: ColorShemeMine().GetUninteractiveDark(),
        iconTheme: IconThemeData(color: ColorShemeMine().GetAkcent()),
        title: Text(
          "Настройки",
          style: MyTextStyle().GetTextAkcentDecoration(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 20,
            ),
            Container(
                height: 35,
                margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
                decoration: BoxDecoration(
                  border: Border.all(color: ColorShemeMine().GetAkcent()),
                ),
                child: MaterialButton(
                  onPressed: () {
                    try {
                      launchUrl(Uri.parse(
                          "https://github.com/SigachevAV/ShadowFlex/discussions/categories/вug-reports"));
                    } catch (e) {}
                  },
                  child: Row(children: [
                    Icon(
                      Icons.bug_report_sharp,
                      color: ColorShemeMine().GetAkcent(),
                    ),
                    Container(
                      width: 10,
                    ),
                    Text(
                      "Сообщить об ошибке",
                      style: TextStyle(
                          fontSize: 17, color: ColorShemeMine().GetAkcent()),
                    )
                  ]),
                )),
            Divider(),
            Container(
              height: 35,
              margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red),
              ),
              child: MaterialButton(
                onPressed: () {
                  HeroData().Trash();
                },
                child: Row(children: [
                  Icon(
                    Icons.refresh_sharp,
                    color: Colors.red,
                  ),
                  Container(
                    width: 10,
                  ),
                  Text(
                    "Удалить данные",
                    style: TextStyle(fontSize: 17, color: Colors.red),
                  )
                ]),
              ),
            ),
            Container(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
