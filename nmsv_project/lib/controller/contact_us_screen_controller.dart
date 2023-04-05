import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../model/contact_us_screen_model/main_category_model.dart';

class ContactUsScreenController extends GetxController{
  List<ContactUsModel> contactUsList = [
    ContactUsModel(
      text1: 'jodhpur Gurudham at Jodhpur, India',
      text2: 'Narayan Mantra Sadhana Vigyan',
      text3: 'Address : Dr.Shrimali marg, High Court Colony, jodhpur 342001 Rajasthan, india',
      text4: 'Telephone : (0291)- 2432209/2433623',
      text5: 'Fax : (0291)-2432010',
      latitude: 26.2725,
      longitude: 73.0263,
    ),
    ContactUsModel(
      text1: 'Siddhashram (Gurukul) at New Delhi, india',
      text2: 'Narayan Mantra Sadhana Vigyan',
      text3: 'Address : Siddhashram, 8, Sandesh Vihar, Near M.M. Pubic School, Pitampura, New Dehli 110034, India',
      text4: 'Telephone : (011)-79675768/79675769',
      text5: 'Fax : (011)-27352248',
      latitude: 28.6928,
      longitude: 77.142,
    ),
  ];

}