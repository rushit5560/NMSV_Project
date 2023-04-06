import 'dart:developer';

import 'package:get/get.dart';
import 'package:nmsv_project/constants/app_images.dart';
import 'package:nmsv_project/screens/camp_schedule_screen/camp_schedule_screen.dart';
import 'package:nmsv_project/screens/meet_with_gurudev_scrren/meet_with_gurudev_scrren.dart';

import '../model/home_screen_model/category_model.dart';
import '../screens/Bhajan_screen/bhajan_list_screen/Bhajan_list_screen.dart';
import '../screens/guruvani_scrren/guruvani_list_screen/guruvani_list_scrren.dart';
import '../screens/magazine_history_screen/magazine_history_screen.dart';
import '../screens/magazine_view_screen/magazine_view_screen.dart';
import '../screens/profile_screen/my_profile_screen/my_profile_screen.dart';

class ProfileScreenController extends GetxController {


  List<MainCategory> optionList = [
    MainCategory(
      image: AppImages.iconDiksha,
      name: "Magazine Subs. History"
    ),
    MainCategory(
        image: AppImages.iconDiksha,
        name: "View Magazine"
    ),
    MainCategory(
        image: AppImages.iconDiksha,
        name: "My Profile"
    ),
    MainCategory(
        image: AppImages.iconDiksha,
        name: "Camp Schedule"
    ),
    MainCategory(
        image: AppImages.iconDiksha,
        name: "Meeting With Gurudev"
    ),
    MainCategory(
        image: AppImages.iconDiksha,
        name: "Bhajan"
    ),
    MainCategory(
        image: AppImages.iconDiksha,
        name: "Gurudev"
    ),
    MainCategory(
        image: AppImages.iconDiksha,
        name: "Video"
    ),
    MainCategory(
        image: AppImages.iconDiksha,
        name: "Logout"
    ),
  ];

  void optionClickFunction(int i) {
    if(i == 0) {
      log('index : $i');
      Get.to(
            () => MagazineHistoryScreen(),
        transition: Transition.zoom,
      );
    } else if(i == 1) {
      log('index : $i');
      Get.to(
            () => MagazineViewScreen(),
        transition: Transition.zoom,
      );
    } else if(i == 2) {
      log('index : $i');
      Get.to(
            () => MyProfileScreen(),
        transition: Transition.zoom,
      );
    } else if(i == 3) {
      log('index : $i');
      Get.to(
            () => CampScheduleScreen(),
        transition: Transition.zoom,
      );
    } else if(i == 4) {
      log('index : $i');
      Get.to(
            () => MeetWithGurudevScreen(),
        transition: Transition.zoom,
      );
    } else if(i == 5) {
      log('index : $i');
      Get.to(
            () => BhajanListScreen(),
        transition: Transition.zoom,
      );
    } else if(i == 6) {
      log('index : $i');
      Get.to(
        () => GuruVaniListScreen(),
        transition: Transition.zoom,
      );
    } else if(i == 7) {
      log('index : $i');
      // Get.to(
      //   () => MeetGurudevScreen(),
      //   transition: Transition.zoom,
      // );
    } else if(i == 8) {
      log('index : $i');
      // Get.to(
      //   () => ContactUsScreen(),
      //   transition: Transition.zoom,
      // );
    }
  }
}