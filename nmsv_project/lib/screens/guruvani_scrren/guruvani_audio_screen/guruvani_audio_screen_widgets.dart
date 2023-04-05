import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nmsv_project/constants/extension.dart';
import 'package:nmsv_project/controller/guruvani_audio_screen_controller.dart';
import 'package:sizer/sizer.dart';

class GuruvaniAudioModule extends StatefulWidget {
  const GuruvaniAudioModule({Key? key}) : super(key: key);

  @override
  State<GuruvaniAudioModule> createState() => _AudioModuleState();
}

class _AudioModuleState extends State<GuruvaniAudioModule> {
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
          const Text('Jab Yaad Tumhaari Aai 01'),
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
                  '${guruvaniAudioScreenController.currentPosition.value.inMinutes}:${guruvaniAudioScreenController.currentPosition.value.inSeconds}'),
              Text(
                  '${guruvaniAudioScreenController.musicLength.value.inMinutes}:${guruvaniAudioScreenController.musicLength.value.inSeconds}'),
            ],
          ).commonSymmetricPadding(horizontal: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                child: const Icon(CupertinoIcons.backward_end_alt_fill),
                onTap: () {
                  if (guruvaniAudioScreenController
                              .currentPosition.value.inSeconds ==
                          0 ||
                      guruvaniAudioScreenController
                              .currentPosition.value.inSeconds <
                          10) {
                    guruvaniAudioScreenController.seekTo(0);
                  } else if (guruvaniAudioScreenController
                          .currentPosition.value.inSeconds >
                      10) {
                    guruvaniAudioScreenController.seekTo(
                        guruvaniAudioScreenController
                                .currentPosition.value.inSeconds -
                            10);
                  }
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
                child: const Icon(CupertinoIcons.forward_end_alt_fill),
                onTap: () {
                  if (guruvaniAudioScreenController.currentPosition.value <
                      guruvaniAudioScreenController.musicLength.value -
                          const Duration(seconds: 10)) {
                    guruvaniAudioScreenController.seekTo(
                        guruvaniAudioScreenController
                                .currentPosition.value.inSeconds +
                            10);
                  } else {
                    guruvaniAudioScreenController.seekTo(
                        guruvaniAudioScreenController
                            .musicLength.value.inSeconds);
                    guruvaniAudioScreenController.isPlaying.value =
                        !guruvaniAudioScreenController.isPlaying.value;
                    guruvaniAudioScreenController.audioPlayer.stop();
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
