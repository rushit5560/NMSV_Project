import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nmsv_project/common_widgets/custom_loader.dart';
import 'package:nmsv_project/constants/extension.dart';
import '../../../common_widgets/custom_appbar.dart';
import '../../../constants/message.dart';
import '../../../controller/bhajan_audio_screen_controller.dart';
import 'Bhajan_audio_screen_widgets.dart';

class BhajanAudioScreen extends StatelessWidget {
  BhajanAudioScreen({Key? key,})
      : super(key: key);
  final bhajanAudioScreenController = Get.put(BhajanAudioScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          titleText: AppMessage.bhajan,
          actionShow: false,
          actionIcon: const Icon(Icons.west_outlined),
          actionOnTap: () {},
          leadingIcon: const Icon(Icons.navigate_before),
          leadingOnTap: () => Get.back(),
          leadingShow: true),
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
    );
  }
}
