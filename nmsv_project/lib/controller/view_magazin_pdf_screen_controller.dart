// // // import 'dart:developer';
// // // import 'dart:io';
// // // import 'dart:typed_data';
// // // // import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
// // // import 'package:external_path/external_path.dart';
// // // import 'package:flutter_file_downloader/flutter_file_downloader.dart';
// // // import 'package:fluttertoast/fluttertoast.dart';
// // // import 'package:get/get.dart';
// // // // import 'package:http/http.dart' as http;
// // // import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
// // //
// // // import '../screens/Bhajan_screen/Bhajan_player_screen/Bhajan_player_screen_widgets.dart';
// // // // import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
// // //
// // // class ViewMagazinePdfScreenController extends GetxController {
// // //   String viewPdf = Get.arguments;
// // //
// // //   RxBool isLoading = false.obs;
// // //   RxBool isDownloadingStart = false.obs;
// // //
// // //   String urlPdfName = "";
// // //   String localPdfPath = "";
// // //   String path = '';
// // //   RxBool isPdfExists = false.obs;
// // //   Uint8List? documentBytes;
// // //   // late PDFDocument doc;
// // //
// // //   // UserDetails userDetails = UserDetails();
// // //   @override
// // //   void onInit() {
// // //     initMethod();
// // //     super.onInit();
// // //   }
// // //
// // //   Future<void> initMethod() async {
// // //     isLoading(true);
// // //
// // //     log('Pdf Url : $viewPdf');
// // //
// // //     List<String> pdfPartList = viewPdf.split("/");
// // //
// // //     for (int i = 0; i < pdfPartList.length; i++) {
// // //       urlPdfName = pdfPartList[i];
// // //     }
// // //     log("urlPdfName $urlPdfName");
// // //
// // //     String downloadPath = await getDownloadDirectoryPath();
// // //     localPdfPath = "$downloadPath/$urlPdfName";
// // //     log('localPdfPath : $localPdfPath');
// // //
// // //     File file = File(localPdfPath);
// // //     log("downloadPath $localPdfPath");
// // //
// // //     if (await file.exists()) {
// // //       log("file 11 ");
// // //       // isPdfExists.value = true;
// // //       localPdfPath = "$downloadPath/$urlPdfName";
// // //       // SfPdfViewer.file(
// // //       //   File(localPdfPath),
// // //       //   password: "omtec#nmsv",
// // //       //   // onDocumentLoaded: (val) {
// // //       //   //   return "";
// // //       //   // },
// // //       //
// // //       // );
// // //       log('localPdfPath : ${localPdfPath}');
// // //
// // //       // File file  = File(localPdfPath);
// // //       // doc = await PDFDocument.fromFile(file);
// // //
// // //       isLoading(false);
// // //
// // //       log("file 33 ");
// // //     } else {
// // //       log("dowanload file 2222");
// // //       isPdfExists.value = false;
// // //       downLoadFileFunction();
// // //     }
// // //
// // //   }
// // //
// // //   // void getPdfBytes() async {
// // //   //   documentBytes = await http.readBytes(Uri.parse(localPdfPath));
// // //   // }
// // //
// // //   Future<String> getDownloadDirectoryPath() async {
// // //     path = await ExternalPath.getExternalStoragePublicDirectory(
// // //         ExternalPath.DIRECTORY_DOWNLOADS);
// // //     log("path $path");
// // //
// // //     return path;
// // //   }
// // //
// // //   downLoadFileFunction() {
// // //     FileDownloader.downloadFile(
// // //       url: viewPdf,
// // //       onProgress: (name, progress) {
// // //         log('Progress : $progress');
// // //         log('viewPdf  $viewPdf');
// // //         if(isDownloadingStart.value == false) {
// // //           CustomAlertDialog2().showAlertDialog(
// // //               context: Get.context!, text: 'Downloading... ');
// // //           isDownloadingStart.value = true;
// // //           isLoading(true);
// // //           isLoading(false);
// // //         }
// // //       },
// // //       onDownloadError: (val) {
// // //         log("Download Failed! Please try again");
// // //         Get.back();
// // //         Fluttertoast.showToast(msg: "Download Failed! Please try again");
// // //       },
// // //       onDownloadCompleted: (val) async {
// // //         Get.back();
// // //         isDownloadingStart.value = false;
// // //         log('Download Done');
// // //
// // //         List<String> pdfPartList = viewPdf.split("/");
// // //
// // //         for (int i = 0; i < pdfPartList.length; i++) {
// // //           urlPdfName = pdfPartList[i];
// // //         }
// // //         log("urlPdfName $urlPdfName");
// // //
// // //         String downloadPath = await getDownloadDirectoryPath();
// // //         localPdfPath = "$downloadPath/$urlPdfName";
// // //         // documentBytes = await http.readBytes(Uri.parse(localPdfPath));
// // //         isLoading(false);
// // //         // UserPreference().setStringValueInPrefs(
// // //         //   key: UserPreference.pdfviewKey,
// // //         //   value: viewPdf,
// // //         // );
// // //         // log("key ${UserPreference.pdfviewKey}");
// // //         // log("value ${viewPdf}");
// // //       },
// // //     );
// // //   }
// // // }
// // import 'dart:developer';
// // import 'dart:io';

// // import 'package:dio/dio.dart';
// // import 'package:external_path/external_path.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter/services.dart';
// // import 'package:flutter_file_downloader/flutter_file_downloader.dart';
// // import 'package:fluttertoast/fluttertoast.dart';
// // import 'package:get/get.dart';
// // import 'package:nmsv_project/screens/guruvani_scrren/guruvani_player_list_screen/guruvani_player_list_screen_widgets.dart';
// // import 'package:open_file_plus/open_file_plus.dart';
// // import 'package:path_provider/path_provider.dart';
// // // import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

// // class ViewMagazinePdfScreenController extends GetxController {
// //   RxBool onProcessing = false.obs;
// //   bool fileExist = false;
// //   RxBool isLoading = false.obs;
// //   // final viewPdf = Get.arguments;
// //   final localPdfPath = Get.arguments[0];
// //   final viewPdf = Get.arguments[1];

// //   RxBool onProgressing = false.obs;
// //   RxDouble progress = 0.0.obs;

// //   // get pdfPath => null;/

// //   // @override
// //   // void onInit() async {
// //   //   log("onInit localPdfPath $localPdfPath");
// //   //   log("onInit viewPdf $viewPdf");
// //   //   if(Get.arguments!= null){
// //   //     localPdfPath.value = Get.arguments[0];
// //   //     viewPdf.value = Get.arguments[1];
// //   //   }
// //   //   // await pdfView();
// //   //   super.onInit();
// //   // }

// //   downloadPdf(String pdfUrl) async {
// //     final pdfPath = File(await getLocalPath() + "/magazine.pdf");
// //     localPdfPath.value = pdfPath.path;

// //     if (await pdfPath.exists()) {
// //       fileExist = true;
// //       isLoading.value = false;
// //     } else {
// //       try {
// //         isLoading.value = true;

// //         await Dio().download(pdfUrl, localPdfPath.value,
// //             onReceiveProgress: (count, total) {
// //           progress.value = count / total;
// //         });

// //         fileExist = true;
// //         isLoading.value = false;
// //       } catch (e) {
// //         isLoading.value = false;
// //         fileExist = false;
// //       }
// //     }
// //   }

// //   Future<String> getLocalPath() async {
// //     final directory = await getApplicationDocumentsDirectory();
// //     return directory.path;
// //   }

// //   // pdfView() async {
// //   //   final pdfPath = File(localPdfPath);
// //   //   if (pdfPath.existsSync()) {
// //   //     isLoading(true);
// //   //     log("pdfPath $pdfPath");
// //   //     log("exist file 11");
// //   //     // OpenFile.open(pdfPath.toString());
// //   //     fileExist = true;

// //   //     isLoading(false);

// //   //     log("exist file 22");
// //   //   } else {
// //   //     log("dowanload");

// //   //     try {
// //   //       log("try");
// //   //       await Dio().download(viewPdf, localPdfPath,
// //   //           onReceiveProgress: (count, total) {
// //   //         log("downLoadFileFunction 1");

// //   //         log("viewPdf $viewPdf");
// //   //         log("download path  $localPdfPath");
// //   //         log("count $count");

// //   //         isLoading(true);
// //   //         progress = (count / total);
// //   //         log("progres $progress");
// //   //         isLoading(false);
// //   //         log("downLoadFileFunction 2");
// //   //       });
// //   //       isLoading(true);
// //   //       log("downLoadFileFunction 3");

// //   //       onProcessing.value = false;
// //   //       fileExist = true;
// //   //       log("downLoadFileFunction 4");

// //   //       isLoading(false);
// //   //     } catch (e) {
// //   //       log("catch");
// //   //       log("catch $e");
// //   //       isLoading(true);

// //   //       onProcessing.value = false;
// //   //       isLoading(false);
// //   //     }

// //   //     // FileDownloader.downloadFile(
// //   //     //   url: viewPdf,
// //   //     //   onProgress: (fileName, progress) {
// //   //     //     const AlertDialog(
// //   //     //       title: Text("Dowanloading..."),
// //   //     //     );
// //   //     //     onProgressing.value == true;
// //   //     //   },
// //   //     //   onDownloadCompleted: (val) {
// //   //     //     Get.back();
// //   //     //     const AlertDialog(
// //   //     //       title: Text("Dowanload successfully..."),
// //   //     //     );
// //   //     //     onProgressing.value == false;
// //   //     //   },
// //   //     // );
// //   //   }
// //   // }

// // //  Future<void> downLoadFileFunction() async {
// //   // path = await getPath();

// // //   final isLoading = false.obs;
// // //   final isDownloadingStart = false.obs;

// // //   late String urlPdfName;
// // //   late String localPdfPath;
// // //   late String path;
// // //   final isPdfExists = false.obs;
// // //   Uint8List? documentBytes;
// // //   bool dowanload = false;
// // //   bool fileExist = false;
// // //   double progress = 0;

// // //   @override
// // //   void onInit() {
// // //     super.onInit();
// // //     log('COntroller viewPdf111 : $viewPdf');
// // //     // getPath();
// // //   }

// // //   // initMethod() async {
// // //   //   isLoading(true);

// // //   //   log('Pdf Url : $viewPdf');

// // //   //   final pdfPartList = viewPdf.split('/');

// // //   //   urlPdfName = pdfPartList.last;
// // //   //   log('urlPdfName $urlPdfName');

// // //   //   final downloadPath = await getDownloadDirectoryPath();
// // //   //   localPdfPath = '$downloadPath/$urlPdfName';
// // //   //   log('localPdfPath : $localPdfPath');

// // //   //   final path = File(localPdfPath);
// // //   //   log('downloadPath $localPdfPath');

// // //   //   if (await path.exists()) {
// // //   //     // isLoading(false);
// // //   //     // isPdfExists.value = true;
// // //   //     log("openFile 1");
// // //   //     openFile();
// // //   //     log("openFile 2");

// // //   //     return path.path;
// // //   //   } else {
// // //   //     // path.create();
// // //   //     // return path.path;
// // //   //     log("downLoadFileFunction 2");

// // //   //     downLoadFileFunction();
// // //   //     log("downLoadFileFunction 2");
// // //   //   }
// // //   // }

// // //   Future<String> getDownloadDirectoryPath() async {
// // //     path = await ExternalPath.getExternalStoragePublicDirectory(
// // //         ExternalPath.DIRECTORY_DOWNLOADS);
// // //     log('path $path');
// // //     return path;
// // //   }

// // //   openFile() {
// // //     log("openFile 1");
// // //     OpenFile.open(viewPdf);
// // //     log("openFile 2");
// // //   }

// // // // /storage/emulated/0/Download/abcxyz.pdf
// // //   getPath() async {
// // //     final downloadPath = await getDownloadDirectoryPath();
// // //     final pdfPartList = viewPdf.split('/');
// // //     urlPdfName = pdfPartList.last;
// // //     localPdfPath = '$downloadPath/$urlPdfName';
// // //     log("pdfPartList $pdfPartList");
// // //     log("downloadPath $downloadPath");
// // //     log("urlPdfName $urlPdfName");
// // //     log("path 11 $localPdfPath");

// // //     final path = File(localPdfPath);
// // //     if (await path.exists()) {
// // //       OpenFile.open(
// // //         path.path,
// // //         // '/storage/emulated/0/Download/abcxyz.pdf'
// // //       );

// // //       // SfPdfViewer.file(path,
// // //       // password: "nmsv",

// // //       // );
// // //       // return path.path;
// // //     } else {
// // //       // path.create();
// // //       await downLoadFileFunction();
// // //       // return path.path;
// // //     }
// // //   }

// //   // FileDownloader.downloadFile(
// //   //   url: viewPdf,
// //   //   onProgress: (name, progress) {
// //   //     log('Progress : $progress');
// //   //     log('viewPdf  $viewPdf');
// //   //     if (!isDownloadingStart.value) {
// //   //       CustomAlertDialog2().showAlertDialog(
// //   //         context: Get.context!,
// //   //         text: 'Downloading... $progress',
// //   //       );
// //   //       isDownloadingStart(true);
// //   //     }
// //   //   },
// //   //   onDownloadError: (val) {
// //   //     log('Download Failed! Please try again');
// //   //     Get.back();
// //   //     Fluttertoast.showToast(msg: 'Download Failed! Please try again');
// //   //   },
// //   //   onDownloadCompleted: (val) async {
// //   //     Get.back();
// //   //     isDownloadingStart(false);
// //   //     log('Download Done');

// //   //     final pdfPartList = viewPdf.split('/');

// //   //     urlPdfName = pdfPartList.last;
// //   //     log('urlPdfName $urlPdfName');

// //   //     final downloadPath = await getDownloadDirectoryPath();
// //   //     localPdfPath = '$downloadPath/$urlPdfName';
// //   //     // documentBytes = await http.readBytes(Uri.parse(localPdfPath));
// //   //     isLoading(false);
// //   //   },
// //   // );
// // //   }
// // }

// import 'dart:async';
// import 'dart:developer';
// import 'dart:io';

// import 'package:dio/dio.dart';
// import 'package:external_path/external_path.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter_file_downloader/flutter_file_downloader.dart';
// import 'package:get/get.dart';
// import 'package:path_provider/path_provider.dart';

// class ViewMagazinePdfScreenController extends GetxController {
//   RxBool download = true.obs;
//   bool fileExist = false;
//   RxBool isLoading = false.obs;
//   final localPdfPath = ''.obs;
//   final viewPdf = ''.obs;
//   RxInt countVal = 0.obs;

//   @override
//   void onInit() async {
//     if (Get.arguments != null) {
//       // localPdfPath.value = Get.arguments[0];
//       viewPdf.value = Get.arguments[0];
//     }
//     await pdfView();
//     super.onInit();
//   }

  

//   pdfView() async {
//     File pdfPath = File(localPdfPath.value);

//     if (pdfPath.existsSync()) {
//       log("localPdfPath.value ${localPdfPath.value}");
//       isLoading(true);
//       fileExist = true;
//       download.value = false;
//       isLoading(false);
//     } else {
//       try {
//         await FileDownloader.downloadFile(
//           url: viewPdf.value,
//           onProgress: (fileName, progress) {
//             countVal.value = progress.toInt();
//             log("countVal.value ${countVal.value}");
//             isLoading(true);
//             download.value = true;
//             isLoading(false);
//           },
//         );

//         // Dio().download(
//         //   viewPdf.value,
//         //   localPdfPath.value,
//         //   onReceiveProgress: (count, total) {
//         //     countVal.value = count;
//         //     log("countVal.value ${countVal.value}");

//         //     isLoading(true);
//         //     download.value = true;
//         //     log("Count $count");
//         //     isLoading(false);
//         //     log("Dowanoad compited");
//         //   },
//         // );
//         isLoading(true);
//         fileExist = true;
//         download.value = false;
//         isLoading(false);
//       } catch (e) {
//         isLoading(true);
//         download.value = false;
//         fileExist = false;
//         isLoading(false);
//       }
//     }
//   }
// }



// // import 'dart:developer';
// // import 'dart:io';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_pdfview/flutter_pdfview.dart';
// // import 'package:get/get.dart';
// // import 'package:path_provider/path_provider.dart';
// // import 'package:http/http.dart' as http;

// // class PdfController extends GetxController {
// //   String pdfUrl = "https://example.com/sample.pdf";
// //   Rx<File?> pdfFile = Rx<File?>(null);
// //   RxBool isDownloading = RxBool(false);

// //   Future<void> downloadPdf() async {
// //     isDownloading.value = true;
// //     final response = await http.get(Uri.parse(pdfUrl));
// //     final dir = await getApplicationDocumentsDirectory();
// //     final file = File("${dir.path}/sample.pdf");
// //     await file.writeAsBytes(response.bodyBytes);
// //     pdfFile.value = file;
// //     isDownloading.value = false;
// //   }

// //   Future<void> viewPdf() async {
// //     log("1");
// //     if (pdfFile.value != null) {
// //       final filePath = pdfFile.value!.path;
// //       if (await File(filePath).exists()) {
// //         log("filePath $filePath");
// //         Get.to(() => PdfViewerPage(filePath: filePath));
// //       }
// //     }
// //   }
// // }

// // class PdfViewerPage extends StatelessWidget {
// //   final String filePath;

// //   const PdfViewerPage({Key? key, required this.filePath}) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text("PDF Viewer")),
// //       body: Center(
// //         child: PDFView(
// //           filePath: filePath,
// //           enableSwipe: true,
// //           swipeHorizontal: true,
// //         ),
// //       ),
// //     );
// //   }
// // }