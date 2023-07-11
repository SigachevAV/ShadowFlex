import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:shadow_flex/style/color_sheme.dart';

class HexButton extends StatefulWidget {
  const HexButton({super.key});

  @override
  State<HexButton> createState() => _HexButtonState();
}

class _HexButtonState extends State<HexButton> {
  bool isTogled = false;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -math.pi / 2.0,
      child: GestureDetector(
        onTap: () {
          setState(() {
            isTogled = !isTogled;
          });
        },
        child: Icon(
          Icons.hexagon_sharp,
          size: 50,
          color: (isTogled)
              ? ColorShemeMine().GetAkcent()
              : ColorShemeMine().GetUnderlineDark(),
        ),
      ),
    );
  }
}
