import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../style/test_style.dart';

class GeneralInf extends StatefulWidget {
  final String title;
  final String fill;
  final bool isNumerical;
  const GeneralInf(
      {Key? key,
      required this.title,
      required this.fill,
      this.isNumerical = false})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _GeneralInf();
}

class _GeneralInf extends State<GeneralInf> {
  TextStyle style = MyTextStyle().GetTextDecoration();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(
          flex: 1,
        ),
        Flexible(
          flex: 10,
          child: TextFormField(
            style: style,
            keyboardType: (widget.isNumerical) ? TextInputType.number : null,
            inputFormatters: (widget.isNumerical)
                ? [FilteringTextInputFormatter.digitsOnly]
                : [],
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF5D5858)),
                  borderRadius: BorderRadius.all(Radius.zero)),
              labelText: widget.title,
              labelStyle: MyTextStyle().GetTextMiniAkcent(),
            ),
          ),
        ),
        Spacer(
          flex: 1,
        )
      ],
    );
  }
}
