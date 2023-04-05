import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:nmsv_project/constants/app_images.dart';
import 'package:nmsv_project/controller/bhajan_player_screen_controller.dart';

class BhajanAudioScreenController extends GetxController {
  String bhajanAudio = Get.arguments;
  final bhajanPlayerScreenController = Get.find<BhajanPlayerScreenController>();

  RxBool isPlaying = false.obs;
  RxBool isLoading = false.obs;
  Rx<Duration> currentPosition = const Duration().obs;
  Rx<Duration> musicLength = const Duration().obs;
  AudioPlayer audioPlayer = AudioPlayer();

  final Rx<PlayerState> playState = PlayerState.STOPPED.obs;

  @override
  void onInit() async {
    super.onInit();

    await audioPlayer.play(bhajanAudio);

    setup();
    log("bhajanPlayerScreenController mediaUrl play: $bhajanAudio");
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
    audioPlayer.play(bhajanAudio);
  }

  stopMusic() {
    audioPlayer.pause();
  }

  seekTo(int seconds) {
    audioPlayer.seek(Duration(seconds: seconds));
  }
}
