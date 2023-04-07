import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nmsv_project/constants/font_family.dart';
import 'package:nmsv_project/constants/message.dart';
import 'package:nmsv_project/utils/style.dart';
import 'package:sizer/sizer.dart';
import '../../../common_modules/auth_screen_text_field.dart';
import '../../../controller/bhajan_player_screen_controller.dart';
import '../Bhajan_audio_screen/Bhajan_audio_screen.dart';

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
                      bhajanPlayerScreenController
                          .serchBhajanplayerList[index].bhajanName
                          .toString()
                          .replaceAll(".mp3", ""),
                      bhajanPlayerScreenController
                          .serchBhajanplayerList[index].mediaUrl,
                    ],
                    // arguments: bhajanPlayerScreenController
                    //     .serchBhajanplayerList[index].mediaUrl
                  );
                },
                child: Container(
                  // padding: const EdgeInsets.all(8),
                  // margin: const EdgeInsets.only(bottom: 10),
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
                        onTap: () {}, child: const Icon(Icons.download)),
                  ),
                ),
              );
            },
          );
  }
}
