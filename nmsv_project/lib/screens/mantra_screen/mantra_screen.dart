import 'package:flutter/material.dart';
import 'package:flutter_multiple_webview_plugin/flutter_multiple_webview_plugin.dart';
import 'package:get/get.dart';
import '../../common_widgets/custom_appbar.dart';
import '../../common_widgets/custom_loader.dart';
import '../../controller/mantra_screen_controller.dart';

class MantraScreen extends StatelessWidget {
  MantraScreen({Key? key}) : super(key: key);
  final mantraScreenController = Get.put(MantraScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          titleText: "Mantra", leadingShow: false, actionShow: false),
      body: Obx(
        () => mantraScreenController.isLoading.value
            ? const CustomLoader()
            : const WebviewScaffold(
                url: 'https://narayanmantrasadhanavigyan.org/timings/30',
              ),
      ),
    );
  }
}
