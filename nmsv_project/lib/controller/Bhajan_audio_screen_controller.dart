import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:nmsv_project/constants/app_images.dart';

class BhajanAudioScreenController extends GetxController{
   AnimationController? iconController;
  AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();
  bool isAnimated = false;
  bool showPlay = true;
  bool shopPause = false;
  void getAudioPlayer() {
    //iconController = AnimationController(vsync: this,duration: const Duration(microseconds: 1000));
    audioPlayer.open(Audio(AppAudio.bhajanAudio),autoStart: false,showNotification: true);
  }
  // void animateIcon() {
  //     isAnimated = !isAnimated;
  //     if(isAnimated)
  //     {
  //       iconController?.forward();
  //       audioPlayer.play();
  //     }else{
  //       iconController?.reverse();
  //       audioPlayer.pause();
  //     }
  // }
}