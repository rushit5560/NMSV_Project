import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ForgotPasswordScreenContoller extends GetxController{
   GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailEditingController = TextEditingController();
}