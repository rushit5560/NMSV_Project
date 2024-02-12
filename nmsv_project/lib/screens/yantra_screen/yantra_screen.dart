import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../common_widgets/custom_appbar.dart';
import '../../common_widgets/custom_loader.dart';
import '../../controller/yantra_screen_controller.dart';

class YantraScreen extends StatelessWidget {
  YantraScreen({Key? key}) : super(key: key);
  final yantraScreenController = Get.put(YantraScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(titleText: "Yantra", leadingShow: false, actionShow: false),
      body: Obx(
        () => yantraScreenController.isLoading.value
            ? const CustomLoader()
            : const WebView(
                initialUrl: 'https://narayanmantrasadhanavigyan.org/timings/28',
              ),
      ),
    );
  }
}
