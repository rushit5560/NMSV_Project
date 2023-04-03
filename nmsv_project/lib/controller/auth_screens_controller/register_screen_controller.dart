import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreenController extends GetxController{
    GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController userNameEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  RxBool isPasswordHide = false.obs;
}