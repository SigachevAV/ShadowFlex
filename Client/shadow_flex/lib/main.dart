import 'package:flutter/material.dart';
import 'package:shadow_flex/pages/characteristics.dart';
import 'package:shadow_flex/style/color_sheme.dart';
import 'package:shadow_flex/style/test_style.dart';
import 'package:shadow_flex/widgets/navigation_bar.dart';

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
        primarySwatch: Colors.blue,
      ),
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
          Center(child: Text("2")),
          Center(child: Text("3")),
        ],
      ),
      bottomNavigationBar: NavigationBarShadowFlex(),
    );
  }
}
