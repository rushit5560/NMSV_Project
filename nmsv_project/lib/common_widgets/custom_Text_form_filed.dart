import 'package:flutter/material.dart';

import '../constants/color.dart';
import '../constants/font_family.dart';
class CommonTextFormFieldModule extends StatelessWidget {
  TextEditingController fieldController;
  String hintText;
  TextInputType keyboardType;
  FormFieldValidator? validate;
  int? maxLength;
  Widget? suffixIcon;
  Widget? prefixIcon;
  bool? obscureText;
  String? text;
  Color? color;
  CommonTextFormFieldModule({
    Key? key,
    required this.fieldController,
    required this.hintText,
    required this.keyboardType,
    this.validate,
    this.maxLength,
    this.suffixIcon,
    this.prefixIcon,
    this.obscureText,
    this.text,
    this.color,
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
      decoration: InputDecoration(
        enabledBorder: inputBorder(),
        focusedBorder: inputBorder(),
        errorBorder: inputBorder(),
        focusedErrorBorder: inputBorder(),
        fillColor: color,
        filled: true,
        hintText: hintText,
        errorMaxLines: 2,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        counterText: text,
        hintStyle: TextStyle(color: AppColors.greyColor,fontFamily: FontFamilyText.roboto),
        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 11),
      ),
    );
  }

  InputBorder inputBorder() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(15)),
      borderSide: BorderSide(color: Colors.transparent),
    );
  }
}