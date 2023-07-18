import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shadow_flex/style/color_sheme.dart';
import 'package:shadow_flex/style/test_style.dart';

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
          ],
        ),
      ),
    );
  }
}
