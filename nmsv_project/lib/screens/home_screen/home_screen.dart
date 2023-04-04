import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:nmsv_project/common_widgets/custom_appbar.dart';
import 'package:nmsv_project/common_widgets/custom_loader.dart';
import 'package:nmsv_project/constants/extension.dart';
import 'package:nmsv_project/constants/message.dart';
import 'package:nmsv_project/controller/home_screen_controller.dart';
import 'package:nmsv_project/screens/home_screen/home_screen_widgets.dart';
import 'package:sizer/sizer.dart';

import '../../drawer_menu/home_drawer.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final homeScreenController = Get.put(HomoScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: homeScreenController.scaffoldKey,
      appBar: customAppBar(
        actionShow: false,
        leadingShow: true,
        actionIcon: const Icon(Icons.menu),
        actionOnTap: () {},
        leadingIcon: const Icon(Icons.menu),
        leadingOnTap: () {
          homeScreenController.scaffoldKey.currentState!.openDrawer();
        },
        titleText: AppMessage.home,
      ),
      drawer: const HomeDrawerCustomModule(),
      body: Obx(
        ()=> homeScreenController.isLoading.value
        ? const CustomLoader()
        : SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              CarouselBannerModule(),
              SizedBox(height: 0.5.h),
              ChoiceTopicModule(),
              SizedBox(height: 0.5.h),
              HomeScreenTextModule(),
              SizedBox(height: 2.h),
            ],
          ).commonSymmetricPadding(horizontal: 15),
        ),
      ),
    );
  }
}
