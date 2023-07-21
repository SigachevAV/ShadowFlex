import 'package:flutter/material.dart';
import 'package:shadow_flex/widgets/hex_button.dart';

class HexRow extends StatefulWidget {
  final int lenght;
  const HexRow({super.key, required this.lenght});

  @override
  State<HexRow> createState() => _HexRowState();
}

class _HexRowState extends State<HexRow> {
  Widget builder(BuildContext context) {
    List<Widget> result = List.empty(growable: true);

    for (var i = 0; i < widget.lenght; i++) {
      result.add(HexButton());
    }
    return Container(
      margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
      child: GridView.count(
        primary: false,
        shrinkWrap: true,
        crossAxisCount: (widget.lenght <= 7) ? 7 : 6,
        children: result,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: builder);
  }
}
