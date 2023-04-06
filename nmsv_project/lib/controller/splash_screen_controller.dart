import 'dart:async';

import 'package:get/get.dart';
import 'package:nmsv_project/screens/index_screen/index_screen.dart';

class SplashScreenController extends GetxController {
  startTimer() async {
    Timer(const Duration(milliseconds: 2500), () async {
      Get.offAll(() => IndexScreen());
    });
  }

  @override
  void onInit() {
    startTimer();
    super.onInit();
  }
}
