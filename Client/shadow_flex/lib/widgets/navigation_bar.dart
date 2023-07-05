import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shadow_flex/style/color_sheme.dart';

class NavigationBarShadowFlex extends StatefulWidget {
  final PageController controller;
  const NavigationBarShadowFlex({super.key, required this.controller});

  @override
  State<NavigationBarShadowFlex> createState() =>
      _NavigationBarShadowFlexState();
}

class _NavigationBarShadowFlexState extends State<NavigationBarShadowFlex> {
  bool isVisible = false;

  double appBarHeight = 0.1;

  @override
  void initState() {
    widget.controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  void OnOnePress() {
    setState(() {
      widget.controller.jumpToPage(0);
    });
  }

  void OnArrowUpPress() {
    setState(() {
      isVisible = true;
      appBarHeight = 0.1;
      return;
    });
  }

  void OnArrowDownPress() {
    setState(() {
      isVisible = false;
      appBarHeight = 0.05;
      return;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (details) {
        if (details.delta.dy > 0) {
          OnArrowDownPress();
        } else if (details.delta.dy < 0) {
          OnArrowUpPress();
        }
      },
      child: BottomAppBar(
        child: FractionallySizedBox(
          heightFactor: appBarHeight,
          child: Container(
            color: ColorShemeMine().GetUninteractiveDark(),
            child: Row(
              children: [
                Visibility(
                  visible: !isVisible,
                  child: MaterialButton(
                    onPressed: OnArrowUpPress,
                    child: Icon(Icons.arrow_drop_up_sharp,
                        color: ColorShemeMine().GetAkcent(), size: 40),
                  ),
                ),
                Visibility(
                  visible: isVisible,
                  child: MaterialButton(
                    onPressed: OnArrowDownPress,
                    child: Icon(
                      Icons.arrow_drop_down_sharp,
                      color: ColorShemeMine().GetAkcent(),
                      size: 40,
                    ),
                  ),
                ),
                Visibility(
                  visible: isVisible,
                  child: MaterialButton(
                    onPressed: OnOnePress,
                    child: Icon(Icons.star,
                        color: (widget.controller.page == 0)
                            ? ColorShemeMine().GetUnderlineDark()
                            : ColorShemeMine().GetAkcent(),
                        size: 40),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
