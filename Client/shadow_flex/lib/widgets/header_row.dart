import 'package:flutter/material.dart';
import 'package:shadow_flex/style/test_style.dart';

class HeaderRow extends StatefulWidget {
  final PageController controller;
  const HeaderRow({super.key, required this.controller});

  @override
  State<HeaderRow> createState() => _HeaderRowState();
}

class _HeaderRowState extends State<HeaderRow> {
  int page = 0;

  @override
  void initState() {
    page = widget.controller.initialPage;
    widget.controller.addListener(() {
      setState(() {
        page = widget.controller.page!.toInt();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Visibility(
          visible: (page == 0),
          child: Text(
            "Общая информация",
            style: MyTextStyle().GetTextAkcentDecoration(),
          ),
        ),
        Visibility(
          visible: (page == 1),
          child: Text(
            "Качества и связи",
            style: MyTextStyle().GetTextAkcentDecoration(),
          ),
        ),
        Visibility(
          visible: (page == 2),
          child: Text(
            "Навыки и способности",
            style: MyTextStyle().GetTextAkcentDecoration(),
          ),
        ),
        Visibility(
          visible: (page == 3),
          child: Text(
            "Урон и травмы",
            style: MyTextStyle().GetTextAkcentDecoration(),
          ),
        ),
        Visibility(
          visible: (page == 4),
          child: Text(
            "Броня",
            style: MyTextStyle().GetTextAkcentDecoration(),
          ),
        ),
        Visibility(
          visible: (page == 5),
          child: Text(
            "Оружие",
            style: MyTextStyle().GetTextAkcentDecoration(),
          ),
        ),
        Visibility(
          visible: (page == 6),
          child: Text(
            "Матрица",
            style: MyTextStyle().GetTextAkcentDecoration(),
          ),
        ),
        Visibility(
          visible: (page == 7),
          child: Text(
            "Заклинания и прочее",
            style: MyTextStyle().GetTextAkcentDecoration(),
          ),
        ),
      ],
    );
  }
}
