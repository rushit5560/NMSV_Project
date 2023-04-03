import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:nmsv_project/constants/api_url.dart';
import 'package:nmsv_project/model/sadhana_screen_model/sadhna_list_model.dart';

class SadhanaScreenController extends GetxController {
  RxBool isLoading = false.obs;
  String successStatus = "";

  List<SadhanaData> sadhanaList = [];

  Future<void> getSadhanaFunction() async {
    isLoading(true);
    String url = ApiUrl.sadhanaListApi;
    log('getSadhanaFunction Api Url : $url');

    try {
      var request = http.MultipartRequest('GET', Uri.parse(url));
      request.headers['Authorization-Token'] = 'nmsvtoken';

      var response = await request.send();

      response.stream.transform(utf8.decoder).listen((value) {
        log('SadhanaFunction value : $value');
        SadhanaListModel sadhanaListModel = SadhanaListModel.fromJson(json.decode(value));
        successStatus = sadhanaListModel.status;

        if(successStatus == "ok") {
          sadhanaList.clear();
          sadhanaList.addAll(sadhanaListModel.data);
          log('sadhanaList : ${sadhanaList.length}');
        } else {
          log('getSadhanaFunction Else');
        }

      });

    } catch(e) {
      log('getSadhanaFunction Error :$e');
      rethrow;
    }
  }

  @override
  void onInit() {
    initMethod();
    super.onInit();
  }

  Future<void> initMethod() async {
    await getSadhanaFunction();
  }
}