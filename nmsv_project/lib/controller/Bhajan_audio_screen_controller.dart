import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:nmsv_project/constants/app_images.dart';

class BhajanAudioScreenController extends GetxController {
  RxBool isPlaying = false.obs;
  RxBool isLoading = false.obs;
  late  AudioPlayer player;
  late AudioCache cache;
  Rx<Duration> currentPosition = Duration().obs;
  Rx<Duration> musicLength = Duration().obs;
  final Rx<PlayerState> playState = PlayerState.STOPPED.obs;

  @override
  void onInit() {
    super.onInit();
    player = AudioPlayer();
    cache = AudioCache(fixedPlayer: player);
    cache.load(AppAudio.bhajanAudio);
    // cache.load("assets/audios/music.mp3");
    setup();
  }
  setup(){
    player.onAudioPositionChanged.listen((index) {
        currentPosition.value = index;
    });
    player.onDurationChanged.listen((index) {
        musicLength.value = index;
    });
    player.onPlayerStateChanged.listen((state) {
      playState.value = state;
    });
    // player.onPlayerCompletion
    //     .listen((event) => currentPosition.value = musicLength.value);
  }
  playMusic(){
    cache.play(AppAudio.bhajanAudio);
  }
  stopMusic(){
    player.pause();
  }
  seekTo(int seconds){
    player.seek(Duration(seconds: seconds));
  }
}
