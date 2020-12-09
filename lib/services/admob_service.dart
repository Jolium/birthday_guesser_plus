import 'dart:io';

import 'package:birthday_guesser_plus/settings/constants.dart';
import 'package:firebase_admob/firebase_admob.dart';

class AdMobService {
  String getAdMobAppId() {
    if (Platform.isIOS) {
      return 'ca-app-pub-4259634083772880~8976810502'; // mine
    } else if (Platform.isAndroid) {
      return 'ca-app-pub-4259634083772880~2457344046'; // mine
    }
    return null;
  }

  String getBannerAdId() {
    if (Platform.isIOS) {
      return 'ca-app-pub-2334510780816542/6833456062';
    } else if (Platform.isAndroid) {
      // return 'ca-app-pub-3940256099942544/6300978111';
      return "ca-app-pub-4259634083772880/3634678436"; // mine
    }
    return null;
  }

  String getInterstitialAdId() {
    if (Platform.isIOS) {
      // return '';
      return 'ca-app-pub-3940256099942544/4411468910';
    } else if (Platform.isAndroid) {
//      return '';
      return "ca-app-pub-4259634083772880/8831180705"; // mine
    }
    return null;
  }

  static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    keywords: <String>['flutterio', 'beautiful apps'],
    contentUrl: 'https://flutter.io',
    childDirected: false,
    testDevices: <String>[
      kTestDevice
    ], // Android emulators are considered test devices
  );

  BannerAd myBanner = BannerAd(
    adUnitId: BannerAd.testAdUnitId,
    size: AdSize.smartBanner,
    targetingInfo: targetingInfo,
    listener: (MobileAdEvent event) {
      print("BannerAd event is $event");
    },
  );

  InterstitialAd myInterstitialAd = InterstitialAd(
    adUnitId: InterstitialAd.testAdUnitId,
    targetingInfo: targetingInfo,
    listener: (MobileAdEvent event) {
      print("InterstitialAd event is $event");
    },
  );

  // String getRewardedAdId() {
  //   if (Platform.isIOS) {
  //     return "ca-app-pub-4259634083772880/4905703552"; // mine
  //   } else if (Platform.isAndroid) {
  //     return "ca-app-pub-4259634083772880/3212405984"; // mine
  //   }
  //   return null;
  // }

  // InterstitialAd getNewTripInterstitial() {
  //   return InterstitialAd(
  //     adUnitId: getInterstitialAdId(),
  //     listener: (MobileAdEvent event) {
  //       print("InterstitialAd event is $event");
  //     },
  //   );
  // }
  //
  // static BannerAd _homeBannerAd;
  //
  // BannerAd _getHomePageBannerAd() {
  //   return BannerAd(adUnitId: getBannerAdId(), size: AdSize.smartBanner);
  // }
  //
  // void showHomeBannerAd() {
  //   if (_homeBannerAd == null) _homeBannerAd = _getHomePageBannerAd();
  //   _homeBannerAd
  //     ..load()
  //     ..show(anchorType: AnchorType.bottom);
  // }
//
// static void hideHomeBannerAd() async {
//   await _homeBannerAd.dispose();
//   _homeBannerAd = null;
// }
}
