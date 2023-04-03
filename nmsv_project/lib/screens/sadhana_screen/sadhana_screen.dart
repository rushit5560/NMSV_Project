import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common_widgets/custom_appbar.dart';
import '../../controller/sadhana_screen_controller.dart';

class SadhanaScreen extends StatelessWidget {
  SadhanaScreen({Key? key}) : super(key: key);
  final sadhanaScreenController = Get.put(SadhanaScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        titleText: "Sadhana",
        leadingShow: false,
        actionShow: false,
      ),

      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, i) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),

              ),
            );
          },
      ),
    );
  }
}
