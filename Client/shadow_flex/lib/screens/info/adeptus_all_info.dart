import 'package:flutter/material.dart';
import 'package:shadow_flex/style/color_sheme.dart';
import 'package:shadow_flex/style/test_style.dart';
import 'package:shadow_flex/widgets/drawer_sf.dart';

class AdeptusInfoAllScreen extends StatefulWidget {
  const AdeptusInfoAllScreen({super.key});

  @override
  State<AdeptusInfoAllScreen> createState() => _AdeptusInfoAllScreenState();
}

class _AdeptusInfoAllScreenState extends State<AdeptusInfoAllScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: DrawerSF(),
        backgroundColor: ColorShemeMine().GetBackgroundDark(),
        appBar: AppBar(
          backgroundColor: ColorShemeMine().GetUninteractiveDark(),
          title: Text(
            "Справка",
            style: MyTextStyle().GetTextAkcentDecoration(),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 20,
              ),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.arrow_back_ios_sharp,
                  color: ColorShemeMine().GetAkcent(),
                ),
              ),
              Container(
                height: 30,
              ),
            ],
          ),
        ));
  }
}
