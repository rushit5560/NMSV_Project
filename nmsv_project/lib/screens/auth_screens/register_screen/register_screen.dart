import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nmsv_project/common_widgets/custom_appbar.dart';
import 'package:nmsv_project/constants/app_images.dart';
import 'package:nmsv_project/constants/color.dart';
import 'package:nmsv_project/constants/extension.dart';
import 'package:nmsv_project/constants/message.dart';
import 'package:nmsv_project/controller/auth_screens_controller/register_screen_controller.dart';
import 'package:nmsv_project/screens/auth_screens/login_screen/signin_screen.dart';
import 'package:nmsv_project/screens/auth_screens/register_screen/register_widgets_screen.dart';
import 'package:nmsv_project/utils/style.dart';
import 'package:sizer/sizer.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final registerScreenController = Get.put(RegisterScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.whiteColor1,
      appBar: customAppBar(
        actionShow: false,
        leadingShow: false,
        actionIcon: const Icon(Icons.menu),
        actionOnTap: () {},
        leadingIcon: const Icon(Icons.menu),
        leadingOnTap: () {},
        titleText: AppMessage.signUp,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
                child: Image.asset(AppImages.appLogoImage),
              ),
              SizedBox(height: 1.h),
              Text(
                AppMessage.appMesage,
                style: TextStyleConfig.textStyle(
                  textColor: AppColors.appColors,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(height: 3.h),
              SignUpTextFormFieldModule(),
              SizedBox(height: 2.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppMessage.alreadyAccount,
                    style: TextStyleConfig.textStyle(
                      textColor: AppColors.blackColor,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Text(
                      " ${AppMessage.signin}",
                      style: TextStyleConfig.textStyle(
                        textColor: AppColors.appColors,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ).commonSymmetricPadding(horizontal: 30, vertical: 2.h),
        ),
      ),
    );
  }
}
