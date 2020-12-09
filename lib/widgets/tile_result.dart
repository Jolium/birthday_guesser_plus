import 'package:birthday_guesser_plus/settings/data.dart';
import 'package:flutter/material.dart';

import '../settings/constants.dart';

import '../models/lists_creator_days.dart';
import '../models/lists_creator_months.dart';

class TileResult extends StatelessWidget {
  final String month = finalMonth.substring(1);
  final int day = finalDay;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenSizeWidth = MediaQuery.of(context).size.width < kMaxSize
        ? MediaQuery.of(context).size.width
        : kMaxSize;

    bool _validation() {
      if (kSpecialsMonths.contains(month) && day > 30 ||
          month == 'February' && day > 29) {
        return true;
      } else {
        return false;
      }
    }

    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          width: screenSizeWidth / kSizeRatio,
          margin: EdgeInsets.all(8.0),
          alignment: Alignment.center,
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              bottomLeft: Radius.circular(5),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(2.0),
                alignment: Alignment.center,
                padding: const EdgeInsets.only(top: 8.0),
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30),
                    bottom: Radius.circular(5),
                  ),
                ),
                child: SizedBox(
                  height: screenSizeWidth / 7,
                  child: Text(
                    month,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenSizeWidth / 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  height: screenSizeWidth / kSizeRatio,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: Text(
                    day.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenSizeWidth / 2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        if (_validation())
          RotationTransition(
            turns: AlwaysStoppedAnimation(-25 / 360),
            child: Container(
              alignment: Alignment.center,
              width:
                  screenSize.width > 600 ? 600 : screenSize.width / kSizeRatio,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xFFFF0000),
                  width: 8.0,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: FittedBox(
                child: Text(
                  ' NOT POSSIBLE ',
                  style: TextStyle(
                    color: const Color(0xFFFF0000),
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
