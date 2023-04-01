import 'dart:convert';
import 'dart:developer';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:nmsv_project/constants/api_url.dart';
import 'package:nmsv_project/model/home_screen_model/get_banner_list_model.dart';

class HomoScreenController extends GetxController {
  final CarouselController carouselController = CarouselController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  RxBool isLoading = false.obs;

  RxInt currentIndex = 0.obs;

  ApiHeader apiHeader = ApiHeader();
  List<GetBannerList> getBannerList = [];

  List<String> announcementOfferList = [
    "https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T1/images/I/91QkiVdLMKL._SL1500_.jpg",
    "https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T1/images/I/81NI3j6WsNL._SL1500_.jpg",
  ];

  Future<void> getBannerListFunction() async {
    isLoading(true);
    String url = "https://narayanmantrasadhanavigyan.org/api/BannerList";
    log('getBannerListFunction Api Url : $url');

    try {
      Map<String, String> headerData = <String, String>{
        "Authorization-Token": "nmsvtoken"
      };
      http.Response response =
          await http.get(Uri.parse(url), headers: headerData);
      log('Response : ${response.body}');
      log('headerData : $headerData');

      // GetBannerListModel getBannerListModel =
      //     GetBannerListModel.fromJson(json.decode(response.body));
    } catch (e) {
      log("getBannerListFunction Error :$e");
      rethrow;
    }
  }

  // Future<void> getBannerListFunction() async {
  //   isLoading(true);

  //   String url = "https://narayanmantrasadhanavigyan.org/api/BannerList";
  //   log("getBannerListFunction url : $url");
  //   try {
  //     var request = http.MultipartRequest('GET', Uri.parse(url));
  //     request.headers["Authorization-Token"] = "nmsvtoken";
  //     log("getBannerListFunction request.headers: ${request.headers}");
  //     var response = await request.send();

  //     response.stream.transform(utf8.decoder).listen((value) {
  //       log('getBannerListFunction response: $value');

  //       GetBannerListModel getBannerListModel =
  //           GetBannerListModel.fromJson(json.decode(value));

  //       log("getBannerListModel $getBannerListModel");

  //       if (response.statusCode == 200) {
  //         log("message");
  //         getBannerList.addAll(getBannerListModel.data);
  //         log("getBannerListFunction getbannerlist: $getBannerList");
  //       } else {
  //         log("error");
  //       }
  //     });

  //   } catch (e) {
  //     log("getBannerListFunction error: $e");
  //     rethrow;
  //   } finally {
  //     isLoading(false);
  //   }
  // }

  @override
  void onInit() {
    initMethod();
    super.onInit();
  }

  initMethod() async {
    await getBannerListFunction();
  }
}
