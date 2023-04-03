import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:nmsv_project/constants/api_url.dart';
import '../model/gallery_screen_model/gallery_list_model.dart';

class GalleryScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxString successStatus = ''.obs;
  TextEditingController gallerySearchbarController = TextEditingController();
  List<GalleryList> allGalleryList = [];

  Future<void> getAllListFunction() async {
    isLoading(true);
    String url = ApiUrl.galleryList;
    log("getAllListFunction url : $url");

    try {
      http.Response response = await http.get(Uri.parse(url));

      GalleryListModel galleryListModel =
          GalleryListModel.fromJson(json.decode(response.body));
      // log("response.body : ${response.body}");

      successStatus.value=galleryListModel.status;
      if (successStatus.value == "ok") {
        allGalleryList.addAll(galleryListModel.data);
        log("allGalleryList : $allGalleryList");
        log("allGalleryList length : ${allGalleryList.length}");
      } else {
        log('getSadhanaFunction Else');
      }
    } catch (e) {
      log('getAllListFunction Error :$e');
      rethrow;
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    getAllListFunction();
    super.onInit();
  }
}
