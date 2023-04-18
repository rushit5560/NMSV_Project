import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:get/get.dart';
import 'package:nmsv_project/common_widgets/custom_loader.dart';
import 'package:nmsv_project/constants/color.dart';
import 'package:nmsv_project/constants/extension.dart';
import 'package:nmsv_project/controller/guruvani_audio_screen_controller.dart';
import 'package:nmsv_project/screens/guruvani_scrren/guruvani_audio_screen/guruvani_audio_screen_widgets.dart';
import 'package:nmsv_project/screens/guruvani_scrren/guruvani_player_list_screen/guruvani_player_list_screen_widgets.dart';
import 'package:nmsv_project/utils/style.dart';

class GuruvaniAudioScreen extends StatelessWidget {
  GuruvaniAudioScreen({
    Key? key,
  }) : super(key: key);
  final guruvaniAudioScreenController =
      Get.put(GuruvaniAudioScreenController());
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        guruvaniAudioScreenController.stopMusic();
        guruvaniAudioScreenController.audioPlayer.dispose();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.appColors,
          title: Obx(
            () => guruvaniAudioScreenController.isLoading.value
                ? const Text("Guruvani")
                : Obx(
                    () => Text(
                      guruvaniAudioScreenController.guruvaniName.value
                          .replaceAll(".mp3", ""),
                    ),
                  ),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                var dowanloadIndex = guruvaniAudioScreenController.index;

                if (dowanloadIndex == guruvaniAudioScreenController.index) {
                  FileDownloader.downloadFile(
                    url: guruvaniAudioScreenController
                        .guruvaniList[guruvaniAudioScreenController.index]
                        .mediaUrl,
                    onProgress: (name, progress) {
                      guruvaniAudioScreenController.progress.value =
                          progress.toInt();
                      if (guruvaniAudioScreenController.onProgressing.value ==
                          false) {
                        log("guruvaniAudioScreenController .onProgressing.value 11 : ${guruvaniAudioScreenController.onProgressing.value}");
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
                                            "${guruvaniAudioScreenController.progress.value} %"),
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
                        guruvaniAudioScreenController.onProgressing.value =
                            true;
                      }
                    },
                    onDownloadCompleted: (val) {
                      if (guruvaniAudioScreenController.onProgressing.value ==
                          true) {
                        log("guruvaniAudioScreenController .onProgressing.value 22: ${guruvaniAudioScreenController.onProgressing.value}");
                        Get.back();
                        CustomAlertDialog1().showAlertDialog(
                          context: context,
                          text: 'Dowanload successfully...',
                          onYesTap: () {
                            Get.back();
                          },
                        );
                        guruvaniAudioScreenController.onProgressing.value =
                            false;
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
        //   titleText: guruvaniAudioScreenController
        //       .guruvaniList[guruvaniAudioScreenController.index].title
        //       .replaceAll(".mp3", "")
        //       .toUpperCase(),
        //   actionShow: false,
        //   actionIcon: const Icon(Icons.west_outlined),
        //   actionOnTap: () {},
        //   leadingShow: false,
        // ),
        body: Obx(
          () => guruvaniAudioScreenController.isLoading.value
              ? const CustomLoader()
              : Column(
                  children: [
                    GuruvaniAudioModule()
                        .commonSymmetricPadding(horizontal: 10, vertical: 50),
                  ],
                ),
        ),
      ),
    );
  }
}
