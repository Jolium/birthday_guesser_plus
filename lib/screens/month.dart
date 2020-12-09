import 'package:flutter/material.dart';

import '../screens/spinner.dart';

import '../settings/constants.dart';

import '../models/custom_route.dart';
import '../models/lists_creator_months.dart';

import '../widgets/month_board.dart';
import '../widgets/button_yes_no.dart';

class MonthScreen extends StatefulWidget {
  MonthScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MonthScreenState createState() => _MonthScreenState();
}

class _MonthScreenState extends State<MonthScreen> {
  int _counter = 0;

  @override
  void initState() {
    CreateMonthsLists().createShowMonths6();
    finalMonth = null;
    super.initState();
  }

  void _onPressed(bool value) {
    setState(() {
      _counter == 0
          ? CreateMonthsLists().createValidMonths(value)
          : CreateMonthsLists().updateValidMonths(value);
    });
    _counter++;

    if (finalMonth != null) {
      print('----------------------------');
      print('        Month: ${finalMonth.substring(1)}');
      print('----------------------------\n');
      // Navigator.of(context).pushReplacement(
      //   FadeRoute(
      //     builder: (context) => SpinnerScreen(),
      //   ),
      // );
      Navigator.of(context).pushReplacementNamed(kSpinnerScreenRoute);
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height:
                        (screenSize.height - screenWidth * kSizeRatio) / 2 >= 0
                            ? (screenSize.height - screenWidth * kSizeRatio) / 2
                            : 0,
                  ),
                  MonthBoard(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: screenWidth / kSizeRatio + 16,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ButtonYesNo(
                              color: Colors.deepOrange,
                              text: 'YES',
                              onPressed: () {
                                _onPressed(true);
                              },
                            ),
                            ButtonYesNo(
                              color: Colors.deepOrange,
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
