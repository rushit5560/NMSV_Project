import 'package:nmsv_project/constants/message.dart';

class FieldValidator {
  String? validateMobileNumber(String value) {
    if (value.isEmpty) {
      return 'Mobile number is required.';
    } else if (value.length < 10) {
      return 'Enter at least 10 digit mobile number.';
    } else if (value == "00000000") {
      return 'Please enter valid mobile number.';
    }
    return null;
  }

  String? validateName(String value) {
    if (value.isEmpty) {
      return "Please enter your name.";
    }
    return null;
  }

  String? validateUserName(String value) {
    if (value.isEmpty) {
      return "Please enter your username.";
    }
    return null;
  }

  String? validateFullName(String value) {
    if (value.isEmpty) {
      return "Please enter your fullname.";
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return AppMessage.passwordIsRequired;
    } else if (value.length < 8) {
      return AppMessage.passwordMustBeAtleast8CharactersLong;
    } else {
      return null;
    }
  }

  String? validateEmail(String value) {
    String emailRegExp =
        r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?";
    if (value.isEmpty) {
      return "Please enter email address.";
    } else if (!isNumeric(value) && !RegExp(emailRegExp).hasMatch(value)) {
      return "Invalid email address.";
    } else {
      return null;
    }
  }

  String? validateHomePhoneNumber(String value) {
    String patttern = AppMessage.patternRegX;
    RegExp regExp = RegExp(patttern);

    if (value.isEmpty) {
      return AppMessage.pleaseEnterPhoneNumber;
    } else if (value.length != 10) {
      return AppMessage.mobileNumberMustTenDigits;
    } else if (!regExp.hasMatch(value)) {
      return AppMessage.mobileNumberMustBeDigits;
    } else {
      return null;
    }
  }

  bool isNumeric(String s) {
    if (s.isEmpty) {
      return false;
    }
    return double.tryParse(s) != null;
  }
}
