import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:url_launcher/url_launcher.dart';

import '../settings/constants.dart';

class SpinnerScreen extends StatefulWidget {
  @override
  _SpinnerScreenState createState() => _SpinnerScreenState();
}

class _SpinnerScreenState extends State<SpinnerScreen> {
  _launchURL() async {
    const url = kMathniacUrl;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    double _sizeRatio = 1.5;
    var _screenSize = MediaQuery.of(context).size;

    Timer(
      Duration(seconds: 5),
      () => kAnimation
          // ? Navigator.of(context)
          //     .pushReplacement(FadeRoute(builder: (context) => PictureScreen()))
          ? Navigator.of(context).pushReplacementNamed(kPictureScreenRoute)
          // : Navigator.of(context).pushReplacement(
          //     SlideRoute(builder: (context) => ResultScreen())),
          : Navigator.of(context).pushReplacementNamed(kResultScreenRoute),
    );
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        toolbarHeight: kWeb ? 0 : 56,
        backgroundColor: Colors.black,
        title: Text(kAppName),
      ),
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.scaleDown,
                      image: AssetImage('images/icon_mathniac.png'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                Text(
                  'Mathniac',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Courgette',
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: _screenSize.width > 600
                      ? 600
                      : _screenSize.width / _sizeRatio,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 4.0,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Text(
                    'Mathniac',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Courgette',
                    ),
                  ),
                ),
                Container(
                  width: _screenSize.width > 600
                      ? 600
                      : _screenSize.width / _sizeRatio,
                  height: _screenSize.height / _sizeRatio,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 4.0,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(
                        kImageUrl,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                InkWell(
                  onTap: _launchURL,
                  child: Container(
                    alignment: Alignment.center,
                    width: _screenSize.width / _sizeRatio,
                    child: Image.asset(
                      'images/google_play.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            SpinKitFadingCircle(
              itemBuilder: (BuildContext context, int index) {
                return DecoratedBox(
                  decoration: BoxDecoration(
                    color: index.isEven ? Colors.deepOrange : Colors.deepPurple,
                    shape: BoxShape.circle,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
