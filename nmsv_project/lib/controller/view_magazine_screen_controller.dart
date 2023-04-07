import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import '../constants/api_url.dart';
import '../model/magazine_view_screen_model/view_magazine_screen_model.dart';

class ViewMagazineScreenController extends GetxController {
  String magazinePdfId = Get.arguments;
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
      } else {
        log('getViewMagazinePdfListFunction Else');
      }
    } catch (e) {
      log('getViewMagazinePdfListFunction Error :$e');
      rethrow;
    }
    isLoading(false);
  }

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
