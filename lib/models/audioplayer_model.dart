import 'package:flutter/foundation.dart';
import 'dart:io';

import 'package:audioplayers/audio_cache.dart';

import '../settings/vars.dart';

class AudioPlayer {
  AudioCache _audioCache = AudioCache(prefix: 'sounds/', respectSilence: true);

  void checkPlatform() {
    if (kIsWeb) {
      // Calls to Platform.isIOS fails on web
      return;
    }
    if (Platform.isIOS) {
      if (_audioCache.fixedPlayer != null) {
        _audioCache.fixedPlayer.startHeadlessService();
      }
    }
  }

  void soundPlayer(String sound) {
    /// Sound Player ///
    if (vPlaySound || !kIsWeb) {
      _audioCache.play(sound);
    }
  }
}
