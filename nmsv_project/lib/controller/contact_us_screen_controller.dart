import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/contact_us_screen_model/main_category_model.dart';

class ContactUsScreenController extends GetxController {
  List<ContactUsModel> contactUsList = [
    ContactUsModel(
      text1: 'jodhpur Gurudham at Jodhpur, India',
      text2: 'Narayan Mantra Sadhana Vigyan',
      text3: 'Address : Dr.Shrimali marg, High Court Colony, jodhpur 342001 Rajasthan, india',
      text4: 'Call US : +91 08069636963',
      text5: 'Chat with us : +91 8447747911',
      latitude: 26.2725,
      longitude: 73.0263,
    ),
    ContactUsModel(
      text1: 'Siddhashram (Gurukul) at New Delhi, india',
      text2: 'Narayan Mantra Sadhana Vigyan',
      text3: 'Address : Siddhashram, 8, Sandesh Vihar, Near M.M. Pubic School, Pitampura, New Dehli 110034, India',
      text4: 'Call US : +91 08069636963',
      text5: 'Chat with us : +91 8447747911',
      latitude: 28.6928,
      longitude: 77.142,
    ),
  ];

  Future<void> makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  // String url(String phone) {
  //   if (Platform.isAndroid) {
  //     // add the [https]
  //     return "https://wa.me/$phone/"; // new line
  //   } else {
  //     // add the [https]
  //     return "https://api.whatsapp.com/send?phone=$phone}"; // new line
  //   }
  // }

  void openWhatsapp(
      {required BuildContext context,
      required String number}) async {
    var whatsapp = number; //+92xx enter like this
    var whatsappURlAndroid = "whatsapp://send?phone=$whatsapp" /*&text=$text*/;
    var whatsappURLIos = "https://wa.me/$whatsapp" /*?text=${Uri.tryParse(text)}*/;
    if (Platform.isIOS) {
      // for iOS phone only
      if (await canLaunchUrl(Uri.parse(whatsappURLIos))) {
        await launchUrl(Uri.parse(
          whatsappURLIos,
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Whatsapp not installed")));
      }
    } else {
      // android , web
      if (await canLaunchUrl(Uri.parse(whatsappURlAndroid))) {
        await launchUrl(Uri.parse(whatsappURlAndroid));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Whatsapp not installed")));
      }
    }
  }
}
