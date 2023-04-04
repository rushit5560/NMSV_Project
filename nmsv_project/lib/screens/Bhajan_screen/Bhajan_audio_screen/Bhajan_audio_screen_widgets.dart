import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nmsv_project/constants/app_images.dart';
import 'package:nmsv_project/constants/extension.dart';
import 'package:sizer/sizer.dart';
import '../../../controller/bhajan_audio_screen_controller.dart';

class AudioModule extends StatefulWidget {
  const AudioModule({Key? key}) : super(key: key);

  @override
  State<AudioModule> createState() => _AudioModuleState();
}

class _AudioModuleState extends State<AudioModule> {
  final bhajanAudioScreenController = Get.find<BhajanAudioScreenController>();

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
              max: bhajanAudioScreenController.musicLength.value.inSeconds
                  .toDouble(),
              min: 0.0,
              activeColor: Colors.black,
              inactiveColor: Colors.grey,
              value: bhajanAudioScreenController.currentPosition.value.inSeconds
                  .toDouble(),
              // semanticFormatterCallback: (value) {
              //   bhajanAudioScreenController.currentPosition.value ==
              //       bhajanAudioScreenController.musicLength.value
              //       ? log("33333")
              //       : log("44444");
              //
              //   return "";
              // },

              // onChangeEnd: (value) {
              //   bhajanAudioScreenController.currentPosition.value ==
              //       bhajanAudioScreenController.musicLength.value
              //       ? log("33333")
              //       : log("44444");
              // },
              onChanged: (value) {

                Text("dgrge 111111");
                bhajanAudioScreenController.seekTo(value.toInt());
                bhajanAudioScreenController.isLoading(true);

                bhajanAudioScreenController.currentPosition.value ==
                        bhajanAudioScreenController.musicLength.value
                    ? log("11111")
                    : log("222222");
                bhajanAudioScreenController.isLoading(false);
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  '${bhajanAudioScreenController.currentPosition.value.inMinutes}:${bhajanAudioScreenController.currentPosition.value.inSeconds}'),
              Text(
                  '${bhajanAudioScreenController.musicLength.value.inMinutes}:${bhajanAudioScreenController.musicLength.value.inSeconds}'),
            ],
          ).commonSymmetricPadding(horizontal: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                child: const Icon(CupertinoIcons.backward_end_alt_fill),
                onTap: () {
                  if (bhajanAudioScreenController
                              .currentPosition.value.inSeconds ==
                          0 ||
                      bhajanAudioScreenController
                              .currentPosition.value.inSeconds <
                          10) {
                    bhajanAudioScreenController.seekTo(0);
                  } else if (bhajanAudioScreenController
                          .currentPosition.value.inSeconds >
                      10) {
                    bhajanAudioScreenController.seekTo(
                        bhajanAudioScreenController
                                .currentPosition.value.inSeconds -
                            10);
                  }
                },
              ),
              //const Spacer(),
              IconButton(
                icon: Icon(
                  bhajanAudioScreenController.isPlaying.value
                      ? Icons.pause_circle_outline
                      : Icons.play_circle_outline,
                ),
                iconSize: 50,
                color: Colors.black,
                onPressed: () {
                  // bhajanAudioScreenController.isLoading(true);
                  // log("bhajanAudioScreenController.isPlaying.value ${bhajanAudioScreenController.isPlaying.value}");
                  bhajanAudioScreenController.isPlaying.value =
                      !bhajanAudioScreenController.isPlaying.value;
                  // bhajanAudioScreenController.isLoading(false);

                  bhajanAudioScreenController.isPlaying.value
                      ? bhajanAudioScreenController.playMusic()
                      : bhajanAudioScreenController.stopMusic();
                },
              ),
              InkWell(
                child: const Icon(CupertinoIcons.forward_end_alt_fill),
                onTap: () {
                  if (bhajanAudioScreenController.currentPosition.value <
                      bhajanAudioScreenController.musicLength.value -
                          const Duration(seconds: 10)) {
                    bhajanAudioScreenController.seekTo(
                        bhajanAudioScreenController
                                .currentPosition.value.inSeconds +
                            10);
                  } else {
                    bhajanAudioScreenController.seekTo(
                        bhajanAudioScreenController
                            .musicLength.value.inSeconds);
                    bhajanAudioScreenController.isPlaying.value =
                        !bhajanAudioScreenController.isPlaying.value;
                    bhajanAudioScreenController.player.stop();
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
