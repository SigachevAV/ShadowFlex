import 'package:flutter/material.dart';
import 'package:shadow_flex/functions/add_harm.dart';
import 'package:shadow_flex/models/setup_var.dart';
import 'package:shadow_flex/widgets/square_fab.dart';

class ContextFAB extends StatefulWidget {
  final PageController controller;
  const ContextFAB({super.key, required this.controller});

  @override
  State<ContextFAB> createState() => _ContextFABState();
}

class _ContextFABState extends State<ContextFAB> {
  SetupVar setupVar = SetupVar();
  IconData icon = Icons.casino_sharp;
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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Visibility(
          visible: (widget.controller.page == 2),
          child: SquareFAB(
              () => {
                    setState(() {
                      setupVar.ChangeMode();
                      if (setupVar.rollMode) {
                        icon = Icons.casino_sharp;
                      } else {
                        icon = Icons.create_sharp;
                      }
                    })
                  },
              icon),
        ),
        Visibility(
          visible: (widget.controller.page == 3),
          child: SquareFAB(() {
            AddHarmToHero(context).then((value) {
              setState(() {});
            });
          }, Icons.bolt_sharp),
        )
      ],
    );
  }
}
