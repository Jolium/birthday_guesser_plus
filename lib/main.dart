import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'dart:io';

// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_admob/firebase_admob.dart';
// import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:custom_splash/custom_splash.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:hive/hive.dart';

import 'settings/constants.dart';

import 'models/screens_router.dart';

import 'screens/home.dart';

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // Directory document = await getApplicationDocumentsDirectory();
  // Hive.init(document.path);
  // await Hive.openBox<String>(kBoxName);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Hide bottom bar and top bar
    SystemChrome.setEnabledSystemUIOverlays([]);

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return kSplashScreen
        ? MaterialApp(
            color: Colors.black,
            title: kAppName,
            debugShowCheckedModeBanner: false,
            home: CustomSplash(
              imagePath: 'images/launch_image.png',
              backGroundColor: Colors.black,
              animationEffect: 'zoom-in',
              // logoSize: 200.0,
              home: HomeScreen(),
              duration: 1600,
              type: CustomSplashType.StaticDuration,
            ),
          )
        : MaterialApp(
            color: Colors.black,
            title: kAppName,
            debugShowCheckedModeBanner: false,
            initialRoute: kHomeScreenRoute,
            onGenerateRoute: ScreensRouter.onGenerateRoute,
          );
  }
}
