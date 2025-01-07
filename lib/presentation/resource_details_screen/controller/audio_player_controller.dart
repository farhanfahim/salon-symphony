import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class AudioController extends GetxController {
  AudioPlayer audioPlayer = AudioPlayer();
  final String? audioUrl;
  Rx<Duration> duration = Duration().obs;
  Rx<Duration> position = Duration().obs;
  RxBool isPlaying = false.obs;
  RxBool isInitial = false.obs;
  Timer? timer;

  AudioController({this.audioUrl});

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    super.onInit();

    setInitAudioTimer();

    audioPlayer.onDurationChanged.listen((d) {
      duration.value = d;
      update();
    });

    audioPlayer.onPositionChanged.listen((p) {
      position.value = p;
      update();
    });

    audioPlayer.onPlayerComplete.listen((event) {
      // Handle completion (e.g., stop the timer)
      isPlaying.value = false;
      stopTimer();
      update();
    });
  }

  void setInitAudioTimer() async {
    print("setInitAudioTimer -- ---> $audioUrl");
    if (audioUrl != null) {
      print("setInitAudioTimer: $audioUrl");
      isInitial.value = true;
      await audioPlayer.play(UrlSource(audioUrl!));
      pauseAudio();

    }

    var value = await audioPlayer.getCurrentPosition();

    print("setInitAudioTimer2 --> $value");

    if (value != null) {
      position.value = value;
      update();
    }
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      audioPlayer.getCurrentPosition().then((value) {
        if (value != null) {
          position.value = value;
          update();
        }
      });
    });
  }

  void stopTimer() {
    timer?.cancel();
  }

  void playPauseAudio() {
    if (isPlaying.value) {
      pauseAudio();
    } else {
      playAudio();
    }
  }

  void playAudio() {
    audioPlayer.resume();
    isPlaying.value = true;
    startTimer();
  }

  void pauseAudio() {
    audioPlayer.pause();
    isPlaying.value = false;
    isInitial.value = false;
    stopTimer();
  }

  void seekAudio(Duration newPosition) {
    audioPlayer.seek(newPosition);
  }

  @override
  void onClose() {
    audioPlayer.stop();
    stopTimer();
    super.onClose();
  }
}
