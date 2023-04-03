import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GalleryScreenController extends GetxController{
  RxBool isLoading = false.obs;
  TextEditingController gallerySearchbarController = TextEditingController();
}