import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nmsv_project/common_widgets/custom_loader.dart';
import 'package:nmsv_project/constants/extension.dart';
import 'package:nmsv_project/controller/guruvani_audio_screen_controller.dart';
import 'package:nmsv_project/screens/guruvani_scrren/guruvani_audio_screen/guruvani_audio_screen_widgets.dart';
import '../../../common_widgets/custom_appbar.dart';
import '../../../constants/message.dart';

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
        return true;
      },
      child: Scaffold(
        appBar: customAppBar(
          titleText: AppMessage.guruvani,
          actionShow: false,
          actionIcon: const Icon(Icons.west_outlined),
          actionOnTap: () {},
          leadingShow: false,
        ),
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
