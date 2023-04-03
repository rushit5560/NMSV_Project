import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nmsv_project/common_modules/custom_submit_button.dart';
import 'package:nmsv_project/constants/app_images.dart';
import 'package:nmsv_project/constants/color.dart';
import 'package:nmsv_project/constants/extension.dart';
import 'package:nmsv_project/constants/message.dart';
import 'package:nmsv_project/screens/auth_screens/forgot_password_screen/forgot_password_screen.dart';
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
          ),
          SizedBox(height: 1.h),
          Text(
            AppMessage.appMesage,
            style: TextStyleConfig.textStyle(
              textColor: AppColors.orangeColor,
              fontWeight: FontWeight.bold,
              fontSize: 14.sp,
            ),
          ),
          SizedBox(height: 3.h),
          TextFormFieldModule(),
          SizedBox(height: 1.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  Get.to(
                    () => const ForgotPasswordScreen(),
                  );
                },
                child: Text(
                  AppMessage.forGotPassword,
                  style: TextStyleConfig.textStyle(
                    textColor: AppColors.orangeColor,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 2.h),
          CustomSubmitButtonModule(
            labelText: AppMessage.signin1,
            buttonColor: AppColors.orangeColor,
            onPress: () {},
          ).commonSymmetricPadding(horizontal: 40),
          SizedBox(height: 2.h),
          Text(
            AppMessage.or,
            style: TextStyleConfig.textStyle(
              textColor: AppColors.blackColor,
              fontSize: 14.sp,
            ),
          ),
          SizedBox(height: 2.h),

          SizedBox(
            // height: 50,
            width: Get.width,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[600],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  )),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 30,
                    decoration: const BoxDecoration(
                      color: AppColors.whiteColor,
                      // shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      AppImages.googleImage,
                    ).commonAllSidePadding(3),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    AppMessage.googleSign,
                    style: TextStyleConfig.textStyle(
                      textColor: AppColors.whiteColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ).commonSymmetricPadding(vertical: 7),
            ),
          ).commonSymmetricPadding(horizontal: 40),
          // Container(,)
        ],
      ).commonSymmetricPadding(horizontal: 30, vertical: 2.h),
    );
  }
}
