import 'dart:developer';

import 'package:nmsv_project/utils/userdetails.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreference {
  static String isUserLoggedInKey = "isUserLoggedInKey";
  static String fullNameKey = "fullNameKey";
  // static String emailKey = "emailKey";
  static String userIdKey = "userIdKey";
  static String userEmailKey = "userIdKey";
  static String userNameKey = "userEmailKey";
  static String userPasswordKey = "userPasswordKey";
  static String phoneNumberKey = "phoneNumberKey";
  static String userFNameKey = "userFNameKey";
  static String userLNameKey = "userLNameKey";

  

  Future<void> setUserDetails({
    required String fullName,
    required String email,
    required String userName,
    required String password,
    required String phoneNumber,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(fullNameKey, fullName);
    prefs.setString(userEmailKey, email);

    prefs.setString(userNameKey, userName);
    prefs.setString(userPasswordKey, password);
    prefs.setString(phoneNumberKey, phoneNumber);

    UserDetails.fullName = prefs.getString(fullNameKey) ?? "";
    UserDetails.email = prefs.getString(userEmailKey) ?? "";
    UserDetails.username = prefs.getString(userEmailKey) ?? "";
    UserDetails.password = prefs.getString(userPasswordKey) ?? "";
    UserDetails.phoneNumber = prefs.getString(phoneNumber) ?? "";

    log("fullName : ${UserDetails.fullName}");

    log("userPassword : ${UserDetails.email}");
    log("userName : ${UserDetails.username}");
    log("password : ${UserDetails.password}");
    log("phoneNumber : ${UserDetails.phoneNumber}");
  }

  Future<void> userAllDataFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(isUserLoggedInKey);
    prefs.setBool(isUserLoggedInKey, false);
  }

  Future<void> setBoolValueInPrefs(
      {required String key, required bool value}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
    log('prefs value :${prefs.getBool(key)}');
  }

  Future<void> setStringValueInPrefs(
      {required String key, required String value}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
    log('prefs value :${prefs.getString(key)}');
  }

  Future<bool> getBoolFromPrefs({required String key}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool value = prefs.getBool(key) ?? true;
    return value;
  }

  Future<String> getUserLoggedInFromPrefs({required String key}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String value = prefs.getString(key) ?? "";
    return value;
  }
}
