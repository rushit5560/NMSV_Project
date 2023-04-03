import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:nmsv_project/constants/api_url.dart';
import 'package:nmsv_project/model/auth_screen_model/login_model.dart';
import 'package:nmsv_project/screens/index_screen/index_screen.dart';
import 'package:nmsv_project/utils/user_preference.dart';

class SignInScreenController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;
  RxString successStatus = "".obs;

  TextEditingController userNameEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  UserPreference userPreference = UserPreference();

  RxBool isPasswordHide = false.obs;
  // Future<void> getUserRegisterDetails() async {
  //   userNameEditingController.text = await userPreference
  //       .getUserLoggedInFromPrefs(key: UserPreference.userNameKey);
  //   passwordEditingController.text = await userPreference
  //       .getUserLoggedInFromPrefs(key: UserPreference.userPasswordKey);
  // }

  Future<void> setUserLoginDetails({
    required String userID,
    required String userName,
    required String emailId,
    required String firstName,
    required String lastName,
    required String mobileNo,
  }) async {
    UserPreference userPreference = UserPreference();

    // 1
    await userPreference.setStringValueInPrefs(
      key: UserPreference.userIdKey,
      value: userID,
    );
    // 2
    await userPreference.setStringValueInPrefs(
      key: UserPreference.userNameKey,
      value: userName,
    );
    // 3
    await userPreference.setStringValueInPrefs(
      key: UserPreference.userEmailKey,
      value: emailId,
    );
    // 4
    await userPreference.setStringValueInPrefs(
      key: UserPreference.userFNameKey,
      value: firstName,
    );
    // 5
    await userPreference.setStringValueInPrefs(
      key: UserPreference.userLNameKey,
      value: lastName,
    );
    // 6
    await userPreference.setStringValueInPrefs(
      key: UserPreference.phoneNumberKey,
      value: mobileNo,
    );
  }

  userLoginFunction() async {
    isLoading(true);
    String url = ApiUrl.loginApi;
    log('userLoginFunction Api Url :$url');
    try {
      Map<String, dynamic> bodyData = {
        "username": userNameEditingController.text,
        "password": passwordEditingController.text,
      };

      log('userLoginFunction bodyData : $bodyData');

      http.Response response = await http.post(
        Uri.parse(url),
        body: jsonEncode(bodyData),
      );
      log("userLoginFunction Response.body : ${response.body}");
      LoginModel loginModel = LoginModel.fromJson(json.decode(response.body));
      // log("userLoginFunction Response.body : ${response.body}");
      successStatus.value = loginModel.status;

      if (successStatus.value.toLowerCase() == "ok") {
        await setUserLoginDetails(
          userID: loginModel.userId,
          userName: loginModel.userName,
          emailId: loginModel.emailId,
          firstName: loginModel.firstName,
          lastName: loginModel.lastName,
          mobileNo: loginModel.mobileNo,
        );
        Get.offAll(() => IndexScreen());
      } else {
        log("userLoginFunction error");
      }
    } catch (e) {
      log("userLoginFunction error : $e");
      rethrow;
    } finally {
      isLoading(false);
    }
  }
}
