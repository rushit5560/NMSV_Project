import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyProfileScreenController extends GetxController{
  RxBool isLoading = false.obs;
  RxString successStatus = ''.obs;

  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController username2controller = TextEditingController();
  TextEditingController firstnamecontroller = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController mobileNocontroller = TextEditingController();
  TextEditingController SttreetAddresscontroller = TextEditingController();
  TextEditingController citycontroller = TextEditingController();
  TextEditingController statecontroller = TextEditingController();
  TextEditingController zipcontroller = TextEditingController();
  TextEditingController countrycontroller = TextEditingController();
}