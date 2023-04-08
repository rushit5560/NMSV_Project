import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
          Text(bhajanAudioScreenController
              .bhajanList[bhajanAudioScreenController.index].bhajanFile
              .replaceAll(".mp3", "")),
          // Text(bhajanAudioScreenController.bhajanTitle.replaceAll(".mp3", "")),
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
                bhajanAudioScreenController.seekTo(value.toInt());
                // bhajanAudioScreenController.isLoading(true);

                // bhajanAudioScreenController.currentPosition.value ==
                //         bhajanAudioScreenController.musicLength.value
                //     ? log("11111")
                //     : log("222222");
                // bhajanAudioScreenController.isLoading(false);
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  '${bhajanAudioScreenController.currentPosition.value.inMinutes.remainder(60)}:${bhajanAudioScreenController.currentPosition.value.inSeconds.remainder(60)}'),
              Text(
                  '${bhajanAudioScreenController.musicLength.value.inMinutes.remainder(60)}:${bhajanAudioScreenController.musicLength.value.inSeconds.remainder(60)}'),
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
                    bhajanAudioScreenController.audioPlayer.stop();
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
