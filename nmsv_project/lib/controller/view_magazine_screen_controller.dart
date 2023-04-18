import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
// import 'package:file_picker/file_picker.dart';
import 'package:external_path/external_path.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import '../constants/api_url.dart';
import '../model/magazine_view_screen_model/view_magazine_screen_model.dart';

class ViewMagazineScreenController extends GetxController {
  String magazinePdfId = Get.arguments;
  // String pdfFile = Get.arguments[1];
  RxBool isAlertShow = false.obs;

  RxBool isLoading = false.obs;
  RxString successStatus = "".obs;
  RxString viewMagazinePdf = ''.obs;
  String title = "";
  String sadGurudev = "";
  String regularFeature = "";
  String sadhana = "";
  String ayurveda = "";
  String pdfurl = "";
  Future<void> getViewMagazinePdfListFunction() async {
    isLoading(true);
    String url = ApiUrl.magazinePdfDetailsApi;
    log("getViewMagazinePdfListFunction url : $url");
    try {
      Map<String, dynamic> bodyData = {"MagazinepdfID": magazinePdfId};
      http.Response response =
          await http.post(Uri.parse(url), body: jsonEncode(bodyData));
      log('response.body : ${response.body}');
      ViewPdfMagazineModel magazinePdf =
          ViewPdfMagazineModel.fromJson(json.decode(response.body));
      log("response.body : ${response.body}");
      successStatus.value = magazinePdf.status;
      if (successStatus.value.toLowerCase() == "ok") {
        viewMagazinePdf.value = magazinePdf.data.imageurl;
        title = magazinePdf.data.archiveTitle;
        sadGurudev = magazinePdf.data.sadGurudev;
        regularFeature = magazinePdf.data.regularFeature;
        sadhana = magazinePdf.data.sadhana;
        ayurveda = magazinePdf.data.ayurveda;
        pdfurl = magazinePdf.data.pdfurl;
        log("pdfurl $pdfurl");
      } else {
        log('getViewMagazinePdfListFunction Else');
      }
    } catch (e) {
      log('getViewMagazinePdfListFunction Error :$e');
      rethrow;
    }
    isLoading(false);
  }
  // getPdfFromFile() async {
  //   FilePickerResult? result = await FilePicker.platform.pickFiles();
  //   log('result : $result');
  //   if (result != null) {
  //     File file = File(result.files.single.path!);
  //   }
  // }

  @override
  void onInit() {
    initMethod();
    super.onInit();
  }

  initMethod() async {
    log('magazinePdfId :$magazinePdfId');
    await getViewMagazinePdfListFunction();
  }
}
