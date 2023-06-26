import 'package:flutter/material.dart';

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
      body: PageView(
        controller: controller,
        children: [
          Center(child: Text("1")),
          Center(child: Text("2")),
          Center(child: Text("3")),
        ],
      ),
    );
  }
}
