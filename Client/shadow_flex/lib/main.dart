import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shadow_flex/functions/add_harm.dart';
import 'package:shadow_flex/models/hero.dart';
import 'package:shadow_flex/models/setup_var.dart';
import 'package:shadow_flex/pages/characteristics.dart';
import 'package:shadow_flex/pages/general_info.dart';
import 'package:shadow_flex/pages/ststus.dart';
import 'package:shadow_flex/style/color_sheme.dart';
import 'package:shadow_flex/style/test_style.dart';
import 'package:shadow_flex/widgets/navigation_bar.dart';
import 'package:shadow_flex/widgets/square_fab.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ShadowFlex',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          colorScheme: ColorScheme.fromSwatch(
              accentColor: ColorShemeMine().GetAkcent(),
              backgroundColor: ColorShemeMine().GetBackgroundDark()),
          textTheme: TextTheme(bodyMedium: MyTextStyle().GetTextDecoration())),
      home: const MainPagesViev(),
    );
  }
}

class MainPagesViev extends StatefulWidget {
  const MainPagesViev({Key? key}) : super(key: key);
  @override
  State<MainPagesViev> createState() => _MainPagesVievState();
}

class _MainPagesVievState extends State<MainPagesViev> {
  final PageController controller = PageController();
  IconData icon = Icons.casino_sharp;
  SetupVar setupVar = SetupVar();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorShemeMine().GetBackgroundDark(),
      appBar: AppBar(
        backgroundColor: ColorShemeMine().GetUninteractiveDark(),
        title: Text(
          "ShadowFlex",
          style: MyTextStyle().GetTextAkcentDecoration(),
        ),
      ),
      body: PageView(
        controller: controller,
        children: [
          CharacteristicsPage(),
          GeneralInfoPage(),
          StatusPage(),
        ],
      ),
      floatingActionButton: Row(
        children: [
          SquareFAB(
              () => {
                    setState(() {
                      setupVar.ChangeMode();
                      if (setupVar.rollMode) {
                        icon = Icons.casino_sharp;
                      } else {
                        icon = Icons.create_sharp;
                      }
                    })
                  },
              icon),
          Spacer(
            flex: 1,
          ),
          SquareFAB(() {
            AddHarmToHero(context);
            setState(() {
              log("update");
            });
          }, Icons.bolt_sharp)
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: SafeArea(
        child: NavigationBarShadowFlex(
          controller: controller,
        ),
        bottom: false,
      ),
    );
  }
}
