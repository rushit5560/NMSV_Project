import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nmsv_project/constants/extension.dart';
import 'package:nmsv_project/controller/guruvani_audio_screen_controller.dart';
import 'package:sizer/sizer.dart';

class GuruvaniAudioModule extends StatelessWidget {
  GuruvaniAudioModule({Key? key}) : super(key: key);

  final guruvaniAudioScreenController =
      Get.find<GuruvaniAudioScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.music_note_outlined,
            size: 200,
          ),
          SizedBox(height: 2.h),
          Text(guruvaniAudioScreenController
              .guruvaniList[guruvaniAudioScreenController.index].guruvaniFile
              .replaceAll(".mp3", "")),
          SliderTheme(
            data: const SliderThemeData(
              trackHeight: 1,
            ),
            child: Slider(
              max: guruvaniAudioScreenController.musicLength.value.inSeconds
                  .toDouble(),
              min: 0.0,
              activeColor: Colors.black,
              inactiveColor: Colors.grey,
              value: guruvaniAudioScreenController
                  .currentPosition.value.inSeconds
                  .toDouble(),
              // semanticFormatterCallback: (value) {
              //   guruvaniAudioScreenController.currentPosition.value ==
              //       guruvaniAudioScreenController.musicLength.value
              //       ? log("33333")
              //       : log("44444");
              //
              //   return "";
              // },

              // onChangeEnd: (value) {
              //   guruvaniAudioScreenController.currentPosition.value ==
              //       guruvaniAudioScreenController.musicLength.value
              //       ? log("33333")
              //       : log("44444");
              // },
              onChanged: (value) {
                guruvaniAudioScreenController.seekTo(value.toInt());
                // guruvaniAudioScreenController.isLoading(true);

                // guruvaniAudioScreenController.currentPosition.value ==
                //         guruvaniAudioScreenController.musicLength.value
                //     ? log("11111")
                //     : log("222222");
                // guruvaniAudioScreenController.isLoading(false);
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  '${guruvaniAudioScreenController.currentPosition.value.inMinutes.remainder(60)}:${guruvaniAudioScreenController.currentPosition.value.inSeconds.remainder(60)}'),
              Text(
                  '${guruvaniAudioScreenController.musicLength.value.inMinutes.remainder(60)}:${guruvaniAudioScreenController.musicLength.value.inSeconds.remainder(60)}'),
            ],
          ).commonSymmetricPadding(horizontal: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                child: const Icon(CupertinoIcons.backward_end_fill),
                onTap: () {
                  guruvaniAudioScreenController.isLoading(true);
                  guruvaniAudioScreenController.previousAudio();
                  guruvaniAudioScreenController.isLoading(false);
                  // if (guruvaniAudioScreenController
                  //             .currentPosition.value.inSeconds ==
                  //         0 ||
                  //     guruvaniAudioScreenController
                  //             .currentPosition.value.inSeconds <
                  //         10) {
                  //   guruvaniAudioScreenController.seekTo(0);
                  // } else if (guruvaniAudioScreenController
                  //         .currentPosition.value.inSeconds >
                  //     10) {
                  //   guruvaniAudioScreenController.seekTo(
                  //       guruvaniAudioScreenController
                  //               .currentPosition.value.inSeconds -
                  //           10);
                  // }
                },
              ),
              //const Spacer(),
              IconButton(
                icon: Icon(
                  guruvaniAudioScreenController.isPlaying.value
                      ? Icons.pause_circle_outline
                      : Icons.play_circle_outline,
                ),
                iconSize: 50,
                color: Colors.black,
                onPressed: () {
                  // guruvaniAudioScreenController.isLoading(true);
                  // log("guruvaniAudioScreenController.isPlaying.value ${guruvaniAudioScreenController.isPlaying.value}");
                  guruvaniAudioScreenController.isPlaying.value =
                      !guruvaniAudioScreenController.isPlaying.value;
                  // guruvaniAudioScreenController.isLoading(false);

                  guruvaniAudioScreenController.isPlaying.value
                      ? guruvaniAudioScreenController.playMusic()
                      : guruvaniAudioScreenController.stopMusic();
                },
              ),
              InkWell(
                child: const Icon(CupertinoIcons.forward_end_fill),
                onTap: () {
                  guruvaniAudioScreenController.isLoading(true);
                  guruvaniAudioScreenController.nextAudio();
                  guruvaniAudioScreenController.isLoading(false);
                  // if (guruvaniAudioScreenController
                  // if (guruvaniAudioScreenController.currentPosition.value <
                  //     guruvaniAudioScreenController.musicLength.value -
                  //         const Duration(seconds: 10)) {
                  //   guruvaniAudioScreenController.seekTo(
                  //       guruvaniAudioScreenController
                  //               .currentPosition.value.inSeconds +
                  //           10);
                  // } else {
                  //   guruvaniAudioScreenController.seekTo(
                  //       guruvaniAudioScreenController
                  //           .musicLength.value.inSeconds);
                  //   guruvaniAudioScreenController.isPlaying.value =
                  //       !guruvaniAudioScreenController.isPlaying.value;
                  //   guruvaniAudioScreenController.audioPlayer.stop();
                  // }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
