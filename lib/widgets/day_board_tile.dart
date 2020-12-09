import 'package:flutter/material.dart';

import '../models/lists_creator_days.dart';
import '../widgets/day_tile.dart';

class DayBoardTile extends StatelessWidget {
  Widget tileRowDays(int value) {
    for (int index = 0; index < 4; index++) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DayTile(day: showDays16[0 + value]),
          DayTile(day: showDays16[1 + value]),
          DayTile(day: showDays16[2 + value]),
          DayTile(day: showDays16[3 + value]),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        tileRowDays(0),
        tileRowDays(4),
        tileRowDays(8),
        tileRowDays(12),
      ],
    );
  }
}
