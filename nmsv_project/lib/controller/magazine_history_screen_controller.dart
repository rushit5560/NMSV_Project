import 'dart:developer';

import 'package:get/get.dart';
import 'package:nmsv_project/constants/api_url.dart';
import 'package:http/http.dart' as http;
class MagazineHistoryScreenController extends GetxController {
  RxBool isLoading = false.obs;

  Future<void> getMagazineHistoryFunction() async {
    isLoading(true);
    String url = ApiUrl.magazineHistoryApi;
    log('getMagazineHistoryFunction Api Url : $url');

    try {
      Map<String, String> bodyData = {
        "UserID": "9287"
      };
      http.Response response = await http.post(Uri.parse(url), body: bodyData);
      log('response :${response.body}');
    } catch(e) {
      log('getMagazineHistoryFunction Error :$e');
      rethrow;
    }

    isLoading(false);

  }

  @override
  void onInit() {
    initMethod();
    super.onInit();
  }


  Future<void> initMethod() async {
    await getMagazineHistoryFunction();
  }

}