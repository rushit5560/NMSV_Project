import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:nmsv_project/common_modules/custom_submit_button.dart';
import 'package:nmsv_project/constants/color.dart';
import 'package:nmsv_project/constants/extension.dart';
import 'package:sizer/sizer.dart';
import '../../common_widgets/custom_appbar.dart';
import '../../common_widgets/custom_loader.dart';
import '../../constants/message.dart';
import '../../controller/auth_screens_controller/camp_schedule_screen_controller.dart';
import '../../utils/style.dart';

class CampScheduleScreen extends StatelessWidget {
  CampScheduleScreen({Key? key}) : super(key: key);
  final campScheduleScreenController = Get.put(CampScheduleScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        titleText: AppMessage.campSchedule,
        actionShow: false,
        leadingShow: false,
      ),
      body: Obx(
        () => campScheduleScreenController.isLoading.value
            ? const CustomLoader()
            : ListView.builder(
                itemCount: campScheduleScreenController.campSchedule.length,
                itemBuilder: (context, index) {
                  double latitude = double.parse(campScheduleScreenController
                      .campSchedule[index].latitude);
                  double longitude = double.parse(campScheduleScreenController
                      .campSchedule[index].longitude);
                  return Container(
                    margin: const EdgeInsets.all(5),
                    child: ExpansionTile(
                      collapsedBackgroundColor: AppColors.appColors,
                      expandedCrossAxisAlignment: CrossAxisAlignment.end,
                      collapsedTextColor: AppColors.whiteColor,
                      trailing: const SizedBox(),
                      title: Text(campScheduleScreenController
                          .campSchedule[index].date),
                      tilePadding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 4),
                      textColor: campScheduleScreenController.isExpanded.value
                          ? AppColors.whiteColor
                          : AppColors.blackColor,
                      subtitle: Text(
                        campScheduleScreenController
                            .campSchedule[index].campScheduleTitle,
                      ),
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Location',
                              style: TextStyleConfig.textStyle(
                                  fontSize: 12.sp,
                                  textColor: AppColors.appColors,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(height: 1.h),
                            Text(
                              campScheduleScreenController
                                  .campSchedule[index].campAddress,
                              style: TextStyleConfig.textStyle(
                                  fontSize: 12.sp,
                                  //textColor: AppColors.appColors,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 2.h),
                            Row(
                              children: [
                                PrevioustButtonModule(
                                  labelText: 'Direction',
                                  buttonColor: AppColors.appColors,
                                  icon: Icons.location_pin,
                                  onPress: () {
                                    log("latitude 111  $latitude");
                                    log("longitude 222 $longitude");
                                    return MapsLauncher.launchCoordinates(
                                      // 37.4220041, -122.0862462,
                                      latitude,
                                      longitude,
                                      campScheduleScreenController
                                          .campSchedule[index].campAddress,
                                    );
                                  },
                                ),
                              ],
                            ).commonSymmetricPadding(
                                horizontal: 15, vertical: 2.h),
                            // Container(
                            //   height: 25.h,
                            //   color: Colors.grey[200],
                            //   child: GoogleMap(
                            //     myLocationButtonEnabled: true,
                            //     zoomControlsEnabled: false,
                            //     initialCameraPosition: CameraPosition(
                            //       target: LatLng(latitude, longitude),
                            //     ),
                            //   ),
                            // ),
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
