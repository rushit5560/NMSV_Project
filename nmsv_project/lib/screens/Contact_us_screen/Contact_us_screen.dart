import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:nmsv_project/common_modules/custom_submit_button.dart';

// import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nmsv_project/constants/extension.dart';
import 'package:sizer/sizer.dart';
import '../../common_widgets/custom_appbar.dart';
import '../../constants/app_images.dart';
import '../../constants/color.dart';
import '../../constants/message.dart';
import '../../controller/contact_us_screen_controller.dart';
import '../../utils/style.dart';

class ContactUsScreen extends StatelessWidget {
  ContactUsScreen({Key? key}) : super(key: key);
  final contactUsScreenController = Get.put(ContactUsScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        titleText: AppMessage.contactUs,
        actionShow: false,
        leadingShow: false,
      ),
      body: ListView.separated(
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
            height: 2,
            color: AppColors.blackColor,
          );
        },
        shrinkWrap: true,
        itemCount: contactUsScreenController.contactUsList.length,
        itemBuilder: (context, index) {
          var latitude = contactUsScreenController.contactUsList[index].latitude;
          var longitude = contactUsScreenController.contactUsList[index].longitude;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(contactUsScreenController.contactUsList[index].text1).commonSymmetricPadding(horizontal: 15, vertical: 15),
              SizedBox(height: 1.5.h),
              Text(
                contactUsScreenController.contactUsList[index].text2,
                style: TextStyleConfig.textStyle(
                  fontSize: 12.sp,
                  textColor: AppColors.appColors,
                  fontWeight: FontWeight.normal,
                ),
              ).commonSymmetricPadding(horizontal: 15),
              SizedBox(height: 1.h),
              Text(contactUsScreenController.contactUsList[index].text3).commonSymmetricPadding(horizontal: 15),
              SizedBox(height: 1.h),
              Row(
                children: [
                  const Icon(Icons.call, color: Colors.black),
                  SizedBox(width: 1.w),
                  InkWell(
                    onTap: () {
                      contactUsScreenController.makePhoneCall(contactUsScreenController.contactUsList[index].text4.split(":").last);
                    },
                    child: Text(contactUsScreenController.contactUsList[index].text4),
                  ),
                ],
              ).commonSymmetricPadding(horizontal: 15),
              SizedBox(height: 1.h),

              if (contactUsScreenController.contactUsList[index].text041 != null &&
                  contactUsScreenController.contactUsList[index].text041!.isNotEmpty)
                Row(
                  children: [
                    const Icon(Icons.call, color: Colors.black),
                    SizedBox(width: 1.w),
                    InkWell(
                      onTap: () {
                        if (contactUsScreenController.contactUsList[index].text041 != null &&
                            contactUsScreenController.contactUsList[index].text041!.isNotEmpty) {
                          contactUsScreenController.makePhoneCall(contactUsScreenController.contactUsList[index].text041!.split(":").last.trim());
                        }
                      },
                      child: Text(contactUsScreenController.contactUsList[index].text041 ?? ""),
                    ),
                  ],
                ).commonSymmetricPadding(horizontal: 15),
              if (contactUsScreenController.contactUsList[index].text041 != null &&
                  contactUsScreenController.contactUsList[index].text041!.isNotEmpty)
                SizedBox(height: 1.h),

              if (contactUsScreenController.contactUsList[index].text5.split(":").first.trim() == "Chat with us")
                Row(
                  children: [
                    Image.asset(
                      AppImages.wpImage,
                      height: 20,
                      width: 20,
                    ),
                    SizedBox(width: 1.w),
                    InkWell(
                      onTap: () {
                        // print("-------------------${contactUsScreenController.contactUsList[index].text5.split(":").last.trim()}");

                        contactUsScreenController.openWhatsapp(
                          context: context,
                          number: contactUsScreenController.contactUsList[index].text5.split(":").last.trim(),
                        );
                      },
                      child: Text(contactUsScreenController.contactUsList[index].text5),
                    ),
                  ],
                ).commonSymmetricPadding(horizontal: 15),

              if (contactUsScreenController.contactUsList[index].text5.split(":").first.trim() != "Chat with us")
                Text(contactUsScreenController.contactUsList[index].text5).commonSymmetricPadding(horizontal: 15),

              Row(
                children: [
                  PrevioustButtonModule(
                    labelText: 'Direction',
                    buttonColor: AppColors.appColors,
                    icon: Icons.location_pin,
                    onPress: () => MapsLauncher.launchCoordinates(
                      // 37.4220041, -122.0862462,
                      latitude,
                      longitude,
                      contactUsScreenController.contactUsList[index].text1,
                    ),
                  ),
                ],
              ).commonSymmetricPadding(horizontal: 15, vertical: 2.h),

              // Container(
              //   height: 30.h,
              //   color: Colors.grey[200],
              //   child: Align(
              //     alignment: const FractionalOffset(0.1, 0.9),
              //     child: GoogleMap(
              //       myLocationButtonEnabled: true,
              //       zoomControlsEnabled: false,
              //       initialCameraPosition: CameraPosition(target: LatLng(latitude, longitude))
              //     ),
              //   ),
              // ),
            ],
          );
        },
      ).commonSymmetricPadding(vertical: 15),
    );
  }
}
