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
  double iconSize = 20;

  double appBarHeight = 50;

  @override
  void initState() {
    widget.controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  void OnFourPress() {
    setState(() {
      widget.controller.jumpToPage(3);
    });
  }

  void OnFivePress() {
    setState(() {
      widget.controller.jumpToPage(4);
    });
  }

  void OnSixPress() {
    setState(() {
      widget.controller.jumpToPage(5);
    });
  }

  void OnSevenPress() {
    setState(() {
      widget.controller.jumpToPage(6);
    });
  }

  void OnEithPress() {
    setState(() {
      widget.controller.jumpToPage(7);
    });
  }

  void OnThreePress() {
    setState(() {
      widget.controller.jumpToPage(2);
    });
  }

  void OnTwoPress() {
    setState(() {
      widget.controller.jumpToPage(1);
    });
  }

  void OnOnePress() {
    setState(() {
      widget.controller.jumpToPage(0);
    });
  }

  void OnArrowUpPress() {
    setState(() {
      isVisible = true;
      appBarHeight = 100;
      return;
    });
  }

  void OnArrowDownPress() {
    setState(() {
      isVisible = false;
      appBarHeight = 50;
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
        child: Container(
          height: appBarHeight,
          child: Container(
            color: ColorShemeMine().GetUninteractiveDark(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Visibility(
                      visible: isVisible,
                      child: IconButton(
                        iconSize: iconSize,
                        onPressed: OnOnePress,
                        icon: Icon(Icons.star,
                            color: (widget.controller.page == 0)
                                ? ColorShemeMine().GetUnderlineDark()
                                : ColorShemeMine().GetAkcent(),
                            size: iconSize),
                      ),
                    ),
                    Visibility(
                      visible: isVisible,
                      child: IconButton(
                        onPressed: OnTwoPress,
                        icon: Icon(Icons.star,
                            color: (widget.controller.page == 1)
                                ? ColorShemeMine().GetUnderlineDark()
                                : ColorShemeMine().GetAkcent(),
                            size: iconSize),
                      ),
                    ),
                    Visibility(
                      visible: isVisible,
                      child: IconButton(
                        onPressed: OnThreePress,
                        icon: Icon(Icons.star,
                            color: (widget.controller.page == 2)
                                ? ColorShemeMine().GetUnderlineDark()
                                : ColorShemeMine().GetAkcent(),
                            size: iconSize),
                      ),
                    ),
                    Visibility(
                      visible: isVisible,
                      child: IconButton(
                        onPressed: OnFourPress,
                        icon: Icon(Icons.star,
                            color: (widget.controller.page == 3)
                                ? ColorShemeMine().GetUnderlineDark()
                                : ColorShemeMine().GetAkcent(),
                            size: iconSize),
                      ),
                    ),
                    Visibility(
                      visible: isVisible,
                      child: IconButton(
                        onPressed: OnFivePress,
                        icon: Icon(Icons.star,
                            color: (widget.controller.page == 4)
                                ? ColorShemeMine().GetUnderlineDark()
                                : ColorShemeMine().GetAkcent(),
                            size: iconSize),
                      ),
                    ),
                    Visibility(
                      visible: isVisible,
                      child: IconButton(
                        onPressed: OnSixPress,
                        icon: Icon(Icons.star,
                            color: (widget.controller.page == 5)
                                ? ColorShemeMine().GetUnderlineDark()
                                : ColorShemeMine().GetAkcent(),
                            size: iconSize),
                      ),
                    ),
                    Visibility(
                      visible: isVisible,
                      child: IconButton(
                        onPressed: OnSevenPress,
                        icon: Icon(Icons.star,
                            color: (widget.controller.page == 6)
                                ? ColorShemeMine().GetUnderlineDark()
                                : ColorShemeMine().GetAkcent(),
                            size: iconSize),
                      ),
                    ),
                    Visibility(
                      visible: isVisible,
                      child: IconButton(
                        onPressed: OnEithPress,
                        icon: Icon(Icons.star,
                            color: (widget.controller.page == 7)
                                ? ColorShemeMine().GetUnderlineDark()
                                : ColorShemeMine().GetAkcent(),
                            size: iconSize),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
