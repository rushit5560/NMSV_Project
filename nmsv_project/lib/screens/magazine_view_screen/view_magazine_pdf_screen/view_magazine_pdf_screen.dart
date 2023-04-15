// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:nmsv_project/common_widgets/custom_appbar.dart';
// import 'package:nmsv_project/controller/view_magazin_pdf_screen_controller.dart';
// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

// class ViewMagazinePDFScreen extends StatefulWidget {
//   final String pdfUrl;
//   const ViewMagazinePDFScreen({Key? key,required this.pdfUrl}) : super(key: key);

//   @override
//   State<ViewMagazinePDFScreen> createState() => _ViewMagazinePDFScreenState();
// }

// class _ViewMagazinePDFScreenState extends State<ViewMagazinePDFScreen> {
//   final viewMagazineScreenController =
//       Get.put(ViewMagazinePdfScreenController());

//       @override
//   void initState() {
//     super.initState();
//     viewMagazineScreenController.downloadPdf(widget.pdfUrl);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//         onWillPop: () async {
//           return true;
//         },
//         child: Scaffold(
//         appBar: customAppBar(
//             titleText: " View Magazine", leadingShow: false, actionShow: false),
//             body: Obx(

//           () => viewMagazineScreenController.isLoading.value
//               ? const Center(child: CircularProgressIndicator())
//               : viewMagazineScreenController.fileExist
//                   ? SfPdfViewer.file(
//                       File(viewMagazineScreenController.localPdfPath.value),
//                       password: "omtec#nmsv",
//                     )
//                   : Container(),
//         ),
//       ),
//         // body: Obx(() {
//         //   if (viewMagazineScreenController.isLoading.value) {
//         //     return const Center(child: CircularProgressIndicator());
//         //   } else if (viewMagazineScreenController.fileExist.value) {
//         //     final localPdfPath =
//         //         viewMagazineScreenController.localPdfPath.value;
//         //     final pdfFile = File(localPdfPath);
//         //     if (pdfFile.existsSync()) {
//         //       return SfPdfViewer.file(
//         //         pdfFile,
//         //         password: "omtec#nmsv",
//         //       );
//         //     } else if(){}
//         //      else {
//         //       return const Center(
//         //         child: Text("Error: File not found"),
//         //       );
//         //     }
//         //   } else {
//         //     return const Center(
//         //       child: Text("Downloading PDF..."),
//         //     );
//         //   }
//         // }),
//     );
//   }
// }
//         // child: Scaffold(
//         //   appBar: customAppBar(
//         //       titleText: " View Magazine",
//         //       leadingShow: false,
//         //       actionShow: false),
//         //   body: 
//         //   //     Container(
//         //   //   child: viewMagazineScreenController.dowanload.value == true
//         //   //       ? SfPdfViewer.file(
//         //   //           File(
//         //   //             viewMagazineScreenController.localPdfPath,
//         //   //           ),
//         //   //           password: "omtec#nmsv",
//         //   //         )
//         //   //       : SfPdfViewer.network(
//         //   //           viewMagazineScreenController.viewPdf,
//         //   //           password: "omtec#nmsv",
//         //   //         ),
//         //   // ),
//         // )
//         // );
//   // }
// // }

import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nmsv_project/common_widgets/custom_appbar.dart';
import 'package:nmsv_project/common_widgets/custom_loader.dart';
import 'package:nmsv_project/controller/view_magazin_pdf_screen_controller.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ViewMagazinePDFScreen extends StatefulWidget {
  const ViewMagazinePDFScreen({Key? key}) : super(key: key);

  @override
  State<ViewMagazinePDFScreen> createState() =>
      _ViewMagazinePDFScreenState();
}

class _ViewMagazinePDFScreenState extends State<ViewMagazinePDFScreen> {
  final viewMagazineScreenController =
      Get.put(ViewMagazinePdfScreenController());
      final pdfController = PdfViewerController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        appBar: customAppBar(
            titleText: " View Magazine", leadingShow: false, actionShow: false),
        
        body: Obx(() {
          if (viewMagazineScreenController.isLoading.isTrue) {
            return const Center(child: 
            CircularProgressIndicator());
          } else if (viewMagazineScreenController.fileExist) {
            final localPdfPath =
                viewMagazineScreenController.localPdfPath.value;
            final pdfFile = File(localPdfPath);
            if (pdfFile.existsSync()) {
              log("view");
              return SfPdfViewer.file(
                pdfFile,
                password: "omtec#nmsv",
              );
            } else {
              return const Center(
                child: Text("Error: File not found"),
              );
            }
          } else {
            return const Center(
              // child: Text("Downloading PDF..."),
              child: CustomLoader(),
            );
          }
        }),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:nmsv_project/controller/view_magazin_pdf_screen_controller.dart';

// class MyHomePage extends StatelessWidget {
//   final PdfController pdfController = Get.put(PdfController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("PDF Demo")),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               child: Text("Download PDF"),
//               onPressed: () {
//                 pdfController.downloadPdf();
//               },
//             ),
//             SizedBox(height: 20),
//             Obx(() {
//               if (pdfController.isDownloading.value) {
//                 return CircularProgressIndicator();
//               } else {
//                 return ElevatedButton(
//                   child: Text("View PDF"),
//                   onPressed: () {
//                     pdfController.viewPdf();
//                   },
//                 );
//               }
//               },
//               ),
//               ],
//               )));}
// }