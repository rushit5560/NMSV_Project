import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nmsv_project/common_widgets/custom_appbar.dart';
import 'package:nmsv_project/common_widgets/custom_loader.dart';
import 'package:nmsv_project/constants/extension.dart';
import 'package:nmsv_project/constants/message.dart';
import 'package:nmsv_project/controller/guruvani_player_screen_controller.dart';
import 'package:nmsv_project/screens/guruvani_scrren/guruvani_player_list_screen/guruvani_player_list_screen_widgets.dart';
import 'package:sizer/sizer.dart';

class GuruvaniPlayerScreen extends StatelessWidget {
  GuruvaniPlayerScreen({Key? key}) : super(key: key);
  final guruvaniPlayerScreenController =
      Get.put(GuruvaniPlayerScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          titleText: guruvaniPlayerScreenController.guruvaniPlayerTitle,
          actionShow: false,
          actionIcon: const Icon(Icons.west_outlined),
          actionOnTap: () {},
          leadingShow: false),
      body: Obx(
        () => guruvaniPlayerScreenController.isLoading.value
            ? const CustomLoader()
            : SingleChildScrollView(
                child: Column(
                  children: [
                    GuruvaniTextFormFiledModule(),
                    SizedBox(height: 2.h),
                    GuruvaniPlayerListModule(),
                  ],
                ).commonSymmetricPadding(horizontal: 10, vertical: 10),
              ),
      ),
    );
  }
}
