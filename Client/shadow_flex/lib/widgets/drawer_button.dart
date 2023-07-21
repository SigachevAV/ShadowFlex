import 'package:flutter/material.dart';
import 'package:shadow_flex/style/color_sheme.dart';
import 'package:shadow_flex/style/test_style.dart';

class DrawerButtonSF extends StatefulWidget {
  final Function onTap;
  final IconData icon;
  final String title;

  const DrawerButtonSF(
      {super.key,
      required this.icon,
      required this.onTap,
      required this.title});

  @override
  State<DrawerButtonSF> createState() => _DrawerButtonSFState();
}

class _DrawerButtonSFState extends State<DrawerButtonSF> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        widget.onTap();
      },
      minWidth: double.infinity,
      child: Row(
        children: [
          Icon(
            widget.icon,
            color: ColorShemeMine().GetAkcent(),
          ),
          Container(
            width: 10,
          ),
          Text(
            widget.title,
            style: MyTextStyle().GetTextDecoration(),
          )
        ],
      ),
    );
  }
}
