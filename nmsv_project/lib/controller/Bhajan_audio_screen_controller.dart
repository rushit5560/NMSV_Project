import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:get/get.dart';
import 'package:nmsv_project/model/bhajan_screen_model/bhajan_player_list_model.dart';
// import 'package:nmsv_project/constants/app_images.dart';
// import 'package:nmsv_project/controller/bhajan_player_screen_controller.dart';

class BhajanAudioScreenController extends GetxController {
  List<Bhajan> bhajanList = Get.arguments[0];
  int index = Get.arguments[1];

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
    log('Init function index : $index');
    isLoading(true);
    await audioPlayer.play(bhajanList[index].mediaUrl);

    setup();
    log("bhajanPlayerScreenController mediaUrl play: ${bhajanList[index].mediaUrl}");
    // loadUI();
  }

  setup() {
    isLoading(true);
    audioPlayer.onAudioPositionChanged.listen((index) {
      currentPosition.value = index;
    });
    audioPlayer.onDurationChanged.listen((index) async {
      musicLength.value = index;
      isPlaying(true);
      isLoading(false);
      notificationShowModule();
    });
    audioPlayer.onPlayerStateChanged.listen((state) async {
      log('state : $state');
      playState.value = state;
      if (state == PlayerState.COMPLETED) {
        await changeSongWhenOldSongComplete();
      }
    });
  }

  notificationShowModule() {
    AwesomeNotifications().createNotification(
        content: NotificationContent(
      id: 1,
      channelKey: 'alerts',
      title: 'NMSV',
      body: bhajanList[index].bhajanName,
    ));
  }

  changeSongWhenOldSongComplete() async {
    index++;
    log('Setup function index : $index');
    await audioPlayer.play(bhajanList[index].mediaUrl);
  }

  playMusic() {
    audioPlayer.play(bhajanList[index].mediaUrl);
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
