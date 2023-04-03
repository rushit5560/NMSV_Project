import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/api_url.dart';

class RegisterScreenController extends GetxController{
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController userNameEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
   TextEditingController fullnameEditingController = TextEditingController();
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController phoneNumberEditingController = TextEditingController();
  RxBool isPasswordHide = false.obs;


  userRegisterFunction() async {
    String url = "https://narayanmantrasadhanavigyan.org/api/userRegister";
    log('Api Url : $url');

    try {

    } catch(e) {
      log('userRegisterFunction Error :$e');
      rethrow;
    }
  }
}