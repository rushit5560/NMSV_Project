import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nmsv_project/constants/extension.dart';
import 'package:nmsv_project/constants/message.dart';
import 'package:sizer/sizer.dart';
import '../../common_widgets/custom_appbar.dart';
import '../../controller/bhajan_screen_controller.dart';
import 'Bhajan_screen_widgets.dart';

class BhajanScreen extends StatelessWidget {
   BhajanScreen({Key? key}) : super(key: key);
final bhajanScreenController = Get.put(BhajanScreenController());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: customAppBar(
          titleText: AppMessage.bhajan,
          actionShow: false,
          actionIcon: const Icon(Icons.west_outlined),
          actionOnTap: () {},
          leadingIcon: const Icon(Icons.navigate_before),
          leadingOnTap: () {
           // Get.to(HomeScreen());
          }),
      body: Column(
        children: [
          TextFiledModule(),
          SizedBox(height: 2.h),
          const BhajanListModule(),
        ],
      ).commonSymmetricPadding(horizontal: 10,vertical: 10),
    );
  }
}
