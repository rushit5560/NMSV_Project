import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nmsv_project/constants/color.dart';
import 'package:nmsv_project/constants/message.dart';
import 'package:nmsv_project/utils/style.dart';

class CustomAlertDialog {
  void showAlertDialog({
    required BuildContext context,
    required String textContent,
    required Function() onYesTap,
    required Function() onCancelTap,
  }) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.whiteColor,
          title: Text(
            textContent,
            textAlign: TextAlign.center,
          ),
          actionsAlignment: MainAxisAlignment.spaceBetween,
          contentPadding: const EdgeInsets.symmetric(vertical: 40),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          titleTextStyle: TextStyleConfig.textStyle(fontSize: 18),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  onPressed: onYesTap,
                  style: OutlinedButton.styleFrom(
                    backgroundColor: AppColors.orangeColor,
                  ),
                  child: Text(
                    AppMessage.yes,
                    style: TextStyleConfig.textStyle(
                      textColor: AppColors.whiteColor,
                      fontSize: 17,
                    ),
                  ),
                ),
                OutlinedButton(
                  onPressed: onCancelTap,
                  style: OutlinedButton.styleFrom(
                    backgroundColor: AppColors.orangeColor,
                  ),
                  child: Text(
                    AppMessage.no,
                    style: TextStyleConfig.textStyle(
                      textColor: AppColors.whiteColor,
                      fontSize: 17,
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

class CustomMobileBackPressAlertDialog extends StatelessWidget {
  // String textContent;
  // Function() onYesTap;
  // Function() onCancelTap;

  CustomMobileBackPressAlertDialog({
    Key? key,
    // required String textContent,
    // required Function() onYesTap,
    // required Function() onCancelTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.whiteColor,
      title: Text(
        AppMessage.backAlertMessage,
        textAlign: TextAlign.center,
      ),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      contentPadding: const EdgeInsets.symmetric(vertical: 40),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      titleTextStyle: TextStyleConfig.textStyle(fontSize: 18),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            OutlinedButton(
              onPressed: () {
                exit(0);
              },
              style: OutlinedButton.styleFrom(
                  backgroundColor: AppColors.orangeColor),
              child: Text(
                AppMessage.yes,
                style: TextStyleConfig.textStyle(
                  textColor: AppColors.whiteColor,
                  fontSize: 17,
                ),
              ),
            ),
            OutlinedButton(
              onPressed: () {
                Get.back();
              },
              style: OutlinedButton.styleFrom(
                  backgroundColor: AppColors.orangeColor),
              child: Text(
                AppMessage.no,
                style: TextStyleConfig.textStyle(
                  textColor: AppColors.whiteColor,
                  fontSize: 17,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
