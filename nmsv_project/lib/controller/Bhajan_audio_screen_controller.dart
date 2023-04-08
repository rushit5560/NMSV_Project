import 'dart:async';
import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/web/audioplayers_web.dart';
import 'package:get/get.dart';
// import 'package:just_audio/just_audio.dart';
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

    await audioPlayer.play(bhajanAudio);

    setup();
    log("bhajanPlayerScreenController mediaUrl play: $bhajanAudio");
    loadUI();
  }

  setup() {
    isLoading(true);
    audioPlayer.onAudioPositionChanged.listen((index) {
      currentPosition.value = index;
    });
    audioPlayer.onDurationChanged.listen((index) {
      musicLength.value = index;
    });
    audioPlayer.onPlayerStateChanged.listen((state) {
      playState.value = state;
    });
    isPlaying(true);
    isLoading(false);
  }

  playMusic() {
//     AudioSource.uri(
//   Uri.parse('https://example.com/song1.mp3'),
//   tag: MediaItem(
//     // Specify a unique ID for each media item:
//     id: '1',
//     // Metadata to display in the notification:
//     album: "Album name",
//     title: "Song name",
//     artUri: Uri.parse('https://example.com/albumart.jpg'),
//   ),
// ),
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
