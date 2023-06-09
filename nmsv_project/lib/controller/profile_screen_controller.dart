import 'dart:developer';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nmsv_project/common_modules/custom_alert_dialog.dart';
import 'package:nmsv_project/constants/app_images.dart';
import 'package:nmsv_project/constants/message.dart';
import 'package:nmsv_project/screens/camp_schedule_screen/camp_schedule_screen.dart';
import 'package:nmsv_project/screens/index_screen/index_screen.dart';
import 'package:nmsv_project/screens/meet_with_gurudev_scrren/meet_with_gurudev_scrren.dart';
import 'package:nmsv_project/screens/viedo_screen/viedo_list_screen/viedo_list_screen.dart';
import 'package:nmsv_project/utils/user_preference.dart';

import '../model/home_screen_model/category_model.dart';
import '../screens/Bhajan_screen/bhajan_list_screen/Bhajan_list_screen.dart';
import '../screens/guruvani_scrren/guruvani_list_screen/guruvani_list_scrren.dart';
import '../screens/magazine_view_screen/magazine_view_screen.dart';
import '../screens/profile_screen/my_profile_screen/my_profile_screen.dart';

class ProfileScreenController extends GetxController {
  UserPreference userPreference = UserPreference();
  var googleSignIn = GoogleSignIn();

  List<MainCategory> optionList = [
    // MainCategory(
    //     image: AppImages.iconMessImage, name: "Magazine Subs. History"),
    MainCategory(image: AppImages.magazineImage, name: "View Magazine"),
    MainCategory(image: AppImages.iconProfileImage, name: "My Profile"),
    MainCategory(image: AppImages.iconSchedule, name: "Camp Schedule"),
    MainCategory(image: AppImages.iconMettingImage, name: "Meet with Gurudev"),
    MainCategory(image: AppImages.bhajanImage, name: "Bhajan"),
    MainCategory(image: AppImages.iconGuruvaniImage, name: "Guruvani"),
    MainCategory(image: AppImages.iconVideoImage, name: "Video"),
    MainCategory(image: AppImages.iconLogoutImage, name: "Logout"),
  ];

  void optionClickFunction(int i) async {
    if (i == 0) {
      log('index : $i');
      Get.to(
        () => MagazineViewScreen(),
        transition: Transition.zoom,
      );
    } else if (i == 1) {
      log('index : $i');
      Get.to(
        () => MyProfileScreen(),
        transition: Transition.zoom,
      );
    } else if (i == 2) {
      log('index : $i');
      Get.to(
        () => CampScheduleScreen(),
        transition: Transition.zoom,
      );
    } else if (i == 3) {
      log('index : $i');
      Get.to(
        () => MeetWithGurudevScreen(),
        transition: Transition.zoom,
      );
    } else if (i == 4) {
      log('index : $i');
      Get.to(
        () => BhajanListScreen(),
        transition: Transition.zoom,
      );
    } else if (i == 5) {
      log('index : $i');
      Get.to(
        () => GuruVaniListScreen(),
        transition: Transition.zoom,
      );
    } else if (i == 6) {
      log('index : $i');
      Get.to(
        () => VideoListScreen(),
        transition: Transition.zoom,
      );
    } else if (i == 7) {
      log('index : $i');

      CustomAlertDialog().showAlertDialog(
        context: Get.context!,
        textContent: AppMessage.logoutMessage,
        onYesTap: () async {
          await userLogOutFunction();
        },
        onCancelTap: () {
          Get.back();
        },
      );
    }
  }

  Future<void> userLogOutFunction() async {
    await userPreference.removeUserDetails();
    // await fb.logOut();
    await googleSignIn.signOut();

    Fluttertoast.showToast(
      // backgroundColor: AppColors.appColors,
      msg: "logout successfully..",
    );

    Get.offAll(() => IndexScreen(),
        transition: Transition.native,
        duration: const Duration(milliseconds: 500));
  }
}
