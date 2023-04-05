import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:nmsv_project/constants/api_url.dart';
import 'package:nmsv_project/model/guruvani_screen_model/guruvani_list_model.dart';

class GuruvaniListScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxString successStatus = ''.obs;
  TextEditingController gSearchbarController =
      TextEditingController();
  List<GuruvaniListData> gurudevAllList = [];
  List<GuruvaniListData> searchGuruvaniList = [];

  Future<void> GurudevListFunction() async {
    isLoading(true);
    String url = "${ApiUrl.guruvaniList}?type=guruvani&order=asc";
    log("GurudevListFunction url : $url");

    try {
      http.Response response = await http.get(Uri.parse(url));

      GuruvaniListModel guruvaniListModel =
          GuruvaniListModel.fromJson(json.decode(response.body));
      // log("response.body : ${response.body}");

      successStatus.value = guruvaniListModel.status;
      if (successStatus.value.toLowerCase() == "ok") {
        gurudevAllList.addAll(guruvaniListModel.data);
        searchGuruvaniList = gurudevAllList;
        log("searchGuruvaniList : $searchGuruvaniList");
        // log("allGalleryList length : ${allGalleryList.length}");
      } else {
        log('GurudevListFunction Else');
      }
    } catch (e) {
      log('GurudevListFunction Error :$e');
      rethrow;
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    GurudevListFunction();
    super.onInit();
  }

  loadUI() {
    isLoading(true);
    isLoading(false);
  }
}
