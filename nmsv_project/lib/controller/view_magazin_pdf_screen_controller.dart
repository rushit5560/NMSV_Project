import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:get/get.dart';

class ViewMagazinePdfScreenController extends GetxController {
  RxBool download = true.obs;
  bool fileExist = false;
  RxBool isLoading = false.obs;
  final localPdfPath = ''.obs;
  final viewPdf = ''.obs;

  RxInt counter = 0.obs;

  @override
  void onInit() async {
    if (Get.arguments != null) {
      localPdfPath.value = Get.arguments[0];
      viewPdf.value = Get.arguments[1];
    }
    await pdfView();
    super.onInit();
  }

  pdfView() async {
    final pdfPath = File(localPdfPath.value);
    if (pdfPath.existsSync()) {
      isLoading(true);
      fileExist = true;
      download.value = false;
      isLoading(false);
    } else {
      try {
        // FileDownloader.downloadFile(
        //   url: viewPdf.value,
        //   onProgress: (fileName, progress) {
        //     counter.value = int.parse(progress.toString());
        //     log("counter.value ${counter.value}");
        //     isLoading(true);
        //     download.value = true;
        //     log("Count $progress");
        //     isLoading(false);
        //     log("Dowanoad compited");
        //   },
        // );

        await Dio().download(
          viewPdf.value,
          localPdfPath.value,
          onReceiveProgress: (count, total) {
            counter.value = int.parse(count.toString());
            log("counter.value ${counter.value}");
            isLoading(true);
            download.value = true;
            log("Count $count");
            isLoading(false);
            log("Dowanoad compited");
          },
        );
        isLoading(true);
        fileExist = true;
        download.value = false;
        isLoading(false);
      } catch (e) {
        isLoading(true);
        download.value = false;
        fileExist = false;
        isLoading(false);
      }
    }
  }
}
