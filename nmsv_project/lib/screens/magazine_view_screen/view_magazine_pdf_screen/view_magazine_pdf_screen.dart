import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nmsv_project/common_widgets/custom_loader.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../common_widgets/custom_appbar.dart';
import '../../../controller/view_magazine_screen_controller.dart';

class ViewMagazinePDFScreen extends StatelessWidget {
   const ViewMagazinePDFScreen({Key? key}) : super(key: key);
//final viewMagazineScreenController = Get.find<ViewMagazineScreenController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          titleText: " View Magazine",
          leadingShow: false,
          actionShow: false),
      body: SfPdfViewer.network("https://narayanmantrasadhanavigyan.org/assets/uploads/magazine_pdf/pdf/april_2023.pdf"));
  }
}
