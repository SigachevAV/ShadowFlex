import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shadow_flex/style/color_sheme.dart';
import 'package:shadow_flex/style/input_style.dart';
import 'package:shadow_flex/style/test_style.dart';

class InputTextFF extends StatefulWidget {
  final Function(String) onChange;
  final bool isNumerical;
  final String title;
  const InputTextFF(
      {super.key,
      required this.onChange,
      this.isNumerical = false,
      required this.title});

  @override
  State<InputTextFF> createState() => _InputTextFFState();
}

class _InputTextFFState extends State<InputTextFF> {
  TextStyle style = MyTextStyle().GetTextDecoration();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: style,
      keyboardType: (widget.isNumerical) ? TextInputType.number : null,
      inputFormatters:
          (widget.isNumerical) ? [FilteringTextInputFormatter.digitsOnly] : [],
      onChanged: widget.onChange,
      cursorColor: ColorShemeMine().GetAkcent(),
      decoration: InputStyle().GetDecoratorWithLabel(widget.title),
    );
  }
}
