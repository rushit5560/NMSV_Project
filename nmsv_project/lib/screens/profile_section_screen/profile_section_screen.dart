import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nmsv_project/common_widgets/custom_loader.dart';

import '../../controller/profile_section_screen_controller.dart';
import '../auth_screens/login_screen/signin_screen.dart';
import '../profile_screen/profile_screen.dart';

class ProfileSectionScreen extends StatelessWidget {
  ProfileSectionScreen({Key? key}) : super(key: key);
  final profileSectionScreenController =
      Get.put(ProfileSectionScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => profileSectionScreenController.isLoading.value
            ? CustomLoader()
            : profileSectionScreenController.isUserLoggedInStatus.value
                ? ProfileScreen()
                : SignInScreen(),
      ),
    );
  }
}
