import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nmsv_project/constants/api_url.dart';
import 'package:http/http.dart' as http;
import 'package:nmsv_project/model/bhajan_screen_model/bhajan_list_model.dart';

class BhajanListScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxString successStatus = ''.obs;

  TextEditingController searchbarController = TextEditingController();

  List<BhajanListData> allBhajanList = [];
  List<BhajanListData> searchBhajanDataList = [];

  Future<void> getAllBhajanListFunction() async {
    isLoading(true);
    String url = "${ApiUrl.getBhajanListApi}?type=bhajan&order=asc";
    log("getAllBhajanListFunction url : $url");

    try {
      http.Response response = await http.get(Uri.parse(url));

      BhajanListModel bhajanListModel =
          BhajanListModel.fromJson(json.decode(response.body));
      // log("response.body : ${response.body}");

      successStatus.value = bhajanListModel.status;
      if (successStatus.value == "ok") {
        allBhajanList.addAll(bhajanListModel.data);
        searchBhajanDataList = allBhajanList;
        log("getAllBhajanListFunction : $allBhajanList");

        log("getAllBhajanListFunction : $searchBhajanDataList");
        // log("allGalleryList length : ${allGalleryList.length}");
      } else {
        log('getAllBhajanListFunction Else');
      }
    } catch (e) {
      log('getAllBhajanListFunction Error :$e');
      rethrow;
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    initMethod();
    super.onInit();
  }

  Future<void> initMethod() async {
    await getAllBhajanListFunction();
  }
}
