import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nmsv_project/model/auth_screen_model/register_model.dart';
import 'package:nmsv_project/screens/home_screen/home_screen.dart';
import 'package:nmsv_project/screens/index_screen/index_screen.dart';
import 'package:nmsv_project/utils/user_preference.dart';
import 'package:http/http.dart' as http;
import '../../constants/api_url.dart';

class RegisterScreenController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  UserPreference userPreference = UserPreference();
  RxBool isLoading = false.obs;
  RxString successStatus = "".obs;

  TextEditingController fullnameEditingController = TextEditingController();
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController userNameEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  TextEditingController phoneNumberEditingController = TextEditingController();
  RxBool isPasswordHide = false.obs;

  Future<void> getUserRegisterDetails() async {
    fullnameEditingController.text = await userPreference
        .getUserLoggedInFromPrefs(key: UserPreference.fullNameKey);
    emailEditingController.text = await userPreference.getUserLoggedInFromPrefs(
        key: UserPreference.userEmailKey);
    userNameEditingController.text = await userPreference
        .getUserLoggedInFromPrefs(key: UserPreference.userNameKey);
    passwordEditingController.text = await userPreference
        .getUserLoggedInFromPrefs(key: UserPreference.userPasswordKey);
    phoneNumberEditingController.text = await userPreference
        .getUserLoggedInFromPrefs(key: UserPreference.phoneNumberKey);
  }

  Future<void> setUserRegisterDetails() async {
    UserPreference userPreference = UserPreference();

    await userPreference.setStringValueInPrefs(
      key: UserPreference.fullNameKey,
      value: fullnameEditingController.text.trim(),
    );
    await userPreference.setStringValueInPrefs(
      key: UserPreference.userEmailKey,
      value: emailEditingController.text.trim().toLowerCase(),
    );

    await userPreference.setStringValueInPrefs(
      key: UserPreference.userNameKey,
      value: userNameEditingController.text.trim(),
    );

    await userPreference.setStringValueInPrefs(
      key: UserPreference.userPasswordKey,
      value: passwordEditingController.text.trim(),
    );

    await userPreference.setStringValueInPrefs(
      key: UserPreference.phoneNumberKey,
      value: phoneNumberEditingController.text.trim(),
    );
  }

  userRegisterFunction() async {
    isLoading(true);

    String url = ApiUrl.registerApi;
    log('userRegisterFunction Api Url : $url');

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));

      request.fields['fullname'] = fullnameEditingController.text.trim();
      request.fields['email'] = emailEditingController.text.trim();
      request.fields['username'] = userNameEditingController.text.trim();
      request.fields['password'] = passwordEditingController.text.trim();
      request.fields['phoneno'] = phoneNumberEditingController.text.trim();
      request.fields['uuid'] = "116.72.16.197";
      request.headers['Authorization-Token'] = "nmsvtoken";
      log('userRegisterFunction fields ${request.fields}');
      log('userRegisterFunction headers ${request.headers}');

      var response = await request.send();

      response.stream
          .transform(const Utf8Decoder())
          .transform(const LineSplitter())
          .listen(
        (value) async {
          log("respovse.body:  $value");

          RegisterModel registerModel =
              RegisterModel.fromJson(json.decode(value));
          successStatus.value = registerModel.status;

          if (successStatus.value.toLowerCase() == "ok") {
            log("1111");
            await setUserRegisterDetails();
            Get.to(() => IndexScreen());
            log("222");
          } else {
            Fluttertoast.showToast(
              // backgroundColor: AppColors.orangeColor1,
              msg: registerModel.message,
            );
          }
        },
      );
    } catch (e) {
      log('userRegisterFunction Error :$e');
      rethrow;
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    // userRegisterFunction();

    super.onInit();
  }
}
