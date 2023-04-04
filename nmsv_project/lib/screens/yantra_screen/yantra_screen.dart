import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:get/get.dart';

import '../../common_widgets/custom_appbar.dart';
import '../../common_widgets/custom_loader.dart';
import '../../controller/yantra_screen_controller.dart';

class YantraScreen extends StatelessWidget {
  YantraScreen({Key? key}) : super(key: key);
  final yantraScreenController = Get.put(YantraScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          titleText: "Yantra", leadingShow: false, actionShow: false),

      body: Obx(
            () => yantraScreenController.isLoading.value
            ? const CustomLoader()
            : const WebviewScaffold(
          url: 'https://narayanmantrasadhanavigyan.org/timings/28',
        ),
      ),


    );
  }
}
