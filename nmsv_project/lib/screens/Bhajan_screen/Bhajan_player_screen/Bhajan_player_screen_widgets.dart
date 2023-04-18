import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nmsv_project/common_widgets/custom_loader.dart';
import 'package:nmsv_project/constants/color.dart';
import 'package:nmsv_project/constants/extension.dart';
import 'package:nmsv_project/constants/font_family.dart';
import 'package:nmsv_project/constants/message.dart';
import 'package:nmsv_project/utils/style.dart';
import 'package:sizer/sizer.dart';
import '../../../common_modules/auth_screen_text_field.dart';
import '../../../controller/bhajan_player_screen_controller.dart';
import '../Bhajan_audio_screen/Bhajan_audio_screen.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';

class TextFormFiledModule extends StatelessWidget {
  TextFormFiledModule({Key? key}) : super(key: key);
  final bhajanPlayerScreenController = Get.find<BhajanPlayerScreenController>();
  @override
  Widget build(BuildContext context) {
    return SearchBarTextFieldModule(
      fieldController: bhajanPlayerScreenController.searchController,
      fillColor: Colors.grey[200],
      prefixIcon: const Icon(Icons.search, color: Colors.grey),
      onChanged: (value) {
        bhajanPlayerScreenController.isLoading(true);
        bhajanPlayerScreenController.serchBhajanplayerList =
            bhajanPlayerScreenController.bhajanplayerList
                .where((element) =>
                    element.bhajanName.toLowerCase().contains(value))
                .toList();
        bhajanPlayerScreenController.isLoading(false);
      },
      hintText: AppMessage.search,
      keyboardType: TextInputType.text,
      suffixIcon: bhajanPlayerScreenController.searchController.text.isEmpty
          ? null
          : IconButton(
              onPressed: () {
                bhajanPlayerScreenController.isLoading(true);
                bhajanPlayerScreenController.serchBhajanplayerList =
                    bhajanPlayerScreenController.bhajanplayerList;
                bhajanPlayerScreenController.searchController.clear();
                bhajanPlayerScreenController.isLoading(false);
              },
              icon: const Icon(Icons.close, color: Colors.grey),
            ),
    );
  }
}

class BhajanPlayerListModule extends StatelessWidget {
  BhajanPlayerListModule({Key? key}) : super(key: key);
  final bhajanPlayerScreenController = Get.find<BhajanPlayerScreenController>();

  @override
  Widget build(BuildContext context) {
    return bhajanPlayerScreenController.serchBhajanplayerList.isEmpty
        ? Center(
            child: Text(
              "No data found.",
              style: TextStyleConfig.textStyle(fontSize: 14.sp),
            ),
          )
        : ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            // itemCount: bhajanPlayerScreenController.allGalleryList.length,
            itemCount:
                bhajanPlayerScreenController.serchBhajanplayerList.length,
            itemBuilder: (context, index) {
              var value =
                  bhajanPlayerScreenController.serchBhajanplayerList[index];
              return InkWell(
                onTap: () {
                  log("mediaUrl  ${bhajanPlayerScreenController.serchBhajanplayerList[index].mediaUrl}");
                  Get.to(
                    () => BhajanAudioScreen(),
                    arguments: [
                      // bhajanPlayerScreenController
                      //     .serchBhajanplayerList[index].bhajanName
                      //     .toString()
                      //     .replaceAll(".mp3", ""),
                      bhajanPlayerScreenController.serchBhajanplayerList,
                      index,
                    ],
                    // arguments: bhajanPlayerScreenController
                    //     .serchBhajanplayerList[index].mediaUrl
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 2.h),
                  decoration: BoxDecoration(
                    // border: Border.all(color: Colors.grey.shade400, width: 0.0),
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.3), //color of shadow
                          // spreadRadius: 3,
                          blurRadius: 5,
                          blurStyle: BlurStyle.outer)
                    ],
                  ),
                  child: ListTile(
                    title: Text(
                      value.bhajanName,
                      style: TextStyleConfig.textStyle(
                          fontSize: 13.sp, fontWeight: FontWeight.w500),
                    ),
                    trailing: GestureDetector(
                      onTap: () {
                        var dowanloadIndex = index;

                        if (dowanloadIndex == index) {
                          FileDownloader.downloadFile(
                            url: value.mediaUrl.trim(),
                            onProgress: (name, progress) {
                              bhajanPlayerScreenController.progress.value =
                                  progress.toInt();
                              if (bhajanPlayerScreenController
                                      .onProgressing.value ==
                                  false) {
                                log("bhajanPlayerScreenController .onProgressing.value 11 : ${bhajanPlayerScreenController.onProgressing.value}");

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
                                                    "${bhajanPlayerScreenController.progress.value} %"),
                                              ),
                                              const SizedBox(
                                                height: 35,
                                                width: 35,
                                                child: CustomLoader(),
                                              )
                                            ],
                                          ).commonSymmetricPadding(
                                              horizontal: 20);
                                        },
                                      ),

                                      actionsAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 40),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18)),
                                      titleTextStyle: TextStyleConfig.textStyle(
                                          fontSize: 18),
                                      // actions: [CustomLoader()],
                                    );
                                  },
                                );
                                bhajanPlayerScreenController
                                    .onProgressing.value = true;
                              }
                            },
                            onDownloadCompleted: (val) {
                              if (bhajanPlayerScreenController
                                      .onProgressing.value ==
                                  true) {
                                log("bhajanPlayerScreenController .onProgressing.value 22: ${bhajanPlayerScreenController.onProgressing.value}");
                                Get.back();
                                CustomAlertDialog1().showAlertDialog(
                                  context: context,
                                  text: 'Dowanload successfully...',
                                  onYesTap: () {
                                    Get.back();
                                  },
                                );
                                bhajanPlayerScreenController
                                    .onProgressing.value = false;
                              }
                            },
                          );
                        } else {
                          log("message");
                        }
                        log("D 111");
                      },
                      child: const Icon(Icons.download),
                    ),
                  ),
                ),
              );
            },
          );
  }
}

class CustomAlertDialog2 {
  void showAlertDialog({
    required BuildContext context,
    required String text,
  }) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.whiteColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 35,
                width: 35,
                child: CustomLoader(),
              )
            ],
          ),
          actionsAlignment: MainAxisAlignment.spaceBetween,
          contentPadding: const EdgeInsets.symmetric(vertical: 40),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          titleTextStyle: TextStyleConfig.textStyle(fontSize: 18),
          // actions: [CustomLoader()],
        );
      },
    );
  }
}

class CustomAlertDialog1 {
  void showAlertDialog({
    required BuildContext context,
    required String text,
    required Function() onYesTap,
  }) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.whiteColor,
          title: Text(
            text,
            textAlign: TextAlign.center,
          ),
          actionsAlignment: MainAxisAlignment.spaceBetween,
          contentPadding: const EdgeInsets.symmetric(vertical: 40),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          titleTextStyle: TextStyleConfig.textStyle(fontSize: 18),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OutlinedButton(
                  onPressed: onYesTap,
                  style: OutlinedButton.styleFrom(
                    backgroundColor: AppColors.appColors,
                  ),
                  child: Text(
                    AppMessage.ok,
                    style: TextStyleConfig.textStyle(
                      textColor: AppColors.whiteColor,
                      fontSize: 17,
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
