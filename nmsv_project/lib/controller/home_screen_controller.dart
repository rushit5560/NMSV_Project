import 'dart:convert';
import 'dart:developer';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:nmsv_project/constants/api_url.dart';
import 'package:nmsv_project/constants/app_images.dart';
import 'package:nmsv_project/constants/message.dart';
import 'package:nmsv_project/model/home_screen_model/category_model.dart';
import 'package:nmsv_project/model/home_screen_model/get_banner_list_model.dart';

import '../model/home_screen_model/introduction_model.dart';
import '../screens/Contact_us_screen/Contact_us_screen.dart';
import '../screens/auspicious_timing_screen/auspicious_timing_screen.dart';
import '../screens/books_screen/books_screen.dart';
import '../screens/camp_schedule_screen/camp_schedule_screen.dart';
import '../screens/diksha_screen/diksha_screen.dart';
import '../screens/mantra_screen/mantra_screen.dart';
import '../screens/meet_with_gurudev_scrren/meet_with_gurudev_scrren.dart';
import '../screens/sadhana_screen/sadhana_screen.dart';
import '../screens/yantra_screen/yantra_screen.dart';

class HomoScreenController extends GetxController {
  final CarouselController carouselController = CarouselController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  RxBool isLoading = false.obs;
  RxString successStatus = "".obs;

  RxInt currentIndex = 0.obs;
  RxString introductionValue = "".obs;

  ApiHeader apiHeader = ApiHeader();
  List<GetBannerList> getBannerList = [];

  List<MainCategory> categoryList = [
    MainCategory(
      image: AppImages.iconDiksha,
      name: AppMessage.diksha,
    ),
    MainCategory(
      image: AppImages.iconYantra,
      name: AppMessage.yantra,
    ),
    MainCategory(
      image: AppImages.iconBooks,
      name: AppMessage.books,
    ),
    MainCategory(
      image: AppImages.iconSadhana,
      name: AppMessage.shadhana,
    ),
    MainCategory(
      image: AppImages.iconMantra,
      name: AppMessage.mantra,
    ),
    MainCategory(
      image: AppImages.iconAuspicious,
      name: AppMessage.auspiciousTiming,
    ),
    MainCategory(
      image: AppImages.iconSchedule,
      name: AppMessage.campSchedule,
    ),
    MainCategory(
      image: AppImages.iconMetting,
      name: AppMessage.meetWithGurudev,
    ),
    MainCategory(
      image: AppImages.iconContact,
      name: AppMessage.contactUs,
    ),
  ];

  void categoryClickFunction(int i) {
    if(i == 0) {
      log('index : $i');
      Get.to(
        () => DikshaScreen(),
        transition: Transition.zoom,
      );
    } else if(i == 1) {
      log('index : $i');
      Get.to(
        () => YantraScreen(),
        transition: Transition.zoom,
      );
    } else if(i == 2) {
      log('index : $i');
      Get.to(
        () => BooksScreen(),
        transition: Transition.zoom,
      );
    } else if(i == 3) {
      log('index : $i');
      Get.to(
        () => SadhanaScreen(),
        transition: Transition.zoom,
      );
    } else if(i == 4) {
      log('index : $i');
      Get.to(
        () => MantraScreen(),
        transition: Transition.zoom,
      );
    } else if(i == 5) {
      log('index : $i');
      Get.to(
        () => AuspiciousTimingScreen(),
        transition: Transition.zoom,
      );
    } else if(i == 6) {
      log('index : $i');
      Get.to(
        () => CampScheduleScreen(),
        transition: Transition.zoom,
      );
    } else if(i == 7) {
      log('index : $i');
      Get.to(
        () => MeetWithGurudevScreen(),
        transition: Transition.zoom,
      );
    } else if(i == 8) {
      log('index : $i');
      Get.to(
        () => ContactUsScreen(),
        transition: Transition.zoom,
      );
    }
  }

  Future<void> getBannerListFunction() async {
    isLoading(true);

    String url = ApiUrl.getBannerList;
    log("getBannerListFunction url : $url");
    try {
      var request = http.MultipartRequest('GET', Uri.parse(url));
      request.headers['Authorization-Token'] = 'nmsvtoken';
      log("getBannerListFunction request.headers: ${request.headers}");
      var response = await request.send();

      response.stream.transform(utf8.decoder).listen((value) {
        log('getBannerListFunction response: $value');

        GetBannerListModel getBannerListModel =
            GetBannerListModel.fromJson(json.decode(value));

        log("getBannerListModel $getBannerListModel");

        if (response.statusCode == 200) {
          log("message");
          getBannerList.addAll(getBannerListModel.data);
          log("getBannerListFunction getbannerlist: $getBannerList");
        } else {
          log("error");
        }
      });
    } catch (e) {
      log("getBannerListFunction error: $e");
      rethrow;
    }

    await getIntroductionFunction();
  }


  Future<void> getIntroductionFunction() async {
    isLoading(true);
    String url = "${ApiUrl.widgetSectionApi}?slug=introduction_section";
    log('getIntroductionFunction Api Url : $url');

    try {
      var request = http.MultipartRequest('GET', Uri.parse(url));
      var response = await request.send();

      response.stream.transform(utf8.decoder).listen((value) {
        log('getIntroductionFunction Body : $value');

        IntroductionModel introductionModel = IntroductionModel.fromJson(json.decode(value));
        successStatus.value = introductionModel.status;

        if(successStatus.value == "ok") {
          introductionValue.value = introductionModel.data[0].content;
        } else {
         log('getIntroductionFunction Else');
        }

      });
    } catch(e) {
      log('getIntroductionFunction Error :$e');
      rethrow;
    }
    isLoading(false);
  }

  @override
  void onInit() {
    initMethod();
    super.onInit();
  }

  initMethod() async {
    await getBannerListFunction();
  }
}
