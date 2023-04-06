import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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
    return  Scaffold(
      appBar: customAppBar(
        titleText: AppMessage.campSchedule,
        actionShow: false,
        leadingShow: false,
      ),
      body: Obx(()=>campScheduleScreenController.isLoading.value
            ? const CustomLoader()
            : ListView.builder(
            itemCount: campScheduleScreenController.campSchedule.length,
            itemBuilder: (context, index) {
              double latitude = double.parse(campScheduleScreenController.campSchedule[index].latitude);
              double longitude = double.parse(campScheduleScreenController.campSchedule[index].longitude);

            return  Container(
            margin: const EdgeInsets.all(5),
            child: ExpansionTile(
              collapsedBackgroundColor: AppColors.orangeColor,
              expandedCrossAxisAlignment: CrossAxisAlignment.end,
              collapsedTextColor: AppColors.whiteColor,
              trailing: const SizedBox(),
              title:  Text(campScheduleScreenController.campSchedule[index].date),
              tilePadding: const EdgeInsets.symmetric(horizontal: 5,vertical: 4),
              textColor: campScheduleScreenController.isExpanded.value ? AppColors.whiteColor :AppColors.blackColor ,
              subtitle:  Text(campScheduleScreenController.campSchedule[index].campScheduleTitle),
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                      Text('Location',
                       style: TextStyleConfig.textStyle(
                           fontSize: 12.sp,
                           textColor: AppColors.orangeColor,
                           fontWeight: FontWeight.w400),
                     ),
                    SizedBox(height: 1.h),
                     Text(campScheduleScreenController.campSchedule[index].campAddress,
                       style: TextStyleConfig.textStyle(
                           fontSize: 12.sp,
                           //textColor: AppColors.orangeColor,
                           fontWeight: FontWeight.bold),
                     ),
                    SizedBox(height: 2.h),
                    Container(
                      height: 25.h,
                      color: Colors.grey[200],
                      child: GoogleMap(
                        myLocationButtonEnabled: true,
                        zoomControlsEnabled: false,
                        initialCameraPosition: CameraPosition(target: LatLng(latitude, longitude),
                      ),
                    ),
                    ),
                  ],
                )
              ],
            ),
          );
        },).commonSymmetricPadding(horizontal: 6,vertical: 10),
      ),
    );
  }
}
