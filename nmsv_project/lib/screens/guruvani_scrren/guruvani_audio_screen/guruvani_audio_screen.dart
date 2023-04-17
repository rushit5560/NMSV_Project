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
                      if (guruvaniAudioScreenController.onProgressing.value ==
                          false) {
                        log("guruvaniAudioScreenController .onProgressing.value 11 : ${guruvaniAudioScreenController.onProgressing.value}");

                        CustomAlertDialog2().showAlertDialog(
                            context: context, text: 'Downloading... ');
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
