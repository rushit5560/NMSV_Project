import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nmsv_project/common_widgets/custom_appbar.dart';
import 'package:nmsv_project/common_widgets/custom_loader.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../controller/diksha_screen_controller.dart';

class DikshaScreen extends StatelessWidget {
  DikshaScreen({Key? key}) : super(key: key);
  final dikshaScreenController = Get.put(DikshaScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          titleText: "Diksha", leadingShow: false, actionShow: false),
      body: Obx(
        () => dikshaScreenController.isLoading.value
            ? const CustomLoader()
            :const WebView(
          initialUrl: 'https://narayanmantrasadhanavigyan.org/timings/27',
        ),
      ),
    );
  }
}
