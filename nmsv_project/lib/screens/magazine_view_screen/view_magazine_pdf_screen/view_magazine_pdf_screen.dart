import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nmsv_project/controller/view_magazin_pdf_screen_controller.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../common_widgets/custom_appbar.dart';

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
      body: SfPdfViewer.network(
        viewMagazineScreenController.viewPdf,
        password: "omtec#nmsv",
      ),
    );
  }
}
