import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nmsv_project/constants/extension.dart';
import 'package:nmsv_project/constants/message.dart';
import 'package:nmsv_project/screens/Bhajan_screen/bhajan_list_screen/Bhajan_list_screen.dart';
import 'package:sizer/sizer.dart';

import '../../../common_widgets/custom_appbar.dart';
import '../../../controller/bhajan_player_screen_controller.dart';
import '../bhajan_list_screen/Bhajan_list_screen_widgets.dart';
import 'Bhajan_player_screen_widgets.dart';

class BhajanPlayerScreen extends StatelessWidget {
   BhajanPlayerScreen({Key? key}) : super(key: key);
   final bhajanPlayerScreenController = Get.put(BhajanPlayerScreenController());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: customAppBar(
          titleText: AppMessage.bhajanPlayer,
          actionShow: false,
          actionIcon: const Icon(Icons.west_outlined),
          actionOnTap: () {},
          leadingIcon: const Icon(Icons.navigate_before),
          leadingOnTap:  () => Get.back(),
          leadingShow: true),
      body: Column(
        children: [
          TextFormFiledModule(),
          SizedBox(height: 2.h),
          BhajanPlayerListModule(),
        ],
      ).commonSymmetricPadding(horizontal: 10,vertical: 10),
    );
  }
}
