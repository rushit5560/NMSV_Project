import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nmsv_project/common_modules/auth_screen_text_field.dart';
import 'package:nmsv_project/common_modules/custom_submit_button.dart';
import 'package:nmsv_project/constants/color.dart';
import 'package:nmsv_project/constants/extension.dart';
import 'package:nmsv_project/constants/message.dart';
import 'package:nmsv_project/controller/auth_screens_controller/forgot_password_screen_controller.dart';
import 'package:nmsv_project/utils/field_validator.dart';
import 'package:sizer/sizer.dart';

class ForgotTextFormFieldModule extends StatelessWidget {
  ForgotTextFormFieldModule({super.key});
  final forgotPasswordScreenContoller =
      Get.find<ForgotPasswordScreenContoller>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: forgotPasswordScreenContoller.formKey,
      child: Column(
        children: [
          TextFieldModule(
            fieldController:
                forgotPasswordScreenContoller.emailEditingController,
            hintText: AppMessage.email,
            keyboardType: TextInputType.text,
            validate: (value) => FieldValidator().validateEmail(value),
          ),
          SizedBox(height: 3.h),
          CustomSubmitButtonModule(
            labelText: AppMessage.getpassword,
            buttonColor: AppColors.orangeColor,
            onPress: () async {
              if (forgotPasswordScreenContoller.formKey.currentState!
                  .validate()) {
                await forgotPasswordScreenContoller.forgotPasswordFunction();
              }
            },
          ).commonSymmetricPadding(horizontal: 40),
        ],
      ),
    );
  }
}
