import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nmsv_project/constants/extension.dart';
import 'package:sizer/sizer.dart';

import '../../../common_modules/auth_screen_text_field.dart';
import '../../../common_widgets/custom_appbar.dart';
import '../../../controller/my_profile_screen_controller.dart';

class MyProfileScreen extends StatelessWidget {
   MyProfileScreen({Key? key}) : super(key: key);
final myProfileScreenController = Get.put(MyProfileScreenController());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: customAppBar(
          titleText: "Profile",
          leadingShow: false,
          actionShow: false),
      body: Column(
        children: [
          MyProfileTextFieldModule(
            fieldController: myProfileScreenController.usernamecontroller,
            hintText: 'Username',
            keyboardType: TextInputType.text,
          ),
          SizedBox(height: 1.h),
          MyProfileTextFieldModule(
            fieldController: myProfileScreenController.username2controller,
            hintText: 'Username',
            keyboardType: TextInputType.text,
          ),
          SizedBox(height: 1.h),
          MyProfileTextFieldModule(
            fieldController: myProfileScreenController.firstnamecontroller,
            hintText: 'FirstName',
            keyboardType: TextInputType.text,
          ),
          SizedBox(height: 1.h),
          MyProfileTextFieldModule(
            fieldController: myProfileScreenController.lastNameController,
            hintText: 'LatName',
            keyboardType: TextInputType.text,
          ),
          SizedBox(height: 1.h),
          MyProfileTextFieldModule(
            fieldController: myProfileScreenController.mobileNocontroller,
            hintText: 'Mobile No.',
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 1.h),
          MyProfileTextFieldModule(
            fieldController: myProfileScreenController.SttreetAddresscontroller,
            hintText: 'Street Address',
            keyboardType: TextInputType.text,
          ),
          SizedBox(height: 1.h),
          MyProfileTextFieldModule(
            fieldController: myProfileScreenController.citycontroller,
            hintText: 'City',
            keyboardType: TextInputType.text,
          ),
          SizedBox(height: 1.h),
          MyProfileTextFieldModule(
            fieldController: myProfileScreenController.statecontroller,
            hintText: 'State/Province/Region',
            keyboardType: TextInputType.text,
          ),
          SizedBox(height: 1.h),
          MyProfileTextFieldModule(
            fieldController: myProfileScreenController.zipcontroller,
            hintText: 'Zip/Postal Code',
            keyboardType: TextInputType.text,
          ),
          SizedBox(height: 1.h),
          MyProfileTextFieldModule(
            fieldController: myProfileScreenController.countrycontroller,
            hintText: 'Country',
            keyboardType: TextInputType.text,
          ),
          SizedBox(height: 1.h),
          Row(
            children: [
              SizedBox(width: 2.h),
              ElevatedButton(onPressed: () {

              }, child: Text('data'),),
              SizedBox(width: 5.h),
              ElevatedButton(onPressed: () {

              }, child: Text('data'),),
            ],
          )
        ],
      ).commonSymmetricPadding(horizontal: 20,vertical: 15),
    );
  }
}
