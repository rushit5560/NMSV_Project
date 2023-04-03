import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nmsv_project/constants/app_images.dart';
import 'package:nmsv_project/constants/color.dart';
import 'package:nmsv_project/constants/extension.dart';
import 'package:nmsv_project/constants/message.dart';
import 'package:nmsv_project/screens/auth_screens/login_screen/signin_screen_widgets.dart';
import 'package:nmsv_project/utils/style.dart';
import 'package:sizer/sizer.dart';

import '../../../common_modules/auth_screen_text_field.dart';
import '../../../common_widgets/custom_appbar.dart';
import '../../../controller/auth_screens_controller/signin_screen_controller.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);
  final loginScreenController = Get.put(SignInScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor1,
      appBar: customAppBar(
        actionShow: false,
        leadingShow: false,
        actionIcon: const Icon(Icons.menu),
        actionOnTap: () {},
        leadingIcon: const Icon(Icons.menu),
        leadingOnTap: () {},
        titleText: AppMessage.signin,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20.h,
            child: Image.asset(AppImages.appLogoImage),
          ),SizedBox(height: 1.h),
          Text(AppMessage.appMesage,style: TextStyleConfig.textStyle(),),
          SizedBox(height: 3.h),
          TextFormFieldModule(),
        ],
      ).commonSymmetricPadding(horizontal: 30, vertical: 2.h),
    );
  }
}
