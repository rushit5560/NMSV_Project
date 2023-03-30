import 'package:flutter/material.dart';
import 'package:nmsv_project/constants/extension.dart';

import '../constants/color.dart';


class CustomDivider extends StatelessWidget {
  const CustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      thickness: 1, color: AppColors.backGroundColor,
    ).commonSymmetricPadding(horizontal: 15);
  }
}
