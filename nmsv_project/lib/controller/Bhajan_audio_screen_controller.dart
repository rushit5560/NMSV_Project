import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:get/get.dart';
// import 'package:nmsv_project/constants/app_images.dart';
// import 'package:nmsv_project/controller/bhajan_player_screen_controller.dart';

class BhajanAudioScreenController extends GetxController {
  String bhajanTitle = Get.arguments[0];
  String bhajanAudio = Get.arguments[1];

  // final bhajanPlayerScreenController = Get.find<BhajanPlayerScreenController>();

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
    await audioPlayer.play(bhajanAudio);

    setup();
    log("bhajanPlayerScreenController mediaUrl play: $bhajanAudio");
    // loadUI();
  }

  setup() {
    isLoading(true);
    audioPlayer.onAudioPositionChanged.listen((index) {
      currentPosition.value = index;
    });
    audioPlayer.onDurationChanged.listen((index) {
      musicLength.value = index;
      isPlaying(true);
      isLoading(false);
       AwesomeNotifications().createNotification(content: NotificationContent(
          id: 1,
          channelKey: 'alerts',
          title: 'NMSV',
          body: bhajanTitle,
        ));
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

  loadUI() {
    isLoading(true);
    isLoading(false);
  }
}
