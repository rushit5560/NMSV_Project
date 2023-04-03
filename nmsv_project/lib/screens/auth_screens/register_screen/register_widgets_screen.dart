import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nmsv_project/common_modules/auth_screen_text_field.dart';
import 'package:nmsv_project/common_modules/custom_submit_button.dart';
import 'package:nmsv_project/constants/color.dart';
import 'package:nmsv_project/constants/extension.dart';
import 'package:nmsv_project/constants/message.dart';
import 'package:nmsv_project/controller/auth_screens_controller/register_screen_controller.dart';
import 'package:nmsv_project/utils/field_validator.dart';
import 'package:sizer/sizer.dart';

class SigninTextFormFieldModule extends StatelessWidget {
  SigninTextFormFieldModule({super.key});
  final registerScreenController = Get.find<RegisterScreenController>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: registerScreenController.formKey,
      child: Column(
        children: [
          TextFieldModule(
            fieldController: registerScreenController.userNameEditingController,
            hintText: AppMessage.userName,
            keyboardType: TextInputType.text,
            validate: (value) => FieldValidator().validateEmail(value),
          ),
          SizedBox(height: 2.h),
          Obx(
            () => TextFieldModule(
              obscureText: registerScreenController.isPasswordHide.value,
              fieldController:
                  registerScreenController.passwordEditingController,
              hintText: AppMessage.password,
              keyboardType: TextInputType.text,
              suffixIcon: IconButton(
                onPressed: () {
                  registerScreenController.isPasswordHide.value =
                      !registerScreenController.isPasswordHide.value;
                },
                icon: Icon(
                  registerScreenController.isPasswordHide.value
                      ? Icons.visibility
                      : Icons.visibility_off,
                ),
              ),
              validate: (value) => FieldValidator().validatePassword(value),
            ),
          ),
          SizedBox(height: 1.h),
          SizedBox(height: 2.h),
          CustomSubmitButtonModule(
            labelText: AppMessage.signin1,
            buttonColor: AppColors.orangeColor,
            onPress: () {
              if (registerScreenController.formKey.currentState!.validate()) {
                log("login");
              }
            },
          ).commonSymmetricPadding(horizontal: 40),
        ],
      ),
    );
    ;
  }
}
