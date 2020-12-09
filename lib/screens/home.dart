import 'package:flutter/material.dart';

import '../settings/constants.dart';

import '../screens/day.dart';

import '../widgets/button_start.dart';
import '../widgets/tile_home.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height:
                      (screenSize.height - screenWidth * kSizeRatio) / 2 >= 0
                          ? (screenSize.height - screenWidth * kSizeRatio) / 2
                          : 0,
                ),
                CustomTileHome(
                  color: Colors.blue,
                ),
                ButtonStart(
                  color: Colors.blue,
                  navigator: DayScreen(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
