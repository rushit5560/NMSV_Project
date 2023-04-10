import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nmsv_project/common_widgets/custom_loader.dart';
import 'package:nmsv_project/controller/view_magazin_pdf_screen_controller.dart';
// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../common_widgets/custom_appbar.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class ViewMagazinePDFScreen extends StatelessWidget {
  ViewMagazinePDFScreen({Key? key}) : super(key: key);
  final viewMagazineScreenController =
      Get.put(ViewMagazinePdfScreenController());
  @override
  Widget build(BuildContext context) {
    log("viewMagazineScreenController.viewPdf: ${viewMagazineScreenController.viewPdf}");
    return Scaffold(
      appBar: customAppBar(
          titleText: " View Magazine", leadingShow: false, actionShow: false),
      body: Obx(
        () => viewMagazineScreenController.isLoading.value
            ? const CustomLoader()
            : PDFView(
                filePath: viewMagazineScreenController.viewPdf,
              ),
        // SfPdfViewer.file(
        //     File(viewMagazineScreenController.localPdfPath),
        //     password: "omtec#nmsv",

        //   ),
      ),
    );
  }
}
