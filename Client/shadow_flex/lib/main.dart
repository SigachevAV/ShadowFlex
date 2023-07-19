import 'package:flutter/material.dart';
import 'package:shadow_flex/models/hero.dart';
import 'package:shadow_flex/screens/main_screen.dart';
import 'package:shadow_flex/services/adepts_service.dart';
import 'package:shadow_flex/style/color_sheme.dart';
import 'package:shadow_flex/style/test_style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    HeroData hero = HeroData();
    hero.Load();
    AdeptsService adeptsService = AdeptsService();
    adeptsService.getById(2);
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
