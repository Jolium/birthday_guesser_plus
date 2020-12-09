import 'package:flutter/material.dart';

import '../widgets/month_tile.dart';

import '../models/lists_creator_months.dart';

class MonthBoardTile extends StatelessWidget {
  Widget tileRowMonths(int value) {
    for (int index = 0; index < 4; index++) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MonthTile(month: (showMonths6[0 + value]).substring(1)),
          MonthTile(month: (showMonths6[1 + value]).substring(1)),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        tileRowMonths(0),
        tileRowMonths(2),
        tileRowMonths(4),
      ],
    );
  }
}
