import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nmsv_project/common_modules/auth_screen_text_field.dart';
import 'package:nmsv_project/common_modules/custom_submit_button.dart';
import 'package:nmsv_project/constants/color.dart';
import 'package:nmsv_project/constants/extension.dart';
import 'package:nmsv_project/constants/message.dart';
import 'package:nmsv_project/controller/auth_screens_controller/signin_screen_controller.dart';
import 'package:nmsv_project/screens/auth_screens/forgot_password_screen/forgot_password_screen.dart';
import 'package:nmsv_project/utils/field_validator.dart';
import 'package:nmsv_project/utils/style.dart';
import 'package:sizer/sizer.dart';

class SignTextFormFieldModule extends StatelessWidget {
  SignTextFormFieldModule({Key? key}) : super(key: key);
  final loginScreenController = Get.find<SignInScreenController>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: loginScreenController.formKey,
      child: Column(
        children: [
          TextFieldModule(
            fieldController: loginScreenController.userNameEditingController,
            hintText: "Username/Email",
            keyboardType: TextInputType.text,
            validate: (value) => FieldValidator().validateUserName(value),
          ),
          SizedBox(height: 2.h),
          Obx(
            () => TextFieldModule(
              obscureText: loginScreenController.isPasswordHide.value,
              fieldController: loginScreenController.passwordEditingController,
              hintText: AppMessage.password,
              keyboardType: TextInputType.text,
              suffixIcon: IconButton(
                onPressed: () {
                  loginScreenController.isPasswordHide.value =
                      !loginScreenController.isPasswordHide.value;
                },
                icon: Icon(
                  loginScreenController.isPasswordHide.value
                      ? Icons.visibility_off
                      : Icons.visibility,
                  color: Colors.grey,
                ),
              ),
              validate: (value) => FieldValidator().validatePassword(value),
            ),
          ),
          SizedBox(height: 1.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  Get.to(
                    () => ForgotPasswordScreen(),
                  );
                },
                child: Text(
                  AppMessage.forGotPassword,
                  style: TextStyleConfig.textStyle(
                    textColor: AppColors.appColors,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 2.h),
          CustomSubmitButtonModule(
            labelText: AppMessage.signin1,
            buttonColor: AppColors.appColors,
            onPress: () async {
              if (loginScreenController.formKey.currentState!.validate()) {
                await loginScreenController.userLoginFunction();
              }
            },
          ).commonSymmetricPadding(horizontal: 40),
        ],
      ),
    );
  }
}
