import 'dart:developer';

import 'package:get/get.dart';
import 'package:nmsv_project/constants/app_images.dart';

import '../model/home_screen_model/category_model.dart';
import '../screens/magazine_view_screen/magazine_view_screen.dart';

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
      // Get.to(
      //       () => DikshaScreen(),
      //   transition: Transition.zoom,
      // );
    } else if(i == 1) {
      log('index : $i');
      Get.to(
            () => MagazineViewScreen(),
        transition: Transition.zoom,
      );
    } else if(i == 2) {
      log('index : $i');
      // Get.to(
      //       () => BooksScreen(),
      //   transition: Transition.zoom,
      // );
    } else if(i == 3) {
      log('index : $i');
      // Get.to(
      //       () => SadhanaScreen(),
      //   transition: Transition.zoom,
      // );
    } else if(i == 4) {
      log('index : $i');
      // Get.to(
      //       () => MantraScreen(),
      //   transition: Transition.zoom,
      // );
    } else if(i == 5) {
      log('index : $i');
      // Get.to(
      //       () => AuspiciousTimingScreen(),
      //   transition: Transition.zoom,
      // );
    } else if(i == 6) {
      log('index : $i');
      // Get.to(
      //   () => CampScheduleScreen(),
      //   transition: Transition.zoom,
      // );
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