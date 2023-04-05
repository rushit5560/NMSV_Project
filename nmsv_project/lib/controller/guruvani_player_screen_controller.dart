import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nmsv_project/constants/api_url.dart';
import 'package:http/http.dart' as http;
import 'package:nmsv_project/model/bhajan_screen_model/bhajan_player_list_model.dart';
import 'package:nmsv_project/model/guruvani_screen_model/guruvani_player_model.dart';

class GuruvaniPlayerScreenController extends GetxController {
  String guruvaniPlayerId = Get.arguments;
  RxString successStatus = ''.obs;

  RxBool isLoading = false.obs;
  TextEditingController searchController = TextEditingController();
  List<Guruvani> guruvaniplayerList = [];
  List<Guruvani> serchGuruvaniplayerList = [];

  Future<void> getGuruvaniPlayerList() async {
    isLoading(true);

    String url =
        "${ApiUrl.guruvaniPlayerApi}/?type=guruvani&ID=/?type=bhajan&ID=$guruvaniPlayerId";
    log("getGuruvaniPlayerList url: $url");
    log("getGuruvaniPlayerList guruvaniPlayerId: $guruvaniPlayerId");

    try {
      http.Response response = await http.get(Uri.parse(url));
      GuruvaniPlayerModel guruvaniPlayerModel =
          GuruvaniPlayerModel.fromJson(json.decode(response.body));
      successStatus.value = guruvaniPlayerModel.status;
      if (successStatus.value.toLowerCase() == "ok") {
        guruvaniplayerList.addAll(guruvaniPlayerModel.data.guruvanis);
        serchGuruvaniplayerList = guruvaniplayerList;
        log("guruvaniplayerList $guruvaniplayerList");
      } else {
        log("getGuruvaniPlayerList error");
      }
    } catch (e) {
      rethrow;
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    getGuruvaniPlayerList();
    super.onInit();
  }
}
// https://narayanmantrasadhanavigyan.org/api2/SingleMedia/?type=bhajan&ID=14