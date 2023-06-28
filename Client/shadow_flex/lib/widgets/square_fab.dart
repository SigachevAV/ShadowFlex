import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:shadow_flex/style/color_sheme.dart';

class SquareFAB extends StatelessWidget {
  SquareFAB(Function() _function, IconData _icon) {
    this.onPressHandler = _function;
    this.icon = _icon;
  }
  IconData icon = Icons.abc;
  late void Function()? onPressHandler = () {
    return;
  };
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -math.pi / 4 * -1,
      child: FloatingActionButton(
        onPressed: onPressHandler,
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.zero),
        backgroundColor: ColorShemeMine().GetAkcent(),
        child: Transform.rotate(
          child: Icon(icon),
          angle: -math.pi / 4,
        ),
      ),
    );
  }
}
