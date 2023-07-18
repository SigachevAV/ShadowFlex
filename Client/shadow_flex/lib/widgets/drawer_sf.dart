import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shadow_flex/screens/info_screen.dart';
import 'package:shadow_flex/screens/main_screen.dart';
import 'package:shadow_flex/screens/setings_screen.dart';
import 'package:shadow_flex/style/color_sheme.dart';
import 'package:shadow_flex/style/test_style.dart';
import 'package:shadow_flex/widgets/drawer_button.dart';

class DrawerSF extends StatefulWidget {
  const DrawerSF({super.key});

  @override
  State<DrawerSF> createState() => _DrawerSFState();
}

class _DrawerSFState extends State<DrawerSF> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorShemeMine().GetBackgroundDark(),
      child: SingleChildScrollView(
        child: Column(
          children: [
            DrawerHeader(
              padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
              decoration: BoxDecoration(
                color: ColorShemeMine().GetUninteractiveDark(),
              ),
              child: Container(
                width: double.infinity,
                alignment: Alignment.centerLeft,
                child: Text(
                  "ShadowFlex",
                  style: MyTextStyle().GetTextAkcentDecoration(),
                ),
              ),
            ),
            DrawerButtonSF(
                icon: Icons.auto_stories_sharp,
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (BuildContext context) => MainPagesViev()),
                      (Route<dynamic> route) => false);
                },
                title: "Персонаж"),
            DrawerButtonSF(
                icon: Icons.search_sharp,
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (BuildContext context) => InfoScreen()),
                      (Route<dynamic> route) => false);
                },
                title: "Справка"),
            DrawerButtonSF(
                icon: Icons.settings,
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (BuildContext context) => SettingsScreen()),
                      (Route<dynamic> route) => false);
                },
                title: "Настройки"),
          ],
        ),
      ),
    );
  }
}
