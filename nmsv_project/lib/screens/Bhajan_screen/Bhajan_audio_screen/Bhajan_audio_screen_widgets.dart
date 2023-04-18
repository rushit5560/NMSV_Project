import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:get/get.dart';
import 'package:nmsv_project/common_modules/custom_submit_button.dart';
import 'package:nmsv_project/constants/color.dart';
import 'package:nmsv_project/constants/extension.dart';
import 'package:sizer/sizer.dart';
import '../../../controller/bhajan_audio_screen_controller.dart';
import '../Bhajan_player_screen/Bhajan_player_screen_widgets.dart';

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
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: [
             
          //   ],
          // ).commonOnlyPadding(right: 15),
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
              onChanged: (value) {
                bhajanAudioScreenController.seekTo(value.toInt());
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
                child: const Icon(CupertinoIcons.backward_end_fill),
                onTap: () {
                  bhajanAudioScreenController.isLoading(true);
                  bhajanAudioScreenController.previousAudio();
                  bhajanAudioScreenController.isLoading(false);
                  // if (bhajanAudioScreenController
                  //             .currentPosition.value.inSeconds ==
                  //         0 ||
                  //     bhajanAudioScreenController
                  //             .currentPosition.value.inSeconds <
                  //         10) {
                  //   bhajanAudioScreenController.seekTo(0);
                  // } else if (bhajanAudioScreenController
                  //         .currentPosition.value.inSeconds >
                  //     10) {
                  //   bhajanAudioScreenController.seekTo(
                  //       bhajanAudioScreenController
                  //               .currentPosition.value.inSeconds -
                  //           10);
                  // }
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
                child: const Icon(CupertinoIcons.forward_end_fill),
                onTap: () {
                  bhajanAudioScreenController.isLoading(true);
                  bhajanAudioScreenController.nextAudio();
                  bhajanAudioScreenController.isLoading(false);

                  // if (bhajanAudioScreenController.currentPosition.value <
                  //     bhajanAudioScreenController.musicLength.value -
                  //         const Duration(seconds: 10)) {
                  //   bhajanAudioScreenController.seekTo(
                  //       bhajanAudioScreenController
                  //               .currentPosition.value.inSeconds +
                  //           10);
                  // } else {
                  //   bhajanAudioScreenController.seekTo(
                  //       bhajanAudioScreenController
                  //           .musicLength.value.inSeconds);
                  //   bhajanAudioScreenController.isPlaying.value =
                  //       !bhajanAudioScreenController.isPlaying.value;
                  //   bhajanAudioScreenController.audioPlayer.stop();
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
