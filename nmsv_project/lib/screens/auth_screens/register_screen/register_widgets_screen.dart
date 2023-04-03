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

class SignUpTextFormFieldModule extends StatelessWidget {
  SignUpTextFormFieldModule({super.key});
  final registerScreenController = Get.find<RegisterScreenController>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: registerScreenController.formKey,
      child: Column(
        children: [
          TextFieldModule(
            fieldController: registerScreenController.fullnameEditingController,
            hintText: AppMessage.fullNmae,
            keyboardType: TextInputType.text,
            validate: (value) => FieldValidator().validateFullName(value),
          ),
          SizedBox(height: 2.h),
          TextFieldModule(
            fieldController: registerScreenController.emailEditingController,
            hintText: AppMessage.email,
            keyboardType: TextInputType.text,
            validate: (value) => FieldValidator().validateEmail(value),
          ),
          SizedBox(height: 2.h),
          TextFieldModule(
            fieldController: registerScreenController.userNameEditingController,
            hintText: AppMessage.userName,
            keyboardType: TextInputType.text,
            validate: (value) => FieldValidator().validateUserName(value),
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
          SizedBox(height: 2.h),
          TextFieldModule(
            fieldController:
                registerScreenController.phoneNumberEditingController,
            hintText: AppMessage.phoneNumber,
            keyboardType: TextInputType.number,
            maxLength: 10,
            validate: (value) => FieldValidator().validateMobileNumber(value),
          ),
          SizedBox(height: 3.h),
          CustomSubmitButtonModule(
            labelText: AppMessage.signUp.toUpperCase(),
            buttonColor: AppColors.orangeColor,
            onPress: () async {
              if (registerScreenController.formKey.currentState!.validate()) {
                await registerScreenController.userRegisterFunction();
              }
            },
          ).commonSymmetricPadding(horizontal: 40),
        ],
      ),
    );
    ;
  }
}
