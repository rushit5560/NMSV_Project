import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nmsv_project/constants/extension.dart';
import 'package:sizer/sizer.dart';
import '../../common_widgets/custom_appbar.dart';
import '../../constants/color.dart';
import '../../constants/message.dart';
import '../../controller/contact_us_screen_controller.dart';
import '../../utils/style.dart';


class ContactUsScreen extends StatelessWidget {
   ContactUsScreen({Key? key}) : super(key: key);
   final contactUsScreenController = Get.put(ContactUsScreenController());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: customAppBar(
        titleText: AppMessage.contactUs,
        actionShow: false,
        actionOnTap: () {},
        leadingIcon: const Icon(Icons.navigate_before),
        leadingOnTap: () {
          Get.back();
        },
        leadingShow: true,
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: contactUsScreenController.contactUsList.length,
        itemBuilder: (context, index) {
           var latitude = contactUsScreenController.contactUsList[index].latitude ;
           var longitude =contactUsScreenController.contactUsList[index].longitude ;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 1.h),
              Text(contactUsScreenController.contactUsList[index].text1),
              SizedBox(height: 1.5.h),
              Text(contactUsScreenController.contactUsList[index].text2,
                style: TextStyleConfig.textStyle(
                    fontSize: 12.sp,
                    textColor: AppColors.orangeColor,
                    fontWeight: FontWeight.normal),
              ),
              SizedBox(height: 1.h),
              Text(contactUsScreenController.contactUsList[index].text3),
              SizedBox(height: 1.h),
              Text(contactUsScreenController.contactUsList[index].text4),
              SizedBox(height: 1.h),
              Text(contactUsScreenController.contactUsList[index].text5),
              SizedBox(height: 2.h),
              Container(
                height: 30.h,
                color: Colors.grey[200],
                child: Align(
                  alignment: const FractionalOffset(0.1, 0.9),
                  child: GoogleMap(
                    myLocationButtonEnabled: true,
                    zoomControlsEnabled: false,
                    initialCameraPosition: CameraPosition(target: LatLng(latitude, longitude))
                  ),
                ),
              ),
            ],
          );
        },).commonSymmetricPadding(horizontal: 15,vertical: 15),
    );
  }
}
