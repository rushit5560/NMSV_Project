import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';

import 'package:nmsv_project/controller/guruvani_player_screen_controller.dart';

class GuruvaniAudioScreenController extends GetxController {
  String guruvaniAudio = Get.arguments;
  final guruvaniPlayerScreenController = Get.find<GuruvaniPlayerScreenController>();

  RxBool isPlaying = false.obs;
  RxBool isLoading = false.obs;
  Rx<Duration> currentPosition = const Duration().obs;
  Rx<Duration> musicLength = const Duration().obs;
  AudioPlayer audioPlayer = AudioPlayer();

  final Rx<PlayerState> playState = PlayerState.STOPPED.obs;

  @override
  void onInit() async {
    super.onInit();

    await audioPlayer.play(guruvaniAudio);

    setup();
    log("GuruvaniAudioScreenController mediaUrl play: $guruvaniAudio");
  }

  setup() {
    audioPlayer.onAudioPositionChanged.listen((index) {
      currentPosition.value = index;
    });
    audioPlayer.onDurationChanged.listen((index) {
      musicLength.value = index;
    });
    audioPlayer.onPlayerStateChanged.listen((state) {
      playState.value = state;
    });
  }

  playMusic() {
    audioPlayer.play(guruvaniAudio);
  }

  stopMusic() {
    audioPlayer.pause();
  }

  seekTo(int seconds) {
    audioPlayer.seek(Duration(seconds: seconds));
  }
}
