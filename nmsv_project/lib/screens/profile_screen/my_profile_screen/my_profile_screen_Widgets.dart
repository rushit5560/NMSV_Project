import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nmsv_project/common_modules/auth_screen_text_field.dart';
import 'package:nmsv_project/common_modules/custom_submit_button.dart';
import 'package:nmsv_project/constants/color.dart';
import 'package:nmsv_project/constants/message.dart';
import 'package:nmsv_project/controller/my_profile_screen_controller.dart';
import 'package:sizer/sizer.dart';

class MyProfileTextFormFieldWidgets extends StatelessWidget {
  MyProfileTextFormFieldWidgets({super.key});
  final myProfileScreenController = Get.find<MyProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: myProfileScreenController.formKey,
      child: Column(
        children: [
          TextFieldModule(
            fieldController: myProfileScreenController.usernamecontroller,
            hintText: 'Username',
            keyboardType: TextInputType.text,
          ),
          SizedBox(height: 2.h),
          TextFieldModule(
            readonly: true,
            fieldController: myProfileScreenController.emailcontroller,
            hintText: 'Email',
            keyboardType: TextInputType.text,
          ),
          SizedBox(height: 2.h),
          TextFieldModule(
            fieldController: myProfileScreenController.firstnamecontroller,
            hintText: 'FirstName',
            keyboardType: TextInputType.text,
          ),
          SizedBox(height: 2.h),
          TextFieldModule(
            fieldController: myProfileScreenController.lastNameController,
            hintText: 'LatName',
            keyboardType: TextInputType.text,
          ),
          SizedBox(height: 2.h),
          TextFieldModule(
            fieldController: myProfileScreenController.mobileNocontroller,
            hintText: 'Mobile No.',
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 2.h),
          TextFieldModule(
            fieldController: myProfileScreenController.streetAddresscontroller,
            hintText: 'Street Address',
            keyboardType: TextInputType.text,
          ),
          SizedBox(height: 2.h),
          TextFieldModule(
            fieldController: myProfileScreenController.citycontroller,
            hintText: 'City',
            keyboardType: TextInputType.text,
          ),
          SizedBox(height: 2.h),
          TextFieldModule(
            fieldController: myProfileScreenController.statecontroller,
            hintText: 'State/Province/Region',
            keyboardType: TextInputType.text,
          ),
          SizedBox(height: 2.h),
          TextFieldModule(
            fieldController: myProfileScreenController.zipcontroller,
            hintText: 'Zip/Postal Code',
            keyboardType: TextInputType.text,
          ),
          SizedBox(height: 2.h),
          TextFieldModule(
            fieldController: myProfileScreenController.countrycontroller,
            hintText: 'Country',
            keyboardType: TextInputType.text,
          ),
          SizedBox(height: 2.h),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: CustomSubmitButtonModule(
                  labelText: AppMessage.cancle,
                  onPress: () {
                    Get.back();
                  },
                  buttonColor: AppColors.whiteColor1,
                  textColor: AppColors.blackColor,
                ),
              ),
              SizedBox(width: 2.w),
              Expanded(
                flex: 7,
                child: CustomSubmitButtonModule(
                  labelText: AppMessage.updateProfile,
                  onPress: () async {
                    if (myProfileScreenController.formKey.currentState!
                        .validate()) {
                      await myProfileScreenController
                          .updateProfileDataFunction();
                    }
                  },
                  buttonColor: AppColors.orangeColor,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
