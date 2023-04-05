import 'dart:developer';

import 'package:get/get.dart';

import '../utils/user_preference.dart';

class ProfileSectionScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isUserLoggedInStatus = false.obs;

  UserPreference userPreference = UserPreference();

  @override
  void onInit() {
    initMethod();
    super.onInit();
  }

  Future<void> initMethod() async {
    isLoading(true);
    isUserLoggedInStatus.value = await userPreference.getBoolFromPrefs(key: UserPreference.isUserLoggedInKey);
    log('isUserLoggedInStatus.value : ${isUserLoggedInStatus.value}');
    isLoading(false);
  }
}