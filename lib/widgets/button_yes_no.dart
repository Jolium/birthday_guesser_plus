import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../settings/constants.dart';

import '../models/audioplayer_model.dart';

class ButtonYesNo extends StatefulWidget {
  ButtonYesNo({
    @required this.text,
    @required this.onPressed,
    // @required this.navigator,
    @required this.color,
  });

  final String text;
  final void Function() onPressed;
  final Color color;
  // final Widget navigator;

  @override
  _ButtonYesNoState createState() => _ButtonYesNoState();
}

class _ButtonYesNoState extends State<ButtonYesNo> {
  double _sizedBox = 1;

  void _onTapDown(TapDownDetails details) {
    if (!kIsWeb) {
      AudioPlayer().soundPlayer('pressed_button.mp3');
    }
    widget.onPressed();

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
        width: screenSizeWidth / kSizeRatio / 3 * _sizedBox,
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
          widget.text,
          style: TextStyle(
            color: Colors.white,
            fontSize: screenSizeWidth / 14,
            fontWeight: FontWeight.bold,
            shadows: [
              BoxShadow(
                color: Colors.black.withOpacity(0.6),
                spreadRadius: 8,
                blurRadius: 4,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
        ),
      ),
    );
  }
}
