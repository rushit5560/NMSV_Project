import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:nmsv_project/constants/extension.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/color.dart';
import '../../../controller/view_magazine_screen_controller.dart';
import '../../../utils/style.dart';
import '../view_magazine_pdf_screen/view_magazine_pdf_screen.dart';

class MagazineSubscriptionModule extends StatelessWidget {
  MagazineSubscriptionModule({Key? key}) : super(key: key);
  final viewMagazineScreenController = Get.find<ViewMagazineScreenController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 25.h,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  viewMagazineScreenController.viewMagazinePdf.value),
            ),
          ),
        ).commonSymmetricPadding(horizontal: 100, vertical: 10),
        Text(
          viewMagazineScreenController.title,
          style: TextStyleConfig.textStyle(
              fontSize: 12.sp, fontWeight: FontWeight.bold),
        ),
        const Divider(),
        Text(
          'SadGurudev',
          style: TextStyleConfig.textStyle(
              fontSize: 12.sp, fontWeight: FontWeight.bold),
        ),
        Text(viewMagazineScreenController.sadGurudev),
        const Divider(),
        Text(
          'Regular Feature',
          style: TextStyleConfig.textStyle(
              fontSize: 12.sp, fontWeight: FontWeight.bold),
        ),
        const Divider(),
        Html(data: viewMagazineScreenController.regularFeature),
        const Divider(),
        Text(
          'Sadhana',
          style: TextStyleConfig.textStyle(
              fontSize: 12.sp, fontWeight: FontWeight.bold),
        ),
        Text(viewMagazineScreenController.sadhana),
        const Divider(),
        Text(
          'Ayurveda',
          style: TextStyleConfig.textStyle(
              fontSize: 12.sp, fontWeight: FontWeight.bold),
        ),
        Text(viewMagazineScreenController.ayurveda),
        Center(
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.orangeColor,
                minimumSize: const Size.fromHeight(40), // NEW
              ),
              onPressed: () {
                log("viewMagazineScreenController.pdfurl ${viewMagazineScreenController.pdfurl}");
                Get.to(
                  () => ViewMagazinePDFScreen(),
                  arguments: viewMagazineScreenController.pdfurl,
                );
              },
              child: const Text('View Magazine')),
        ),
      ],
    );
  }
}
