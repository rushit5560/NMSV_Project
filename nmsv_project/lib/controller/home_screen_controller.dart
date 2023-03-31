
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomoScreenController extends GetxController {
  final CarouselController carouselController = CarouselController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  RxBool isLoading = false.obs;

  RxInt currentIndex = 0.obs;

  List<String> announcementOfferList = [
    "https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T1/images/I/91QkiVdLMKL._SL1500_.jpg",
    "https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T1/images/I/81NI3j6WsNL._SL1500_.jpg",
  ];
}
