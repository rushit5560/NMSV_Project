// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'package:nmsv_project/constants/color.dart';
import 'package:nmsv_project/constants/extension.dart';
import 'package:nmsv_project/utils/style.dart';

// ignore: must_be_immutable
class CustomSubmitButtonModule extends StatelessWidget {
  Function() onPress;
  String labelText;
  Color buttonColor;
  Color textColor;

  double? labelSize;
  CustomSubmitButtonModule({
    Key? key,
    required this.onPress,
    required this.labelText,
    this.buttonColor = AppColors.blackColor,
    this.textColor = AppColors.whiteColor,
    this.labelSize,
  }) : super(key: key);
  // final locationManageScreenController = Get.find<LocationManageScreenController>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        // height: 50,
        width: Get.width,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          onPressed: onPress,
          child: Text(
            labelText,
            style: TextStyleConfig.textStyle(
              textColor: textColor,
              fontSize: labelSize ?? 16.sp,
            ),
          ).commonSymmetricPadding(vertical: 10),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class PrevioustButtonModule extends StatelessWidget {
  Function() onPress;
  String labelText;
  Color buttonColor;
  Color textColor;
  IconData? icon;
  IconData? icon1;

  double? labelSize;
  PrevioustButtonModule({
    Key? key,
    required this.onPress,
    required this.labelText,
    this.buttonColor = AppColors.blackColor,
    this.textColor = AppColors.whiteColor,
    this.icon,
    this.labelSize,
  }) : super(key: key);
  // final locationManageScreenController = Get.find<LocationManageScreenController>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        // height: 50,
        // width: Get.width,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          onPressed: onPress,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon),
              Text(
                labelText,
                style: TextStyleConfig.textStyle(
                  textColor: textColor,
                  fontSize: labelSize ?? 10.sp,
                ),
              ).commonSymmetricPadding(vertical: 10),
            ],
          ),
        ),
      ),
    );
  }
}

class NexttButtonModule extends StatelessWidget {
  Function() onPress;
  String labelText;
  Color buttonColor;
  Color textColor;
  // IconData? icon;
  IconData? icon1;

  double? labelSize;
  NexttButtonModule({
    Key? key,
    required this.onPress,
    required this.labelText,
    this.buttonColor = AppColors.blackColor,
    this.textColor = AppColors.whiteColor,
    // this.icon,
    this.icon1,
    this.labelSize,
  }) : super(key: key);
  // final locationManageScreenController = Get.find<LocationManageScreenController>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        // height: 50,
        // width: Get.width,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          onPressed: onPress,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                labelText,
                style: TextStyleConfig.textStyle(
                  textColor: textColor,
                  fontSize: labelSize ?? 16.sp,
                ),
              ).commonSymmetricPadding(vertical: 10),
              Icon(icon1),
            ],
          ),
        ),
      ),
    );
  }
}
