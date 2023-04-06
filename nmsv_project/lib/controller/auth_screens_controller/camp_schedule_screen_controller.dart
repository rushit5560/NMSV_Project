import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../constants/api_url.dart';
import '../../model/camp_schedule_screen_model/camp_schedule_screen_model.dart';

class CampScheduleScreenController extends GetxController{
  RxBool isLoading = false.obs;
  RxString successStatus = ''.obs;
  RxBool isExpanded = false.obs;
  List<CampSchedule> campSchedule = [];
  Future<void> getCampScheduleFunction() async {
    isLoading(true);
    String url = ApiUrl.campScheduleApi;
    log("getCampScheduleFunction url : $url");

    try {
      http.Response response = await http.get(Uri.parse(url));

      CampScheduleModel campschedulemodel =
      CampScheduleModel.fromJson(json.decode(response.body));
      // log("response.body : ${response.body}");

      successStatus.value=campschedulemodel.status;
      if (successStatus.value == "ok") {
        campSchedule.addAll(campschedulemodel.data);
      } else {
        log('getCampScheduleFunction Else');
      }
    } catch (e) {
      log('getCampScheduleFunction Error :$e');
      rethrow;
    } finally {
      isLoading(false);
    }
  }
  @override
  void onInit() {
    getCampScheduleFunction();
    super.onInit();
  }

}