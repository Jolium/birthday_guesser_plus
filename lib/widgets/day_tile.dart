import 'package:flutter/material.dart';

import '../settings/constants.dart';

class DayTile extends StatefulWidget {
  DayTile({@required this.day});

  final int day;

  @override
  _DayTileState createState() => _DayTileState();
}

class _DayTileState extends State<DayTile> {
  @override
  Widget build(BuildContext context) {
    var screenSizeWidth = MediaQuery.of(context).size.width < kMaxSize
        ? MediaQuery.of(context).size.width
        : kMaxSize;

    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        width: screenSizeWidth / kSizeRatio / 4 - 5,
        height: screenSizeWidth / kSizeRatio / 4 - 5,
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
          widget.day.toString(),
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
