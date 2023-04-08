import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nmsv_project/common_widgets/custom_loader.dart';
import 'package:nmsv_project/constants/extension.dart';
import 'package:nmsv_project/screens/magazine_view_screen/view_magazine_screen/view_magazine_screen_widgets.dart';

import '../../../common_widgets/custom_appbar.dart';
import '../../../controller/view_magazine_screen_controller.dart';

class ViewMagazineScreen extends StatelessWidget {
   ViewMagazineScreen({Key? key}) : super(key: key);
final viewMagazineScreenController = Get.put(ViewMagazineScreenController());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: customAppBar(
          titleText: "Magazine Subscription",
          leadingShow: false,
          actionShow: false,),
      body:Obx(()=> viewMagazineScreenController.isLoading.value
          ? const CustomLoader()
          : MagazineSubscriptionModule().commonSymmetricPadding(horizontal: 10,vertical: 10)),
    );
  }
}
