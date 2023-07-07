import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shadow_flex/models/hero.dart';
import 'package:shadow_flex/style/color_sheme.dart';
import 'package:shadow_flex/style/input_style.dart';
import 'package:shadow_flex/style/test_style.dart';

class GeneralInf extends StatefulWidget {
  final String title;
  final String fill;
  final bool isNumerical;
  final String mapKey;
  const GeneralInf(
      {Key? key,
      required this.title,
      required this.fill,
      required this.mapKey,
      this.isNumerical = false})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _GeneralInfState();
}

class _GeneralInfState extends State<GeneralInf> {
  TextStyle style = MyTextStyle().GetTextDecoration();
  String textValue = '';
  HeroData data = HeroData();
  TextEditingController controller = TextEditingController();
  final Color tempColor = ColorShemeMine().GetUnderlineDark();

  @override
  void initState() {
    textValue = data.GetGeneralInfo(widget.mapKey);
    controller.text = textValue;
    super.initState();
  }

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
            controller: controller,
            keyboardType: (widget.isNumerical) ? TextInputType.number : null,
            inputFormatters: (widget.isNumerical)
                ? [FilteringTextInputFormatter.digitsOnly]
                : [],
            onChanged: (value) {
              textValue = value;
              data.SetGeneralInfo(widget.mapKey, textValue);
            },
            cursorColor: ColorShemeMine().GetAkcent(),
            decoration: InputStyle().GetDecoratorWithLabel(widget.title),
          ),
        ),
        Spacer(
          flex: 1,
        )
      ],
    );
  }
}
