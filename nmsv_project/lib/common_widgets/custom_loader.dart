import 'package:flutter/material.dart';
import 'package:nmsv_project/constants/color.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(color: AppColors.backGroundColor),
    );
  }
}
