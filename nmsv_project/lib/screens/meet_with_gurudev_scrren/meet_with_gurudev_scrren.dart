import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:get/get.dart';
import 'package:nmsv_project/common_widgets/custom_appbar.dart';
import 'package:nmsv_project/common_widgets/custom_loader.dart';
import 'package:nmsv_project/constants/message.dart';
import 'package:nmsv_project/controller/meet_with_gurudev_screen_controller.dart';
import 'package:nmsv_project/screens/index_screen/index_screen.dart';

class MeetWithGurudevScreen extends StatelessWidget {
  MeetWithGurudevScreen({Key? key}) : super(key: key);
  final meetWithGurudevScreenController =
      Get.put(MeetWithGurudevScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        titleText: AppMessage.meetToGurudev,
        actionShow: false,
        // actionIcon: const Icon(Icons.west_outlined),
        actionOnTap: () {},
        // leadingIcon: IconButton(
        //   icon: const Icon(Icons.navigate_before),
        //   onPressed: () {
        //     Get.ba(() => IndexScreen());
        //   },
        // ),
        //leadingOnTap: () => Get.to(HomeScreen()),
        leadingShow: false,
      ),
      body: Obx(
        () => meetWithGurudevScreenController.isLoading.value
            ? const CustomLoader()
            : Html(
                data: meetWithGurudevScreenController.meetToGurudevData.value,

                // url: 'https://narayanmantrasadhanavigyan.org/api2/WidgetSection/?slug=meeting_with_gurudev',
              ),
      ),
    );
  }
}
