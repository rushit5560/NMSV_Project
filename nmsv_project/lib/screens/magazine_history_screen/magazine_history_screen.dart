import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nmsv_project/constants/extension.dart';
import 'package:sizer/sizer.dart';
import '../../common_widgets/custom_appbar.dart';
import '../../controller/magazine_history_screen_controller.dart';
import '../../utils/style.dart';
import 'magazine_history_screen_widgets.dart';

class MagazineHistoryScreen extends StatelessWidget {
  MagazineHistoryScreen({Key? key}) : super(key: key);
  final magazineHistoryScreenController = Get.put(MagazineHistoryScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          titleText: "Magazine History Subc.",
          leadingShow: false,
          actionShow: false),
      body:Column(
        children: [
          MagazineHistoryModule(),
          const Divider(),
          Text('SUBSRIBE NOW',
            style: TextStyleConfig.textStyle(
                fontSize: 12.sp,
                //fontWeight: FontWeight.bold
            ),
          )
        ],
      ).commonSymmetricPadding(horizontal: 10,vertical: 10),
    );
  }
}
