// import 'dart:async';
// import 'dart:developer';
// import 'dart:io';
//
// import 'package:flutter/material.dart';
// // import 'package:flutter_pdfview/flutter_pdfview.dart';
// import 'package:nmsv_project/common_widgets/custom_appbar.dart';
// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
//
// import '../../../constants/color.dart';
// // import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
// // import 'package:pdf_viewer_plugin/pdf_viewer_plugin.dart';
//
// class PDFScreen extends StatefulWidget {
//   final String? path;
//
//   const PDFScreen({Key? key, this.path}) : super(key: key);
//
//   _PDFScreenState createState() => _PDFScreenState();
// }
//
// class _PDFScreenState extends State<PDFScreen> with WidgetsBindingObserver {
//   // final Completer<PDFViewController> _controller =
//   //     Completer<PDFViewController>();
//   int? pages = 1;
//   int? currentPage = 1;
//   int? totalPage = 0;
//
//   bool isReady = false;
//   String errorMessage = '';
//   @override
//   void initState() {
//     log("path ${widget.path}");
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     log("path ${widget.path}");
//     return Scaffold(
//       appBar: customAppBar(
//         titleText: "Magazine Subscription",
//         leadingShow: false,
//         actionShow: false,
//       ),
//       body: SfPdfViewer.file(
//
//       File(widget.path.toString())
//       ,password: "omtec#nmsv")
//
//
//       // Stack(
//       //   children: <Widget>[
//       //     PDFView(
//       //       filePath: widget.path,
//       //       enableSwipe: true,
//       //       swipeHorizontal: true,
//       //       password: "omtec#nmsv",
//       //       autoSpacing: false,
//       //       pageFling: true,
//       //       pageSnap: true,
//       //       defaultPage: currentPage!,
//       //       fitPolicy: FitPolicy.BOTH,
//       //       preventLinkNavigation:
//       //           false, // if set to true the link is handled in flutter
//       //       onRender: (pages) {
//       //         setState(() {
//       //           pages = pages;
//       //           isReady = true;
//       //         });
//       //       },
//       //       onError: (error) {
//       //         setState(() {
//       //           errorMessage = error.toString();
//       //         });
//       //         log(error.toString());
//       //       },
//       //       onPageError: (page, error) {
//       //         setState(() {
//       //           errorMessage = '$page: ${error.toString()}';
//       //         });
//       //         log('$page: ${error.toString()}');
//       //       },
//       //       onViewCreated: (PDFViewController pdfViewController) {
//       //         _controller.complete(pdfViewController);
//       //       },
//       //       onLinkHandler: (String? uri) {
//       //         log('goto uri: $uri');
//       //       },
//       //       onPageChanged: (int? page, int? total) {
//       //         log('page change: $page/$total');
//       //         totalPage = total;
//       //         log("totalPage $totalPage");
//
//       //         setState(() {
//       //           currentPage = page;
//       //         });
//       //       },
//       //     ),
//       //     errorMessage.isEmpty
//       //         ? !isReady
//       //             ? const Center(
//       //                 child: CircularProgressIndicator(),
//       //               )
//       //             : Container()
//       //         : Center(
//       //             child: Text(errorMessage),
//       //           )
//       //   ],
//       // ),
//       // floatingActionButton: FutureBuilder<PDFViewController>(
//       //   future: _controller.future,
//       //   builder: (context, AsyncSnapshot<PDFViewController> snapshot) {
//       //     if (snapshot.hasData) {
//       //       return FloatingActionButton.extended(
//       //         backgroundColor:
//       //             AppColors.appColors, // label: Text("Go to ${pages! ~/ 2}"),
//       //         label: Text("${currentPage.toString()}/$totalPage"),
//       //         onPressed: () async {
//       //           await snapshot.data!.setPage(pages! ~/ 2);
//       //         },
//       //       );
//       //     }
//
//       //     return Container();
//       //   },
//       // ),
//     );
//   }
// }



import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nmsv_project/common_widgets/custom_appbar.dart';
import 'package:nmsv_project/common_widgets/custom_loader.dart';
import 'package:nmsv_project/controller/view_magazin_pdf_screen_controller.dart';
import 'package:sizer/sizer.dart';
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
              log("viewMagazineScreenController.counter.value 11 ${viewMagazineScreenController.counter.value}");
              return
                Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    CustomLoader(),
                    SizedBox(height: 3.h),
                    Obx(()=> Text("${viewMagazineScreenController.counter.value} %")),
                  ],
                ),
              );
            }
          } else {
            log("viewMagazineScreenController.counter.value 22 ${viewMagazineScreenController.counter.value}");

            return  Center(
              // child: Text("Downloading PDF..."),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  CustomLoader(),
                  SizedBox(height: 3.h),
                  Obx(()=> Text("${viewMagazineScreenController.counter.value} %")),
                ],
              ),
            );
          }
        }),
      ),
    );
  }
}