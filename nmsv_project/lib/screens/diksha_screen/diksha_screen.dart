import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:nmsv_project/common_widgets/custom_appbar.dart';
import 'package:nmsv_project/common_widgets/custom_loader.dart';
import 'package:nmsv_project/constants/extension.dart';
import '../../controller/diksha_screen_controller.dart';


class DikshaScreen extends StatelessWidget {
  DikshaScreen({Key? key}) : super(key: key);
  final dikshaScreenController = Get.put(DikshaScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(titleText: "Diskha", leadingShow: false, actionShow: false),

      body: Obx(
        ()=> dikshaScreenController.isLoading.value
        ? CustomLoader()
        : SingleChildScrollView(
          // child: WebView(
          //   initialUrl: 'https://narayanmantrasadhanavigyan.org/timings/27',
          //   // controller: dikshaScreenController.webViewController,
          // ).commonSymmetricPadding(horizontal: 10, vertical: 10),
          child: Html(
            data: dikshaScreenController.dikshaData.value,
          ).commonSymmetricPadding(horizontal: 10, vertical: 10),
        ),
      ),
    );
  }
}
