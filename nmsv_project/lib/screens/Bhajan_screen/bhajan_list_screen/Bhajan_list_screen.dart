import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nmsv_project/common_widgets/custom_loader.dart';
import 'package:nmsv_project/constants/extension.dart';
import 'package:nmsv_project/constants/message.dart';
import 'package:sizer/sizer.dart';
import '../../../common_widgets/custom_appbar.dart';
import '../../../controller/bhajan_list_screen_controller.dart';
import 'Bhajan_list_screen_widgets.dart';

class BhajanListScreen extends StatelessWidget {
  BhajanListScreen({Key? key}) : super(key: key);
  final bhajanListScreenController = Get.put(BhajanListScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        titleText: AppMessage.bhajan,
        actionShow: false,
        // actionIcon: const Icon(Icons.west_outlined),
        actionOnTap: () {},
        leadingIcon: const Icon(Icons.navigate_before),
        //leadingOnTap: () => Get.to(HomeScreen()),
        leadingShow: true,
      ),
      body: Obx(
        () => bhajanListScreenController.isLoading.value
            ? const CustomLoader()
            : SingleChildScrollView(
                child: Column(
                  children: [
                    TextFiledModule(),
                    SizedBox(height: 2.h),
                    BhajanListModule(),
                  ],
                ).commonSymmetricPadding(horizontal: 10, vertical: 10),
              ),
      ),
    );
  }
}
