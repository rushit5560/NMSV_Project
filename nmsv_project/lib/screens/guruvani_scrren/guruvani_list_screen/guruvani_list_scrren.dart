import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nmsv_project/common_widgets/custom_appbar.dart';
import 'package:nmsv_project/common_widgets/custom_loader.dart';
import 'package:nmsv_project/constants/extension.dart';
import 'package:nmsv_project/constants/message.dart';
import 'package:nmsv_project/controller/guruvani_list_screen_controller.dart';
import 'package:nmsv_project/screens/guruvani_scrren/guruvani_list_screen/guruvani_list_scrren_widgets.dart';
import 'package:sizer/sizer.dart';

class GuruVaniListScreen extends StatelessWidget {
  GuruVaniListScreen({Key? key}) : super(key: key);
  final guruvaniListScreenController = Get.put(GuruvaniListScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        titleText: AppMessage.guruvani,
        actionShow: false,
        // // actionIcon: const Icon(Icons.west_outlined),
        // actionOnTap: () {},
        // leadingIcon: const Icon(Icons.navigate_before),
        // //leadingOnTap: () => Get.to(HomeScreen()),
        leadingShow: false,
      ),
      body: Obx(
        () => guruvaniListScreenController.isLoading.value
            ? const CustomLoader()
            : SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // SizedBox(height: 1.h),
                      GuruvaniTextFiledModule(),
                      SizedBox(height: 3.h),
                      GuruvaniListModule(),
                    ],
                  ).commonSymmetricPadding(horizontal: 10, vertical: 10),
                ),
              ),
      ),
    );
  }
}
