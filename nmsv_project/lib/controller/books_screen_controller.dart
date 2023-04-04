import 'package:get/get.dart';

class BooksScreenController extends GetxController {
  RxBool isLoading = false.obs;


  @override
  void onInit() {
    initMethod();
    super.onInit();
  }

  Future<void> initMethod() async {
    isLoading(true);
    Future.delayed(const Duration(seconds: 1), () {
      isLoading(false);
    });
    // getDikshaDataFunction();
  }
}