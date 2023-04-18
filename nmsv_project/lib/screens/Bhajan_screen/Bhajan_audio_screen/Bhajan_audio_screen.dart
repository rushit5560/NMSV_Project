import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:get/get.dart';
import 'package:nmsv_project/common_widgets/custom_loader.dart';
import 'package:nmsv_project/constants/color.dart';
import 'package:nmsv_project/constants/extension.dart';
import 'package:nmsv_project/screens/Bhajan_screen/Bhajan_player_screen/Bhajan_player_screen_widgets.dart';
import 'package:nmsv_project/utils/style.dart';
import 'package:sizer/sizer.dart';
import '../../../common_widgets/custom_appbar.dart';
import '../../../constants/message.dart';
import '../../../controller/bhajan_audio_screen_controller.dart';
import 'Bhajan_audio_screen_widgets.dart';

class BhajanAudioScreen extends StatelessWidget {
  BhajanAudioScreen({
    Key? key,
  }) : super(key: key);
  final bhajanAudioScreenController = Get.put(BhajanAudioScreenController());
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bhajanAudioScreenController.stopMusic();
        bhajanAudioScreenController.audioPlayer.dispose();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.appColors,
          title: Obx(
            () => bhajanAudioScreenController.isLoading.value
                ? const Text("Bhajan")
                : Obx(
                    () => Text(bhajanAudioScreenController.bhajanName.value
                        .replaceAll(".mp3", "")),
                  ),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                var dowanloadIndex = bhajanAudioScreenController.index;

                if (dowanloadIndex == bhajanAudioScreenController.index) {
                  FileDownloader.downloadFile(
                    url: bhajanAudioScreenController
                        .bhajanList[bhajanAudioScreenController.index].mediaUrl,
                    onProgress: (name, progress) {
                      bhajanAudioScreenController.progress1.value =
                          progress.toInt();
                      log("bhajanAudioScreenController .bhajanList[bhajanAudioScreenController.index].mediaUrl ${bhajanAudioScreenController.bhajanList[bhajanAudioScreenController.index].mediaUrl}");
                      if (bhajanAudioScreenController.onProgressing.value ==
                          false) {
                        log("bhajanAudioScreenController .onProgressing.value 11 : ${bhajanAudioScreenController.onProgressing.value}");

                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) {
                            log("progress $progress");
                            return AlertDialog(
                              backgroundColor: AppColors.whiteColor,

                              content: StatefulBuilder(
                                builder: (context, setState) {
                                  return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Downloading...',
                                        textAlign: TextAlign.center,
                                      ),
                                      Obx(
                                        () => Text(
                                            "${bhajanAudioScreenController.progress1.value} %"),
                                      ),
                                      const SizedBox(
                                        height: 35,
                                        width: 35,
                                        child: CustomLoader(),
                                      )
                                    ],
                                  ).commonSymmetricPadding(horizontal: 20);
                                },
                              ),

                              actionsAlignment: MainAxisAlignment.spaceBetween,
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 40),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18)),
                              titleTextStyle:
                                  TextStyleConfig.textStyle(fontSize: 18),
                              // actions: [CustomLoader()],
                            );
                          },
                        );
                        bhajanAudioScreenController.onProgressing.value = true;
                      }
                    },
                    onDownloadCompleted: (val) {
                      if (bhajanAudioScreenController.onProgressing.value ==
                          true) {
                        log("bhajanAudioScreenController .onProgressing.value 22: ${bhajanAudioScreenController.onProgressing.value}");
                        Get.back();
                        CustomAlertDialog1().showAlertDialog(
                          context: context,
                          text: 'Dowanload successfully...',
                          onYesTap: () {
                            Get.back();
                          },
                        );
                        bhajanAudioScreenController.onProgressing.value = false;
                      }
                    },
                  );
                } else {
                  log("message");
                }
              },
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.appColors, shape: BoxShape.circle),
                child: const Icon(
                  Icons.download,
                  color: AppColors.whiteColor1,
                ).commonAllSidePadding(10),
              ),
            ),
          ],
        ),
        // customAppBar(
        //     titleText: bhajanAudioScreenController
        //         .bhajanList[bhajanAudioScreenController.index].bhajanName
        //         .replaceAll(".mp3", "")
        //         .toUpperCase(),
        //     actionShow: false,
        //     // actionIcon: const Icon(Icons.west_outlined),
        //     // actionOnTap: () {},
        //     // leadingIcon: const Icon(Icons.navigate_before),
        //     // leadingOnTap: () => Get.back(),
        //     leadingShow: false),
        body: Obx(
          () => bhajanAudioScreenController.isLoading.value
              ? const CustomLoader()
              : Column(
                  children: [
                    const AudioModule()
                        .commonSymmetricPadding(horizontal: 10, vertical: 50),
                  ],
                ),
        ),
      ),
    );
  }
}
