import 'package:flutter/material.dart';

import '../settings/constants.dart';

import '../widgets/day_board_tile.dart';

class DayBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSizeWidth = MediaQuery.of(context).size.width < kMaxSize
        ? MediaQuery.of(context).size.width
        : kMaxSize;

    return Container(
      width: screenSizeWidth / kSizeRatio,
      margin: const EdgeInsets.all(8.0),
      alignment: Alignment.center,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
          bottomLeft: Radius.circular(5),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(2.0),
            alignment: Alignment.center,
            padding: const EdgeInsets.only(top: 8.0),
            decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(30),
                bottom: Radius.circular(5),
              ),
            ),
            child: SizedBox(
              height: screenSizeWidth / 7,
              child: Text(
                'Day',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenSizeWidth / 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          DayBoardTile(),
        ],
      ),
    );
  }
}
