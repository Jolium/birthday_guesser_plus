import 'package:flutter/material.dart';

import '../settings/constants.dart';

import '../screens/month.dart';

import '../models/custom_route.dart';
import '../models/lists_creator_days.dart';

import '../widgets/button_yes_no.dart';
import '../widgets/day_board.dart';

class DayScreen extends StatefulWidget {
  @override
  _DayScreenState createState() => _DayScreenState();
}

class _DayScreenState extends State<DayScreen> {
  int _counter = 0;

  @override
  void initState() {
    CreateDaysLists().createShowDays16();
    finalDay = 0;
    super.initState();
  }

  void _onPressed(bool value) {
    setState(() {
      _counter == 0
          ? CreateDaysLists().createValidDays(value)
          : CreateDaysLists().updateValidDays(value);
    });
    _counter++;
    // });
    if (finalDay > 0) {
      print('----------------------------');
      print('          Day: $finalDay');
      print('----------------------------\n');
      // Navigator.of(context).pushReplacement(
      //   SlideRoute(
      //     builder: (context) => MonthScreen(),
      //   ),
      // );
      Navigator.of(context).pushReplacementNamed(kMonthScreenRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = MediaQuery.of(context).size.width < kMaxSize
        ? MediaQuery.of(context).size.width
        : kMaxSize;

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
            child: Container(
              width: screenWidth / kSizeRatio + 16,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height:
                        (screenSize.height - screenWidth * kSizeRatio) / 2 >= 0
                            ? (screenSize.height - screenWidth * kSizeRatio) / 2
                            : 0,
                  ),
                  DayBoard(),
                  Row(
                    children: [
                      Container(
                        width: screenWidth / kSizeRatio + 16,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ButtonYesNo(
                              color: Colors.deepPurple,
                              text: 'YES',
                              onPressed: () {
                                _onPressed(true);
                              },
                            ),
                            ButtonYesNo(
                              color: Colors.deepPurple,
                              text: 'NO',
                              onPressed: () {
                                _onPressed(false);
                              },
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
