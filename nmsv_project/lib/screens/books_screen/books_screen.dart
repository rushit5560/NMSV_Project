import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:get/get.dart';

import '../../common_widgets/custom_appbar.dart';
import '../../common_widgets/custom_loader.dart';
import '../../controller/books_screen_controller.dart';

class BooksScreen extends StatelessWidget {
  BooksScreen({Key? key}) : super(key: key);
  final booksScreenController = Get.put(BooksScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          titleText: "Books", leadingShow: false, actionShow: false),

      body: Obx(
            () => booksScreenController.isLoading.value
            ? const CustomLoader()
            : const WebviewScaffold(
          url: 'https://narayanmantrasadhanavigyan.org/timings/29',
        ),
      ),
    );
  }
}
