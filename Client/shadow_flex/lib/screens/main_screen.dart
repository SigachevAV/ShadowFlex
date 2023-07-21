import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:http/http.dart';
import 'package:shadow_flex/functions/add_harm.dart';
import 'package:shadow_flex/models/hero.dart';
import 'package:shadow_flex/models/setup_var.dart';
import 'package:shadow_flex/pages/armors_page.dart';
import 'package:shadow_flex/pages/characteristics.dart';
import 'package:shadow_flex/pages/general_info.dart';
import 'package:shadow_flex/pages/matrix_page.dart';
import 'package:shadow_flex/pages/qualitiesAndConnections.dart';
import 'package:shadow_flex/pages/spells_page.dart';
import 'package:shadow_flex/pages/ststus.dart';
import 'package:shadow_flex/pages/weapons_page.dart';
import 'package:shadow_flex/style/color_sheme.dart';
import 'package:shadow_flex/widgets/drawer_sf.dart';
import 'package:shadow_flex/widgets/header_row.dart';
import 'package:shadow_flex/widgets/navigation_bar.dart';
import 'package:shadow_flex/widgets/square_fab.dart';

class MainPagesViev extends StatefulWidget {
  const MainPagesViev({Key? key}) : super(key: key);
  @override
  State<MainPagesViev> createState() => _MainPagesVievState();
}

class _MainPagesVievState extends State<MainPagesViev> {
  final PageController controller = PageController(initialPage: 2);
  IconData icon = Icons.casino_sharp;
  SetupVar setupVar = SetupVar();
  int page = 2;
  HeroData date = HeroData();
  @override
  void initState() {
    page = controller.initialPage;
    controller.addListener(() {
      setState(() {
        page = controller.page!.toInt();
      });
    });
    super.initState();
    //upDate();
  }

  void upDate() {
    setState(() {
      date.Load().then((value) => FlutterNativeSplash.remove());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerSF(),
      backgroundColor: ColorShemeMine().GetBackgroundDark(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: ColorShemeMine().GetAkcent()),
        backgroundColor: ColorShemeMine().GetUninteractiveDark(),
        title: HeaderRow(controller: controller),
      ),
      body: PageView(
        controller: controller,
        children: [
          GeneralInfoPage(),
          QualitiesAndConnectionsPage(),
          CharacteristicsPage(),
          StatusPage(),
          ArmorsPage(),
          WeaponsPage(),
          MatrixPage(),
          SpellsPage(),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Visibility(
            visible: (page == 2),
            child: SquareFAB(
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
          ),
          Visibility(
            visible: (page == 3),
            child: SquareFAB(() {
              AddHarmToHero(context).then((value) {
                setState(() {});
              });
            }, Icons.bolt_sharp),
          )
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
