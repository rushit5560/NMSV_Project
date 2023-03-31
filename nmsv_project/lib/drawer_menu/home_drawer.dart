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
              HomeDrawerModule(
                  icon: Icons.home,
                  text: AppMessage.home,
              ),
              HomeDrawerModule(
                  icon: Icons.music_note_rounded,
                  text: AppMessage.bhajan,
              ),
              HomeDrawerModule(
                icon: Icons.music_note_rounded,
                text: AppMessage.guruvani,
              ),
              HomeDrawerModule(
                icon: Icons.calendar_month,
                text: AppMessage.campSchedule,
              ),
              HomeDrawerModule(
                icon: Icons.people,
                text: AppMessage.meetWithGurudev,
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

class HomeDrawerModule extends StatelessWidget {
  final  IconData? icon;
  final String text;
  const HomeDrawerModule({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        GestureDetector(
        onTap: () {
          Get.back();
        },
        child: ListTile(
          leading: Icon(
            icon,
            color: Colors.black,
            size: 25,
          ),
          title: Text(
            text,
            style: TextStyleConfig.textStyle(
              fontSize: 16.sp,
              textColor: Colors.black,
            ),
          ),
        ),
      ),
        const Divider(height: 2, color: Colors.black),
    ],
    );
  }
}
