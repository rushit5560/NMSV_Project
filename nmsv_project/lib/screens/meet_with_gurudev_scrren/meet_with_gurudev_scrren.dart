import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:nmsv_project/common_widgets/custom_appbar.dart';
import 'package:nmsv_project/common_widgets/custom_loader.dart';
import 'package:nmsv_project/constants/message.dart';
import 'package:nmsv_project/controller/meet_with_gurudev_screen_controller.dart';

class MeetWithGurudevScreen extends StatelessWidget {
  MeetWithGurudevScreen({Key? key}) : super(key: key);
  final meetWithGurudevScreenController =
      Get.put(MeetWithGurudevScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        titleText: AppMessage.meetWithGurudev,
        actionShow: false,
        actionOnTap: () {},
        leadingShow: false,
      ),
      body: Obx(
        () => meetWithGurudevScreenController.isLoading.value
            ? const CustomLoader()
            : SingleChildScrollView(
                child: Html(
                  data: meetWithGurudevScreenController.meetToGurudevData.value,
                ),
              ),
      ),
    );
  }
}
