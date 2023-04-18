import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:nmsv_project/constants/api_url.dart';
import 'package:nmsv_project/utils/user_preference.dart';

import '../model/magazine_view_screen_model/magazine_list_model.dart';

class   MagazineViewScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxString successStatus = "".obs;

  UserPreference userPreference = UserPreference();
  List<MagazinePdf> magazineList = [];

  Future<void> getMagazineListFunction() async {
    isLoading(true);
    String url = ApiUrl.magazineHistoryApi;
    log('getMagazineListFunction Api Url :$url');

    try {
      String userId = await userPreference.getUserLoggedInFromPrefs(key: UserPreference.userIdKey);
      Map<String, String> bodyData = {
        "UserID": userId ?? "9287"
      };
      http.Response response = await http.post(Uri.parse(url), body: jsonEncode(bodyData));
      log('getMagazineListFunction : ${response.body}');

      MagazineListModel magazineListModel = MagazineListModel.fromJson(json.decode(response.body));
      successStatus.value = magazineListModel.status;

      if(successStatus.value.toLowerCase() == "ok") {
        magazineList.addAll(magazineListModel.data[0].pdf.reversed);
        log('magazineList Length : ${magazineList.length}');
      } else {
        log('getMagazineListFunction Else');
      }
    } catch(e) {
      log('getMagazineListFunction Error :$e');
      rethrow;
    }
    isLoading(false);
  }


  @override
  void onInit() {
    initMethod();
    super.onInit();
  }

  Future<void> initMethod() async {
    await getMagazineListFunction();
  }
}