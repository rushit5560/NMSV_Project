import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nmsv_project/common_modules/auth_screen_text_field.dart';
import 'package:nmsv_project/constants/message.dart';
import 'package:nmsv_project/controller/auth_screens_controller/signin_screen_controller.dart';
import 'package:nmsv_project/utils/field_validator.dart';
import 'package:sizer/sizer.dart';

class TextFormFieldModule extends StatelessWidget {
  TextFormFieldModule({Key? key}) : super(key: key);
  final loginScreenController = Get.find<SignInScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFieldModule(
          fieldController: loginScreenController.userNameEditingController,
          hintText: AppMessage.userName,
          keyboardType: TextInputType.text,
          validate: (value)=> FieldValidator().validateEmail(value),

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
                    ? Icons.visibility
                    : Icons.visibility_off,
              ),
            ),
            validate: (value) => FieldValidator().validatePassword(value),
          ),
        ),
      ],
    );
  }
}
