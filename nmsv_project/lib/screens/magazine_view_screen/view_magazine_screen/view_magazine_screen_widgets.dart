import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:external_path/external_path.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:nmsv_project/common_widgets/custom_loader.dart';
import 'package:nmsv_project/constants/extension.dart';
import 'package:nmsv_project/controller/view_magazin_pdf_screen_controller.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/color.dart';
import '../../../controller/view_magazine_screen_controller.dart';
import '../../../utils/style.dart';
import '../view_magazine_pdf_screen/view_magazine_pdf_screen.dart';

class MagazineSubscriptionModule extends StatefulWidget {
  const MagazineSubscriptionModule({Key? key}) : super(key: key);

  @override
  State<MagazineSubscriptionModule> createState() =>
      _MagazineSubscriptionModuleState();
}

class _MagazineSubscriptionModuleState
    extends State<MagazineSubscriptionModule> {
  final viewMagazineScreenController = Get.find<ViewMagazineScreenController>();

  String remotePDFpath = "";

  Future<File> createFileOfPdfUrl() async {
    Completer<File> completer = Completer();
    log("Start download file from internet!");
    try {
      final url = viewMagazineScreenController.pdfurl;
      final filename = url.substring(url.lastIndexOf("/") + 1);
      log("filename  $filename");
      var request = await HttpClient().getUrl(Uri.parse(url));
      var response = await request.close();
      var bytes = await consolidateHttpClientResponseBytes(response);
      var dir = await getApplicationDocumentsDirectory();

      if (viewMagazineScreenController.isAlertShow.value == true) {
        Get.back();
      }
      log("Download files");
      log("${dir.path}/$filename");
      File file = File("${dir.path}/$filename");

      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
      log("Download complite");
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }

    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 25.h,
          decoration: BoxDecoration(
            border: Border.all(),
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
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Divider(),
        Text(
          'SadGurudev',
          style: TextStyleConfig.textStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(viewMagazineScreenController.sadGurudev),
        const Divider(),
        Text(
          'Regular Feature',
          style: TextStyleConfig.textStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Divider(),
        Html(data: viewMagazineScreenController.regularFeature),
        const Divider(),
        Text(
          'Sadhana',
          style: TextStyleConfig.textStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
            textColor: AppColors.blackColor,
          ),
        ),
        Text(viewMagazineScreenController.sadhana),
        const Divider(),
        Text(
          'Ayurveda',
          style: TextStyleConfig.textStyle(
              fontSize: 12.sp, fontWeight: FontWeight.bold),
        ),
        Html(data:viewMagazineScreenController.ayurveda),

        Center(
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.appColors,
                minimumSize: const Size.fromHeight(40), // NEW
              ),
              onPressed: () async {
                // log("viewMagazineScreenController.pdfurl ${viewMagazineScreenController.pdfurl}");
                // await viewMagazinePdfScreenController.getPath();
                late String path;

                late String urlPdfName;
                late String localPdfPath;

                path = await ExternalPath.getExternalStoragePublicDirectory(
                    ExternalPath.DIRECTORY_DOWNLOADS);

                final pdfPartList =
                    viewMagazineScreenController.pdfurl.split('/');
                urlPdfName = pdfPartList.last;
                localPdfPath = '$path/$urlPdfName';
                log("localPdfPath  $localPdfPath");
                Get.to(
                  () => ViewMagazinePDFScreen(),
                  arguments: [
                    localPdfPath,
                    viewMagazineScreenController.pdfurl
                  ],
                );
                log("viewMagazineScreenController.localPdfPath $localPdfPath");
              },
              child: const Text('View Magazine')),
        ),
      ],
    );
  }
}
