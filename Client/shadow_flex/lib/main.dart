import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shadow_flex/functions/add_harm.dart';
import 'package:shadow_flex/models/hero.dart';
import 'package:shadow_flex/models/setup_var.dart';
import 'package:shadow_flex/pages/characteristics.dart';
import 'package:shadow_flex/pages/general_info.dart';
import 'package:shadow_flex/pages/matrix_page.dart';
import 'package:shadow_flex/pages/qualitiesAndConnections.dart';
import 'package:shadow_flex/pages/spells_page.dart';
import 'package:shadow_flex/pages/ststus.dart';
import 'package:shadow_flex/pages/weapons_page.dart';
import 'package:shadow_flex/screens/main_screen.dart';
import 'package:shadow_flex/style/color_sheme.dart';
import 'package:shadow_flex/style/test_style.dart';
import 'package:shadow_flex/widgets/drawer_sf.dart';
import 'package:shadow_flex/widgets/header_row.dart';
import 'package:shadow_flex/widgets/navigation_bar.dart';
import 'package:shadow_flex/widgets/square_fab.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    HeroData hero = HeroData();
    hero.Load();
    return MaterialApp(
      title: 'ShadowFlex',
      theme: ThemeData(
          primarySwatch: ColorShemeMine().GetAkcentMaterial(),
          colorScheme: ColorScheme.fromSwatch(
              accentColor: ColorShemeMine().GetAkcent(),
              backgroundColor: ColorShemeMine().GetBackgroundDark()),
          textTheme: TextTheme(bodyMedium: MyTextStyle().GetTextDecoration())),
      home: const MainPagesViev(),
    );
  }
}
