import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';

import 'package:nmsv_project/controller/guruvani_player_screen_controller.dart';

class GuruvaniAudioScreenController extends GetxController {
  String guruvaniTitle = Get.arguments[0];
  String guruvaniAudio = Get.arguments[1];
  final guruvaniPlayerScreenController =
      Get.find<GuruvaniPlayerScreenController>();

  RxBool isPlaying = false.obs;
  RxBool isLoading = false.obs;
  Rx<Duration> currentPosition = const Duration().obs;
  Rx<Duration> musicLength = const Duration().obs;
  AudioPlayer audioPlayer = AudioPlayer();

  final Rx<PlayerState> playState = PlayerState.STOPPED.obs;

  @override
  void onInit() async {
    super.onInit();
    isLoading(true);
    log('isLoading : $isLoading');
    await audioPlayer.play(
      guruvaniAudio,
    );

    setup();
    log("GuruvaniAudioScreenController mediaUrl play: $guruvaniAudio");
    // loadUI();
  }

  setup() {
    audioPlayer.onAudioPositionChanged.listen((index) {
      currentPosition.value = index;
      log('currentPosition : ${currentPosition.value}');
    });
    audioPlayer.onDurationChanged.listen((index) {
      musicLength.value = index;
      log('musicLength : ${musicLength.value}');
      isPlaying(true);
      isLoading(false);
    });
    audioPlayer.onPlayerStateChanged.listen((state) {
      playState.value = state;
      log('playState : ${playState.value}');
    });

    // isLoading(false);
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

  loadUI() {
    isLoading(true);
    isLoading(false);
  }
}
