import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'package:nmsv_project/controller/guruvani_player_screen_controller.dart';
import 'package:nmsv_project/model/guruvani_screen_model/guruvani_player_model.dart';

class GuruvaniAudioScreenController extends GetxController {
  List<Guruvani> guruvaniList = Get.arguments[0];
  int index = Get.arguments[1];
  RxBool onProgressing = false.obs;
  RxString guruvaniName = "".obs;
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
    guruvaniName.value = guruvaniList[index].title.toString();
    await audioPlayer.play(guruvaniList[index].mediaUrl);
    log("bhajan name $guruvaniName");
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
    audioPlayer.onPlayerStateChanged.listen((state) async {
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
      body: guruvaniList[index].title,
    ));
  }

  changeSongWhenOldSongComplete() async {
    if (index == guruvaniList.length - 1) {
      log('No Operation Perform');
    } else {
      index++;
      log('Setup function index : $index');
      await audioPlayer.play(guruvaniList[index].mediaUrl);
    }
  }

  nextAudio() async {
    if (index == guruvaniList.length - 1) {
      log('No Operation Perform');
      Fluttertoast.showToast(msg: "You are on last song!");
    } else {
      index++;
      log('Setup function index : $index');
      await audioPlayer.play(guruvaniList[index].mediaUrl);
      changeShowFileName(); /// Change Playing Audio Name
      loadUI();
    }
  }

  previousAudio() async {
    if (index != 0) {
      index--;
      log('Setup function index : $index');
      await audioPlayer.play(guruvaniList[index].mediaUrl);
      changeShowFileName(); /// Change Playing Audio Name
      loadUI();
    } else {
      log('No Operation Perform');
      Fluttertoast.showToast(msg: "You are on first song!");
    }
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

  /// Change Playing File Name When change the song
  changeShowFileName() {
    guruvaniName.value = guruvaniList[index].title.toString();
  }

  @override
  void dispose() {
    log("dispose guruvani");
    audioPlayer.dispose();
    super.dispose();
  }
}
