import 'package:flutter/material.dart';
import 'package:shadow_flex/style/color_sheme.dart';

class ArrowBack extends StatelessWidget {
  const ArrowBack({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20),
      alignment: Alignment.centerLeft,
      child: IconButton(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onPressed: () => Navigator.pop(context),
        icon: Icon(
          Icons.arrow_back_ios_sharp,
          color: ColorShemeMine().GetAkcent(),
        ),
      ),
    );
  }
}
