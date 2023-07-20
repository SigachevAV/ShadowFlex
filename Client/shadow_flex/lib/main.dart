import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:shadow_flex/models/hero.dart';
import 'package:shadow_flex/screens/main_screen.dart';
import 'package:shadow_flex/services/adepts_service.dart';
import 'package:shadow_flex/style/color_sheme.dart';
import 'package:shadow_flex/style/test_style.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  HeroData data = HeroData();
  data.Load().then(
    (value) => FlutterNativeSplash.remove(),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
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
