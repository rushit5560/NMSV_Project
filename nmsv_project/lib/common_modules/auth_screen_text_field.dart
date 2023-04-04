import 'package:flutter/material.dart';
import 'package:nmsv_project/constants/color.dart';

// ignore: must_be_immutable
class TextFieldModule extends StatelessWidget {
  TextEditingController fieldController;
  String hintText;
  TextInputType keyboardType;
  FormFieldValidator? validate;
  int? maxLength;
  Widget? suffixIcon;
  bool? obscureText;
  Widget? prefixIcon;

  TextFieldModule({
    Key? key,
    required this.fieldController,
    required this.hintText,
    required this.keyboardType,
    this.validate,
    this.prefixIcon,
    this.maxLength,
    this.suffixIcon,
    this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: fieldController,
      validator: validate,
      obscureText: obscureText ?? false,
      textInputAction: TextInputAction.next,
      keyboardType: keyboardType,
      maxLength: maxLength,
      cursorColor: AppColors.backGroundColor,
      decoration: InputDecoration(
        enabledBorder: inputBorder(),
        focusedBorder: inputBorder(),
        errorBorder: inputBorder(),
        focusedErrorBorder: inputBorder(),
        fillColor: AppColors.whiteColor1,
        filled: true,
        hintText: hintText,
        errorMaxLines: 2,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        counterText: '',
        hintStyle:
            const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 15, vertical: 11),
      ),
    );
  }

  InputBorder inputBorder() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(30)),
      borderSide: BorderSide(color: Colors.grey),
    );
  }
}

// ignore: must_be_immutable
class SearchBarTextFieldModule extends StatelessWidget {
  TextEditingController fieldController;
  String hintText;
  TextInputType keyboardType;
  FormFieldValidator? validate;
  int? maxLength;
  Widget? suffixIcon;
  bool? obscureText;
  Widget? prefixIcon;
  Color? fillColor;
  Function(String)? onChanged;

  SearchBarTextFieldModule({
    Key? key,
    required this.fieldController,
    required this.hintText,
    required this.keyboardType,
    this.validate,
    this.prefixIcon,
    this.maxLength,
    this.suffixIcon,
    this.obscureText,
    this.fillColor,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: fieldController,
      validator: validate,
      obscureText: obscureText ?? false,
      textInputAction: TextInputAction.next,
      keyboardType: keyboardType,
      maxLength: maxLength,
      // cursorColor: AppColors.backGroundColor,
      onChanged: onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(25),
        ),
        fillColor: fillColor,
        filled: true,
        hintText: hintText,
        errorMaxLines: 2,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        counterText: '',
        hintStyle:
            const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 15, vertical: 11),
      ),
    );
  }
}
