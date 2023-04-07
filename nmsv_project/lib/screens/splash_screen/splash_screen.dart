import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nmsv_project/constants/app_images.dart';
import 'package:nmsv_project/constants/extension.dart';
import 'package:nmsv_project/controller/splash_screen_controller.dart';

class SplashScareen extends StatelessWidget {
  SplashScareen({super.key});
  final splashScreenController = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              AppImages.logoImage,
              height: 300,
            ),
          ),
        ],
      ).commonSymmetricPadding(horizontal: 25),
    );
  }
}
