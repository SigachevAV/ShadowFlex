import 'package:flutter/material.dart';
import 'package:shadow_flex/style/test_style.dart';

class HeaderRow extends StatefulWidget {
  final PageController controller;
  const HeaderRow({super.key, required this.controller});

  @override
  State<HeaderRow> createState() => _HeaderRowState();
}

class _HeaderRowState extends State<HeaderRow> {
  @override
  void initState() {
    widget.controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Visibility(
          visible: (widget.controller.page == 0),
          child: Text(
            "Общая информация",
            style: MyTextStyle().GetTextAkcentDecoration(),
          ),
        ),
        Visibility(
          visible: (widget.controller.page == 1),
          child: Text(
            "Качества и связи",
            style: MyTextStyle().GetTextAkcentDecoration(),
          ),
        ),
        Visibility(
          visible: (widget.controller.page == 2),
          child: Text(
            "Навыки и способности",
            style: MyTextStyle().GetTextAkcentDecoration(),
          ),
        ),
        Visibility(
          visible: (widget.controller.page == 3),
          child: Text(
            "Урон и травмы",
            style: MyTextStyle().GetTextAkcentDecoration(),
          ),
        ),
        Visibility(
          visible: (widget.controller.page == 4),
          child: Text(
            "Броня",
            style: MyTextStyle().GetTextAkcentDecoration(),
          ),
        ),
        Visibility(
          visible: (widget.controller.page == 5),
          child: Text(
            "Оружие",
            style: MyTextStyle().GetTextAkcentDecoration(),
          ),
        ),
        Visibility(
          visible: (widget.controller.page == 6),
          child: Text(
            "Матрица",
            style: MyTextStyle().GetTextAkcentDecoration(),
          ),
        ),
        Visibility(
          visible: (widget.controller.page == 7),
          child: Text(
            "Заклинания и прочее",
            style: MyTextStyle().GetTextAkcentDecoration(),
          ),
        ), 
      ],
    );
  }
}
