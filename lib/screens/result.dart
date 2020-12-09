import 'package:flutter/material.dart';

import '../settings/constants.dart';

import '../models/lists_creator_months.dart';

import '../models/lists_creator_days.dart';
import '../models/custom_route.dart';
import '../widgets/tile_result.dart';

import '../screens/home.dart';

class ResultScreen extends StatefulWidget {
  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  void initState() {
    if (finalMonth == null || finalDay == 0) {
      // Navigator.of(context)
      //     .pushReplacement(SlideRoute(builder: (context) => HomeScreen()));
      Navigator.of(context).pushReplacementNamed(kHomeScreenRoute);
    }
    super.initState();
  }

  void _navigator(details) {
    if (details.delta.dx > 0) {
      // Right Swipe
      // print('=== right ===');
      Navigator.of(context).pop();
    } else if (details.delta.dx < 0) {
      // Left Swipe
      // print('=== left ===');

    }
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = MediaQuery.of(context).size.width < kMaxSize
        ? MediaQuery.of(context).size.width
        : kMaxSize;
    // var screenHeight = MediaQuery.of(context).size.height < kMaxSize
    //     ? MediaQuery.of(context).size.height
    //     : kMaxSize;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        toolbarHeight: kWeb ? 0 : 56,
        backgroundColor: Colors.black,
        title: Text(kAppName),
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        onHorizontalDragUpdate: _navigator,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: (screenSize.height - screenWidth * 1.05) / 2 >= 0
                        ? (screenSize.height - screenWidth * 1.05) / 2
                        : 0,
                  ),
                  TileResult(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
