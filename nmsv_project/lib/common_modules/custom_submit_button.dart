import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nmsv_project/constants/color.dart';
import 'package:nmsv_project/constants/extension.dart';
import 'package:nmsv_project/utils/style.dart';
import 'package:sizer/sizer.dart';

class CustomSubmitButtonModule extends StatelessWidget {
  Function() onPress;
  String labelText;
  Color buttonColor;
  double? labelSize;
  CustomSubmitButtonModule({
    Key? key,
    required this.onPress,
    required this.labelText,
    this.buttonColor = AppColors.blackColor,
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
              )),
          onPressed: onPress,
          child: Text(
            labelText,
            style: TextStyleConfig.textStyle(
              textColor: AppColors.whiteColor,
              fontSize: labelSize ?? 16.sp,
            ),
          ).commonSymmetricPadding(vertical: 10),
        ),
      ),
    );
  }
}
