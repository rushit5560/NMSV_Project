import 'package:flutter/material.dart';
import 'package:flutter_multiple_webview_plugin/flutter_multiple_webview_plugin.dart';
// import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:get/get.dart';

import '../../common_widgets/custom_appbar.dart';
import '../../common_widgets/custom_loader.dart';
import '../../controller/auspicious_timing_screen_controller.dart';

class AuspiciousTimingScreen extends StatelessWidget {
  AuspiciousTimingScreen({Key? key}) : super(key: key);
  final auspiciousTimingScreenController =
      Get.put(AuspiciousTimingScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          titleText: "Auspicious Timing",
          leadingShow: false,
          actionShow: false),
      body: Obx(
        () => auspiciousTimingScreenController.isLoading.value
            ? const CustomLoader()
            : const WebviewScaffold(
                url: 'https://narayanmantrasadhanavigyan.org/timings/31',
              ),
      ),
    );
  }
}
