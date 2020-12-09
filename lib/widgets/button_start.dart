import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../models/custom_route.dart';
import '../models/audioplayer_model.dart';
import '../models/screens_router.dart';

import '../settings/constants.dart';

class ButtonStart extends StatefulWidget {
  ButtonStart({
    @required this.color,
    @required this.navigator,
  });

  final Widget navigator;
  final Color color;

  @override
  _ButtonStartState createState() => _ButtonStartState();
}

class _ButtonStartState extends State<ButtonStart> {
  double _sizedBox = 1;

  void _onTapDown(TapDownDetails details) {
    if (!kIsWeb) {
      AudioPlayer().soundPlayer('pressed_button.mp3');
    }
    setState(() {
      // decreases the button size
      _sizedBox = 0.9;
    });
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      // increases the button size
      _sizedBox = 1;
    });

    if (widget.navigator != null) {
      // Navigator.of(context)
      //     .push(SlideRoute(builder: (context) => widget.navigator));
      Navigator.of(context).pushNamed(kDayScreenRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenSizeWidth = MediaQuery.of(context).size.width < kMaxSize
        ? MediaQuery.of(context).size.width
        : kMaxSize;

    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      child: Container(
        margin: const EdgeInsets.only(
          left: 8.0,
          right: 8.0,
          bottom: 8.0,
        ),
        alignment: Alignment.center,
        width: screenSizeWidth / kSizeRatio * _sizedBox,
        height: screenSizeWidth / 6 * _sizedBox,
        padding: const EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(5),
            topRight: Radius.circular(5),
            bottomLeft: Radius.circular(5),
            bottomRight: Radius.circular(30),
          ),
          border: Border.all(
            width: 4.0,
            color: Colors.white,
          ),
        ),
        child: Text(
          'START',
          style: TextStyle(
            color: Colors.white,
            fontSize: screenSizeWidth / 14,
            fontWeight: FontWeight.bold,
            shadows: [
              BoxShadow(
                color: Colors.black.withOpacity(0.6),
                spreadRadius: 8,
                blurRadius: 4,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
        ),
      ),
    );
  }
}
