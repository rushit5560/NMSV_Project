import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screens/Bhajan_screen/bhajan_list_screen/Bhajan_list_screen.dart';
import '../screens/Contact_us_screen/Contact_us_screen.dart';
import '../screens/home_screen/home_screen.dart';
import '../screens/profile_section_screen/profile_section_screen.dart';

class IndexScreenController extends GetxController {
  RxBool isLoading = false.obs;
  var selectedIndex = 0.obs;
   //RxBool homeScreenShow = true.obs;

  // RxBool isUserLoggedInStatus = false.obs;

  changeIndex(int index) {
    selectedIndex.value = index;
  }

  // UserPreference userPreference = UserPreference();

  List<Widget> screen = [
    HomeScreen(),
    ContactUsScreen(),
    BhajanListScreen(),
    ProfileSectionScreen(),
    // ProfileScreen() : SignInScreen(),
  ];

  @override
  void onInit() {
    initMethod();
    super.onInit();
  }

  Future<void> initMethod() async {
    isLoading(true);
    // isUserLoggedInStatus.value = await userPreference.getBoolFromPrefs(key: UserPreference.isUserLoggedInKey);


    isLoading(false);
  }

}