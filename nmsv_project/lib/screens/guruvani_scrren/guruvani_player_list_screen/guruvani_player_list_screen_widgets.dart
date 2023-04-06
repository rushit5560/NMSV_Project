import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nmsv_project/common_modules/auth_screen_text_field.dart';
import 'package:nmsv_project/constants/message.dart';
import 'package:nmsv_project/controller/guruvani_player_screen_controller.dart';
import 'package:nmsv_project/screens/guruvani_scrren/guruvani_audio_screen/guruvani_audio_screen.dart';

class GuruvaniTextFormFiledModule extends StatelessWidget {
  GuruvaniTextFormFiledModule({Key? key}) : super(key: key);
  final guruvaniPlayerScreenController =
      Get.find<GuruvaniPlayerScreenController>();
  @override
  Widget build(BuildContext context) {
    return SearchBarTextFieldModule(
      fieldController: guruvaniPlayerScreenController.searchController,
      fillColor: Colors.grey[200],
      prefixIcon: const Icon(Icons.search, color: Colors.grey),
      onChanged: (value) {
        guruvaniPlayerScreenController.isLoading(true);
        guruvaniPlayerScreenController.serchGuruvaniplayerList =
            guruvaniPlayerScreenController.guruvaniplayerList
                .where((element) => element.title.toLowerCase().contains(value))
                .toList();
        guruvaniPlayerScreenController.isLoading(false);
      },
      hintText: AppMessage.search,
      keyboardType: TextInputType.text,
      suffixIcon: guruvaniPlayerScreenController.searchController.text.isEmpty
          ? null
          : IconButton(
              onPressed: () {
                guruvaniPlayerScreenController.isLoading(true);
                guruvaniPlayerScreenController.serchGuruvaniplayerList =
                    guruvaniPlayerScreenController.guruvaniplayerList;
                guruvaniPlayerScreenController.searchController.clear();
                guruvaniPlayerScreenController.isLoading(false);
              },
              icon: const Icon(Icons.close, color: Colors.grey),
            ),
    );
  }
}

class GuruvaniPlayerListModule extends StatelessWidget {
  GuruvaniPlayerListModule({Key? key}) : super(key: key);
  final guruvaniPlayerScreenController =
      Get.find<GuruvaniPlayerScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      // itemCount: guruvaniPlayerScreenController.allGalleryList.length,
      itemCount: guruvaniPlayerScreenController.serchGuruvaniplayerList.length,
      itemBuilder: (context, index) {
        log("mediaUrl  ${guruvaniPlayerScreenController.serchGuruvaniplayerList[index].mediaUrl}");
        var value =
            guruvaniPlayerScreenController.serchGuruvaniplayerList[index];
        return InkWell(
          onTap: () {
            Get.to(
              () => GuruvaniAudioScreen(),
              arguments: guruvaniPlayerScreenController
                  .serchGuruvaniplayerList[index].mediaUrl,
              // arguments: guruvaniPlayerScreenController
              //     .serchBhajanplayerList[index].mediaUrl
            );
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.only(bottom: 10),
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
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Text(guruvaniPlayerScreenController.allGalleryList[index].shivirGalleryTitle),
                Text(value.title),
                const Spacer(),
                const Icon(
                  Icons.navigate_next_outlined,
                  size: 20,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}