import 'package:flutter/material.dart';

import '../settings/constants.dart';

class MonthTile extends StatelessWidget {
  MonthTile({@required this.month});

  final String month;

  @override
  Widget build(BuildContext context) {
    var screenSizeWidth = MediaQuery.of(context).size.width < kMaxSize
        ? MediaQuery.of(context).size.width
        : kMaxSize;

    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        width: screenSizeWidth / kSizeRatio / 2 - 6,
        height: screenSizeWidth / kSizeRatio / 3 - 5,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(2.0),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(5),
            topRight: Radius.circular(5),
            bottomLeft: Radius.circular(5),
            bottomRight: Radius.circular(30),
          ),
        ),
        child: Text(
          month,
          style: TextStyle(
            color: Colors.white,
            fontSize: screenSizeWidth / 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
