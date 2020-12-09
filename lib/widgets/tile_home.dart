import 'package:flutter/material.dart';

import '../settings/constants.dart';

class CustomTileHome extends StatelessWidget {
  CustomTileHome({
    @required this.color,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    var screenSizeWidth = MediaQuery.of(context).size.width < kMaxSize
        ? MediaQuery.of(context).size.width
        : kMaxSize;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: screenSizeWidth / kSizeRatio,
          margin: EdgeInsets.all(8.0),
          alignment: Alignment.center,
          padding: const EdgeInsets.all(2.0),
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
                  color: color,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30),
                    bottom: Radius.circular(5),
                  ),
                ),
                child: SizedBox(
                  height: screenSizeWidth / 7,
                  child: Text(
                    'Birthday Guesser',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenSizeWidth / 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  // width: screenSizeWidth / kScreenSizeRatio / 4 - 5,
                  height: screenSizeWidth / kSizeRatio - 8,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(24.0),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: Text(
                    kHomeText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenSizeWidth / 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          // child: TileBoardDays(),
        ),
      ],
    );
  }
}
