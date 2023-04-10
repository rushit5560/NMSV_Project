import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:get/get.dart';

import 'package:nmsv_project/controller/guruvani_player_screen_controller.dart';
import 'package:nmsv_project/model/guruvani_screen_model/guruvani_player_model.dart';

class GuruvaniAudioScreenController extends GetxController {
  List<Guruvani> guruvaniList = Get.arguments[0];
  int index = Get.arguments[1];
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
    await audioPlayer.play(guruvaniList[index].mediaUrl);

    setup();
    log("GuruvaniAudioScreenController mediaUrl play: ${guruvaniList[index].mediaUrl}");
    //loadUI();
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
      notificationShowModule();

      //  AwesomeNotifications().createNotification(content: NotificationContent(
      //     id: 1,
      //     channelKey: 'alerts',
      //     title: 'NMSV',
      //     body: guruvaniList[index].title,
      //   ));
    });
    audioPlayer.onPlayerStateChanged.listen((state) {
      playState.value = state;
    });
  }

  notificationShowModule() {
    AwesomeNotifications().createNotification(
        content: NotificationContent(
      id: 1,
      channelKey: 'alerts',
      title: 'NMSV',
      body: guruvaniList[index].title,
    ));
  }

  playMusic() {
    audioPlayer.play(guruvaniList[index].mediaUrl);
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
