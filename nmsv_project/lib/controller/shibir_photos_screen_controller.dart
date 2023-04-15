import 'dart:convert';
import 'dart:developer';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../constants/api_url.dart';
import '../model/gallery_screen_model/shibir_photos_list_model.dart';

class ShibirPhotosScreenController extends GetxController {
  // String imageUrl = Get.arguments[0];
  // String index = Get.arguments[1];

  final CarouselController carouselController = CarouselController();
  RxInt currentIndex = 0.obs;
  String galleryId = Get.arguments[0];
  String galleryTitle = Get.arguments[1];

  RxBool isLoading = false.obs;
  RxString successStatus = ''.obs;
  List<GalleryPhotosList> galleryPhotos = [];
  PageController pageController = PageController(initialPage: 0);

  Future<void> getGalleryPhotosListFunction() async {
    isLoading(true);
    String url = "${ApiUrl.galleryPhotoApi}?GalleryID=$galleryId";
    log("getAllListFunction url : $url");
    log("getAllListFunction galleryId : $galleryId");

    try {
      http.Response response = await http.get(Uri.parse(url));

      GalleryPhotosListModel galleryPhotosListModel =
          GalleryPhotosListModel.fromJson(json.decode(response.body));
      // log("response.body : ${response.body}");
      successStatus.value = galleryPhotosListModel.status;
      if (successStatus.value.toLowerCase() == "ok") {
        galleryPhotos.addAll(galleryPhotosListModel.data);
        log("galleryPhotos : $galleryPhotos");
        // log("allGalleryList length : ${allGalleryList.length}");
      } else {
        log('getAllListFunction Else');
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
    getGalleryPhotosListFunction();
    super.onInit();
  }
}
