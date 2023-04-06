import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nmsv_project/constants/api_url.dart';
import 'package:nmsv_project/model/my_profile_screen_model/get_profile_model.dart';
import 'package:nmsv_project/model/my_profile_screen_model/update_profile_model.dart';
import 'package:nmsv_project/utils/user_preference.dart';
import 'package:http/http.dart' as http;
import 'package:nmsv_project/utils/userdetails.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProfileScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxString successStatus = ''.obs;

  String userId = "";
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  UserPreference userPreference = UserPreference();

  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController firstnamecontroller = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController mobileNocontroller = TextEditingController();
  TextEditingController streetAddresscontroller = TextEditingController();
  TextEditingController citycontroller = TextEditingController();
  TextEditingController statecontroller = TextEditingController();
  TextEditingController zipcontroller = TextEditingController();
  TextEditingController countrycontroller = TextEditingController();

  Future<void> getProfileDataFunction() async {
    isLoading(true);

    String url = "${ApiUrl.getProfileApi}?UserID=$userId";

    log("getProfileDataFunction url: $url");
    try {
      http.Response response = await http.get(Uri.parse(url));

      log("getProfileDataFunction response :  ${response.body}");
      GetProfileModel getProfileModel =
          GetProfileModel.fromJson(json.decode(response.body));
      successStatus.value = getProfileModel.status;

      if (successStatus.value.toLowerCase() == "ok") {
        // ignore: unnecessary_null_comparison
        if (getProfileModel == null) {
          log("data is empty");
        } else {
          usernamecontroller.text = getProfileModel.userName;
          emailcontroller.text = getProfileModel.emailId;
          mobileNocontroller.text = getProfileModel.mobileNo;
          firstnamecontroller.text = getProfileModel.firstName;
          lastNameController.text = getProfileModel.lastName;
          streetAddresscontroller.text = getProfileModel.address;
          citycontroller.text = getProfileModel.city;
          statecontroller.text = getProfileModel.state;
          zipcontroller.text = getProfileModel.postalCode;
          countrycontroller.text = getProfileModel.country;
        }
      }
    } catch (e) {
      log("getProfileDataFunction error : $e");
      rethrow;
    } finally {
      isLoading(false);
    }
  }

  updateProfileDataFunction() async {
    isLoading(true);

    String url = ApiUrl.upDateProfileApi;
    log("updateProfileDataFunction url: $url");
    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));

      request.fields['UserID'] = userId;
      request.fields['FirstName'] = firstnamecontroller.text;
      // request.fields['EmailId'] = emailcontroller.text;
      request.fields['LastName'] = lastNameController.text;
      request.fields['MobileNo'] = mobileNocontroller.text;
      request.fields['StreetAddress'] = streetAddresscontroller.text;
      request.fields['UserName'] = usernamecontroller.text;
      request.fields['City'] = citycontroller.text;
      request.fields['State'] = statecontroller.text;
      request.fields['PostalCode'] = zipcontroller.text;
      request.fields['Country'] = countrycontroller.text;
      log('updateProfileDataFunction request.fields: ${request.fields}');
      var response = await request.send();

      response.stream
          .transform(const Utf8Decoder())
          .transform(const LineSplitter())
          .listen((value) async {
        UpdateProfileMOdel updateProfileMOdel =
            UpdateProfileMOdel.fromJson(json.decode(value));
        log('response body is ::: $value');

        if (successStatus.value.toLowerCase() == "ok") {
          Fluttertoast.showToast(
            msg: updateProfileMOdel.message,
            toastLength: Toast.LENGTH_SHORT,
          );
          log(updateProfileMOdel.message);
          SharedPreferences prefs = await SharedPreferences.getInstance();
          UserDetails.email =
              prefs.getString(UserPreference.userEmailKey) ?? "";
          UserDetails.userFNameKey =
              prefs.getString(UserPreference.userFNameKey) ?? "";
          UserDetails.userLNameKey =
              prefs.getString(UserPreference.userLNameKey) ?? "";
          UserDetails.username =
              prefs.getString(UserPreference.userNameKey) ?? "";
          UserDetails.password =
              prefs.getString(UserPreference.userPasswordKey) ?? "";
          UserDetails.fullName =
              prefs.getString(UserPreference.fullNameKey) ?? "";
          UserDetails.phoneNumber =
              prefs.getString(UserPreference.phoneNumberKey) ?? "";
          UserDetails.state = prefs.getString(UserPreference.stateKey) ?? "";
          UserDetails.country =
              prefs.getString(UserPreference.countryKey) ?? "";
          UserDetails.city = prefs.getString(UserPreference.cityKey) ?? "";
          UserDetails.zipCode =
              prefs.getString(UserPreference.zipCodeKey) ?? "";
          Get.back();
        } else {
          log("false false");
        }
      });
    } catch (e) {
      log("updateProfileDataFunction error :$e");
      rethrow;
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    initMethod();
    super.onInit();
  }

  Future<void> initMethod() async {
    userId = await userPreference.getUserLoggedInFromPrefs(
        key: UserPreference.userIdKey);
    await getProfileDataFunction();
  }
}
