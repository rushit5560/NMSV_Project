import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nmsv_project/common_modules/custom_alert_dialog.dart';
import 'package:nmsv_project/constants/color.dart';
import 'package:nmsv_project/constants/extension.dart';
import 'package:nmsv_project/constants/message.dart';
import 'package:nmsv_project/utils/style.dart';
import 'package:sizer/sizer.dart';

class HomeDrawerCustomModule extends StatelessWidget {
  const HomeDrawerCustomModule({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Container(
          color: AppColors.whiteColor,
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: ListTile(
                  leading: const Icon(
                    Icons.home,
                    color: Colors.black,
                    size: 25,
                  ),
                  title: Text(
                    AppMessage.home,
                    style: TextStyleConfig.textStyle(
                      fontSize: 16.sp,
                      textColor: Colors.white60,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                    size: 25,
                  ),
                ),
              ),
              const Divider(height: 2, color: Colors.black),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: ListTile(
                  leading: const Icon(
                    Icons.person,
                    color: Colors.black,
                    size: 25,
                  ),
                  title: Text(
                    AppMessage.home,
                    style: TextStyleConfig.textStyle(
                      fontSize: 16.sp,
                      textColor: Colors.black,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                    size: 25,
                  ),
                ),
              ),
              const Divider(height: 2, color: Colors.black),
              ListTile(
                leading: const Icon(
                  Icons.logout,
                  color: AppColors.drawerBackGroundColor,
                  size: 25,
                ),
                title: Text(
                  AppMessage.home,
                  style: TextStyleConfig.textStyle(
                    fontSize: 16.sp,
                    textColor: Colors.white60,
                  ),
                ),
              ),
              const Spacer(),
              Container(
                height: 0.5,
                width: double.infinity,
                color: Colors.black,
              ),
              GestureDetector(
                onTap: () {
                  CustomAlertDialog().showAlertDialog(
                    context: context,
                    textContent: AppMessage.logoutMessage,
                    onYesTap: () {},
                    onCancelTap: () {
                      Get.back();
                    },
                  );
                },
                child: ListTile(
                  leading: const Icon(
                    Icons.logout,
                    color: Colors.black,
                    size: 25,
                  ),
                  title: Text(
                    AppMessage.logout,
                    style: TextStyleConfig.textStyle(
                      fontSize: 16.sp,
                      textColor: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ).commonOnlyPadding(top: 10),
        ),
      ),
    );
  }
}
