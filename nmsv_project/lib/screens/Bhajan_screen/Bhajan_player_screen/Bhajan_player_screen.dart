import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nmsv_project/common_widgets/custom_loader.dart';
import 'package:nmsv_project/constants/extension.dart';
import 'package:sizer/sizer.dart';
import '../../../common_widgets/custom_appbar.dart';
import '../../../controller/bhajan_player_screen_controller.dart';
import 'Bhajan_player_screen_widgets.dart';

class BhajanPlayerScreen extends StatelessWidget {
  BhajanPlayerScreen({Key? key}) : super(key: key);
  final bhajanPlayerScreenController = Get.put(BhajanPlayerScreenController());
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (bhajanPlayerScreenController.onProgressing.value == true) {
          log("bhajanPlayerScreenController.onProgressing.value ${bhajanPlayerScreenController.onProgressing.value}");
          return false;
        } else {
          return true;
        }
        // return true;
      },
      child: Scaffold(
        appBar: customAppBar(
          titleText: bhajanPlayerScreenController.bhajanTitle,
          actionShow: false,
          leadingShow: false,
        ),
        body: Obx(
          () => bhajanPlayerScreenController.isLoading.value
              ? const CustomLoader()
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      TextFormFiledModule(),
                      SizedBox(height: 2.h),
                      BhajanPlayerListModule(),
                    ],
                  ).commonSymmetricPadding(horizontal: 10, vertical: 10),
                ),
        ),
      ),
    );
  }
}
