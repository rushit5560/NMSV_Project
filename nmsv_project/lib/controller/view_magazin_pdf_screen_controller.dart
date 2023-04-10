import 'dart:developer';

import 'package:external_path/external_path.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:get/get.dart';

class ViewMagazinePdfScreenController extends GetxController {
  String viewPdf = Get.arguments;

  RxBool isLoading = false.obs;

  String urlPdfName = "";
  String localPdfPath = "";

  @override
  void onInit() {
    initMethod();
    super.onInit();
  }

  Future<void> initMethod() async {
    isLoading(true);
    log('Pdf Url : $viewPdf');

    List<String> pdfPartList = viewPdf.split("/");

    for (int i = 0; i < pdfPartList.length; i++) {
      urlPdfName = pdfPartList[i];
    }

    String downloadPath = await getDownloadDirectoryPath();
    localPdfPath = "$downloadPath/$urlPdfName";
    log('localPdfPath : $localPdfPath');
    downLoadFileFunction();
    isLoading(false);
  }

  Future<String> getDownloadDirectoryPath() async {
    String path = await ExternalPath.getExternalStoragePublicDirectory(
        ExternalPath.DIRECTORY_DOWNLOADS);

    return path;
  }

  downLoadFileFunction() {
    FileDownloader.downloadFile(
      url: viewPdf,
      onProgress: (name, progress) {
        log('Progress');
        log('viewPdf  $viewPdf');

        // if (guruvaniPlayerScreenController
        //         .onProgressing.value ==
        //     false) {
        //   log("guruvaniPlayerScreenController .onProgressing.value 11 : ${guruvaniPlayerScreenController.onProgressing.value}");

        //   CustomAlertDialog2().showAlertDialog(
        //       context: context, text: 'Dowanloading...');
        //   guruvaniPlayerScreenController
        //       .onProgressing.value = true;
        // }
      },
      onDownloadCompleted: (val) {
        log('Download Done');
        // if (guruvaniPlayerScreenController
        //         .onProgressing.value ==
        //     true) {
        //   log("guruvaniPlayerScreenController .onProgressing.value 22: ${guruvaniPlayerScreenController.onProgressing.value}");

        //   Get.back();
        //   CustomAlertDialog1().showAlertDialog(
        //     context: context,
        //     text: 'Dowanload successfully...',
        //     onYesTap: () {
        //       Get.back();
        //     },
        //   );
        //   guruvaniPlayerScreenController
        //       .onProgressing.value = false;
        // }
      },
    );
  }
}
