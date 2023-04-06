import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nmsv_project/common_widgets/custom_appbar.dart';
import 'package:nmsv_project/constants/extension.dart';
import 'package:sizer/sizer.dart';

import '../../constants/color.dart';
import '../../constants/font_family.dart';
import '../../controller/profile_screen_controller.dart';
import '../../utils/style.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);
  final profileScreenController = Get.put(ProfileScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(
            titleText: "Dashboard", leadingShow: false, actionShow: false),
        body: SafeArea(
          child: GridView.builder(
            // physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              crossAxisCount: 2,
              childAspectRatio: 1.50,
            ),
            itemCount: profileScreenController.optionList.length,
            itemBuilder: (context, i) {
              return InkWell(
                onTap: () => profileScreenController.optionClickFunction(i),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade400, width: 1),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5), //color of shadow
                        spreadRadius: 3,
                      )
                    ],
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        height: 50,
                        profileScreenController.optionList[i].image,
                      ),
                      SizedBox(height: 1.h),
                      Text(
                        // maxLines: 1,
                        textAlign: TextAlign.center,
                        profileScreenController.optionList[i].name,
                        style: TextStyleConfig.textStyle(
                          fontFamily: FontFamilyText.roboto,
                          textColor: AppColors.blackColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 10.sp,
                        ),
                      ),
                    ],
                  ),
                ).commonAllSidePadding(5),
              );
            },
          ).commonAllSidePadding(15),
        ));
  }
}
