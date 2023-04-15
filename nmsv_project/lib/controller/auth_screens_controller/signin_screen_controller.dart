import 'dart:convert';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:nmsv_project/constants/api_url.dart';
import 'package:nmsv_project/model/auth_screen_model/login_model.dart';
import 'package:nmsv_project/screens/profile_screen/profile_screen.dart';
import 'package:nmsv_project/utils/user_preference.dart';

class SignInScreenController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;
  RxString successStatus = "".obs;
  FirebaseAuth auth = FirebaseAuth.instance;
  var googleSignIn = GoogleSignIn();
  var googleAccount = Rx<GoogleSignInAccount?>(null);
  var isSignIn = false.obs;
  var displayname = "";
  var email = "";

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
    required bool userLoggedIn,
    required String userID,
    required String userName,
    required String emailId,
    required String firstName,
    required String lastName,
    required String mobileNo,
  }) async {
    UserPreference userPreference = UserPreference();

    // 1
    await userPreference.setBoolValueInPrefs(
      key: UserPreference.isUserLoggedInKey,
      value: userLoggedIn,
    );
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
          userLoggedIn: true,
          userID: loginModel.userId,
          userName: loginModel.userName,
          emailId: loginModel.emailId,
          firstName: loginModel.firstName,
          lastName: loginModel.lastName,
          mobileNo: loginModel.mobileNo,
        );
        log('userId : ${loginModel.userId}');
        Fluttertoast.showToast(
          // backgroundColor: AppColors.appColors,
          msg: "login successfully..",
        );
        Get.offAll(() => ProfileScreen());
      } else {
        Fluttertoast.showToast(
          // backgroundColor: AppColors.appColors,
          msg: loginModel.message,
        );
        log("userLoginFunction error");
      }
    } catch (e) {
      log("userLoginFunction error : $e");
      rethrow;
    } finally {
      isLoading(false);
    }
  }

  void signInWithGoogle() async {
    isLoading(true);
    try {
      googleAccount.value = await googleSignIn.signIn();
      displayname = googleAccount.value!.displayName!;
      email = googleAccount.value!.email;
      await socialMediaApiLoginFunction(email, displayname);
      isSignIn.value = true;
    } catch (e) {
      log("error : $e");

      // Get.snackbar(
      //   "Error ",
      //   e.toString(),
      //   snackPosition: SnackPosition.BOTTOM,
      //   backgroundColor: Colors.grey,
      //   colorText: AppColors.blackColor,
      // );
    }
    isLoading(false);
  }

  Future<void> socialMediaApiLoginFunction(
      String email, String userName) async {
    isLoading(true);
    String url = ApiUrl.googleLoginApi;

    try {
      Map<String, dynamic> bodyData = {
        "emailid": email,
        "login_type": "google",
        "name": userName,
        "googlekey":
            "197435896606-ps0qf6hi6oodf75a0622gtqkka01m135.apps.googleusercontent.com"
      };
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
          userLoggedIn: true,
          userID: loginModel.userId,
          userName: loginModel.userName,
          emailId: loginModel.emailId,
          firstName: loginModel.firstName,
          lastName: loginModel.lastName,
          mobileNo: loginModel.mobileNo,
        );
        log('userId : ${loginModel.userId}');
        Fluttertoast.showToast(
          // backgroundColor: AppColors.appColors,
          msg: "login successfully..",
        );
        Get.offAll(() => ProfileScreen());
      } else {
        Fluttertoast.showToast(
          // backgroundColor: AppColors.appColors,
          msg: loginModel.message,
        );
        log("userLoginFunction error");
      }
    } catch (e) {
      log('socialMediaApiLoginFunction Error :$e');
      rethrow;
    }
  }

  // void signOut() async {
  //   try {
  //     await auth.signOut();
  //     await googleSignIn.signOut();
  //     displayname = "";
  //     isSignIn.value = false;

  //     update();
  //     Get.back();
  //   } catch (e) {
  //     log("error : $e");
  //     Get.snackbar(
  //       "Error ",
  //       e.toString(),
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Colors.grey,
  //       colorText: AppColors.blackColor,
  //     );
  //   }
  // }
}
