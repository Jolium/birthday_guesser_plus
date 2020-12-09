import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget portraitScreen;
  final Widget landscapeScreen;

  const ResponsiveWidget({
    Key key,
    @required this.portraitScreen,
    this.landscapeScreen,
  }) : super(key: key);

  static bool isLandscapeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width >
        MediaQuery.of(context).size.height;
  }

  static bool isPortraitScreen(BuildContext context) {
    return MediaQuery.of(context).size.width <
        MediaQuery.of(context).size.height;
  }

  @override
  Widget build(BuildContext context) {
    // Returns the widget which is more appropriate for the screen size
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < constraints.maxHeight) {
          return portraitScreen;
        } else {
          // if landscape screen not available, then return portrait screen
          return landscapeScreen ?? portraitScreen;
        }
      },
    );
  }
}
