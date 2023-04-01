import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nmsv_project/constants/app_images.dart';
import 'package:nmsv_project/constants/color.dart';
import 'package:nmsv_project/constants/extension.dart';
import 'package:nmsv_project/constants/message.dart';
import 'package:nmsv_project/utils/style.dart';
import 'package:sizer/sizer.dart';

class HomeDrawerCustomModule extends StatelessWidget {
  const HomeDrawerCustomModule({super.key});
  @override
  Widget build(BuildContext context) {
    bool status = false;
    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Row(
              children: [
                Expanded(
                child: Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.all(5),
                  height: 12.h,
                  decoration: const BoxDecoration(
                    //color:AppColors.whiteColor,
                  ),
                  child:Image.asset(
                      AppImages.omImage,
                  ),
                ),
              ),
            ]),
            const Divider(color: AppColors.greyColor),
            HomeDrawerModule(
                icon: Icons.home,
                text: AppMessage.home,
            ),
            HomeDrawerModule(
                icon: Icons.music_note_rounded,
                text: AppMessage.bhajan,
            ),
            HomeDrawerModule(
              icon: Icons.media_bluetooth_on,
              text: AppMessage.guruvani,
            ),
            HomeDrawerModule(
              icon: Icons.today,
              text: AppMessage.campSchedule,
            ),
            HomeDrawerModule(
              icon: Icons.people,
              text: AppMessage.meetWithGurudev,
            ),
            HomeDrawerModule(
              icon: Icons.map_sharp,
              text: AppMessage.contactUs,
            ),
            HomeDrawerModule(
              icon: Icons.photo_library_outlined,
              text: AppMessage.gallery,
            ),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
                Text(
                    AppMessage.darkTheme,
                  style: TextStyleConfig.textStyle(
                      fontSize: 12.sp,
                      textColor: AppColors.blackColor,
                      fontWeight: FontWeight.w300
                  ),
                ),
               Switch(
                 value: status,
                 onChanged: (value) {
                 status = value;
               },),
             ],
           ).commonSymmetricPadding(horizontal: 20)
           // const Spacer(),
            // Container(
            //   height: 0.5,
            //   width: double.infinity,
            //   color: Colors.black,
            // ),
            // GestureDetector(
            //   onTap: () {
            //     CustomAlertDialog().showAlertDialog(
            //       context: context,
            //       textContent: AppMessage.logoutMessage,
            //       onYesTap: () {},
            //       onCancelTap: () {
            //         Get.back();
            //       },
            //     );
            //   },
            //   child: ListTile(
            //     leading: const Icon(
            //       Icons.logout,
            //       color: Colors.black,
            //       size: 25,
            //     ),
            //     title: Text(
            //       AppMessage.logout,
            //       style: TextStyleConfig.textStyle(
            //         fontSize: 16.sp,
            //         textColor: Colors.black,
            //       ),
            //     ),
            //   ),
            // ),
          ],
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
          visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
          leading: Icon(
            icon,
            color: Colors.black,
            size: 25,
          ),
          title: Text(
            text,
            style: TextStyleConfig.textStyle(
              fontSize: 14.sp,
              textColor: AppColors.blackColor,
              fontWeight: FontWeight.w300
            ),
          ),
        ),
      ),
        const Divider(height: 2, color: AppColors.greyColor),
    ],
    );
  }
}
