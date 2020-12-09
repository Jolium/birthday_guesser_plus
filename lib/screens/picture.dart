import 'dart:async';
import 'package:flutter/material.dart';

import 'package:video_player/video_player.dart';

import '../settings/constants.dart';

import '../models/custom_route.dart';

import '../screens/result.dart';

class PictureScreen extends StatefulWidget {
  @override
  _PictureScreenState createState() => _PictureScreenState();
}

class _PictureScreenState extends State<PictureScreen> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('audio/scream.mp3')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        // setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    Timer(
      Duration(seconds: 3),
      () => Navigator.of(context).pushReplacementNamed(kResultScreenRoute),
      // Navigator.of(context)
      //     .pushReplacement(SlideRoute(builder: (context) => ResultScreen())),
    );

    _controller.play();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        toolbarHeight: kWeb ? 0 : 56,
        backgroundColor: Colors.black,
        title: Text(kAppName),
      ),
      body: SafeArea(
        child: Image.asset(
          'images/1.jpg',
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
      ),
    );
  }
}
