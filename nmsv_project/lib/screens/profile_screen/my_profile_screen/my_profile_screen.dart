import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nmsv_project/constants/extension.dart';
import 'package:nmsv_project/screens/profile_screen/my_profile_screen/my_profile_screen_Widgets.dart';

import '../../../common_widgets/custom_appbar.dart';
import '../../../controller/my_profile_screen_controller.dart';

class MyProfileScreen extends StatelessWidget {
  MyProfileScreen({Key? key}) : super(key: key);
  final myProfileScreenController = Get.put(MyProfileScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          titleText: "Profile", leadingShow: false, actionShow: false),
      body: SingleChildScrollView(
        child: Column(
          children: [MyProfileTextFormFieldWidgets()],
        ).commonSymmetricPadding(horizontal: 20, vertical: 15),
      ),
    );
  }
}
