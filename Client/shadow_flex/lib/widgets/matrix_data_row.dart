import 'package:flutter/material.dart';
import 'package:shadow_flex/functions/change_matrix.dart';
import 'package:shadow_flex/models/hero.dart';
import 'package:shadow_flex/widgets/underline_display_row.dart';

class MatrixDataRow extends StatefulWidget {
  final String name;
  final String mapKey;
  const MatrixDataRow({super.key, required this.mapKey, required this.name});

  @override
  State<MatrixDataRow> createState() => _MatrixDataRowState();
}

class _MatrixDataRowState extends State<MatrixDataRow> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ChangeMatrix(widget.mapKey, widget.name, context).then((value) {
          setState(() {});
        });
      },
      child: UnderlineDisplayRow(
          name: widget.name,
          value: HeroData().GetGeneralInfo(widget.mapKey),
          offset: 1),
    );
  }
}
