import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:nmsv_project/constants/api_url.dart';
import 'package:http/http.dart' as http;
import 'package:nmsv_project/model/auth_screen_model/forgot_password_model.dart';

class ForgotPasswordScreenContoller extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;
  RxString successStatus = "".obs;
  TextEditingController emailEditingController = TextEditingController();
  Future<void> forgotPasswordFunction() async {
    isLoading(true);
    String url = ApiUrl.forgotPasswordApi;
    log('forgotPasswordFunction Api Url :$url');
    try {
      Map<String, dynamic> bodyData = {
        "email": emailEditingController.text,
      };
      log('forgotPasswordFunction bodyData : $bodyData');

      http.Response response = await http.post(
        Uri.parse(url),
        body: jsonEncode(bodyData),
      );

      ForgotPasswordModel forgotPasswordModel =
          ForgotPasswordModel.fromJson(json.decode(response.body));

      successStatus.value = forgotPasswordModel.status;
      if (successStatus.value.toLowerCase() == "ok") {
        Fluttertoast.showToast(msg: "Please check your mail!");
        Get.back();
      } else {
        Fluttertoast.showToast(msg: "Enter valid Email");
      }
    } catch (e) {
      log("forgotPasswordFunction error: $e");
      rethrow;
    } finally {
      isLoading(false);
    }
  }
}
