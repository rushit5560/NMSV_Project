import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nmsv_project/constants/api_url.dart';
import 'package:http/http.dart' as http;
import 'package:nmsv_project/model/bhajan_screen_model/bhajan_player_list_model.dart';

class BhajanPlayerScreenController extends GetxController {
  String bhajanId = Get.arguments[0];
  String bhajanTitle = Get.arguments[1];

  RxString successStatus = ''.obs;
  RxBool onProgressing = false.obs;
  RxInt progress = 0.obs;

  RxBool isLoading = false.obs;
  TextEditingController searchController = TextEditingController();
  List<Bhajan> bhajanplayerList = [];
  List<Bhajan> serchBhajanplayerList = [];

  Future<void> getGalleryPlayerList() async {
    isLoading(true);

    String url = "${ApiUrl.galleryPlayerApi}/?type=bhajan&ID=$bhajanId";
    log("getGalleryPlayerList url: $url");
    log("getGalleryPlayerList galleryPlayerId: $bhajanId");

    try {
      http.Response response = await http.get(Uri.parse(url));
      BhajanplayerListModel bhajanplayerListModel =
          BhajanplayerListModel.fromJson(json.decode(response.body));
      successStatus.value = bhajanplayerListModel.status;
      if (successStatus.value.toLowerCase() == "ok") {
        bhajanplayerList.addAll(bhajanplayerListModel.data.bhajans);
        serchBhajanplayerList = bhajanplayerList;
        log("bhajanplayerList $bhajanplayerList");
      } else {
        log("getGalleryPlayerList error");
      }
    } catch (e) {
      rethrow;
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    getGalleryPlayerList();
    super.onInit();
  }
}
// https://narayanmantrasadhanavigyan.org/api2/SingleMedia/?type=bhajan&ID=14