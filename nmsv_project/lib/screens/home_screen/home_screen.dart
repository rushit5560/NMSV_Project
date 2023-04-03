import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:nmsv_project/common_widgets/custom_appbar.dart';
import 'package:nmsv_project/constants/extension.dart';
import 'package:nmsv_project/constants/message.dart';
import 'package:nmsv_project/controller/home_screen_controller.dart';
import 'package:nmsv_project/screens/home_screen/home_screen_widgets.dart';
import 'package:sizer/sizer.dart';

import '../../drawer_menu/home_drawer.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final homoScreenController = Get.put(HomoScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: homoScreenController.scaffoldKey,
      appBar: customAppBar(
        actionShow: false,
        leadingShow: true,
        actionIcon: const Icon(Icons.menu),
        actionOnTap: () {},
        leadingIcon: const Icon(Icons.menu),
        leadingOnTap: () {
          homoScreenController.scaffoldKey.currentState!.openDrawer();
        },
        titleText: AppMessage.home,
      ),
      drawer: HomeDrawerCustomModule(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            CarouselBannerModule(),
            ChoiceTopicModule(),
            SizedBox(height: 2.h),
            const HomeScreenTextModule(),
            SizedBox(height: 2.h),
          ],
        ).commonSymmetricPadding(horizontal: 15),
      ),
    );
  }
}
