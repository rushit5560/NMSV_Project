import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../common_modules/auth_screen_text_field.dart';
import '../../../constants/font_family.dart';
import '../../../constants/message.dart';
import '../../../controller/bhajan_list_screen_controller.dart';
import '../../../utils/style.dart';
import '../Bhajan_player_screen/Bhajan_player_screen.dart';

class TextFiledModule extends StatelessWidget {
  TextFiledModule({Key? key}) : super(key: key);
  final bhajanListScreenController = Get.find<BhajanListScreenController>();
  @override
  Widget build(BuildContext context) {
    return SearchBarTextFieldModule(
      fieldController: bhajanListScreenController.searchbarController,
      fillColor: Colors.grey[200],
      prefixIcon: const Icon(Icons.search, color: Colors.grey),
      hintText: AppMessage.search,
      keyboardType: TextInputType.text,
      onChanged: (value) {
        bhajanListScreenController.isLoading(true);

        bhajanListScreenController.searchBhajanDataList =
            bhajanListScreenController.allBhajanList
                .where((element) => element.title.toLowerCase().contains(value))
                .toList();
        bhajanListScreenController.isLoading(false);
      },
      suffixIcon: bhajanListScreenController.searchbarController.text.isEmpty
          ? null
          : IconButton(
              onPressed: () {
                bhajanListScreenController.isLoading(true);
                bhajanListScreenController.searchBhajanDataList =
                    bhajanListScreenController.allBhajanList;
                bhajanListScreenController.searchbarController.clear();
                bhajanListScreenController.isLoading(false);
              },
              icon: const Icon(Icons.close, color: Colors.grey),
            ),
    );
  }
}

class BhajanListModule extends StatelessWidget {
  BhajanListModule({Key? key}) : super(key: key);
  final bhajanListScreenController = Get.find<BhajanListScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // itemCount: bhajanListScreenController.allGalleryList.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: bhajanListScreenController.searchBhajanDataList.length,
      itemBuilder: (context, index) {
        var val = bhajanListScreenController.searchBhajanDataList[index];
        return InkWell(
          onTap: () {
            log("allBhajanId : ${bhajanListScreenController.searchBhajanDataList[index].allBhajanId}");
            Get.to(() => BhajanPlayerScreen(),
                arguments: bhajanListScreenController
                    .searchBhajanDataList[index].allBhajanId);
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.3), //color of shadow
                    blurRadius: 5,
                    blurStyle: BlurStyle.outer)
              ],
            ),
            child: ListTile(
              title: Text(
                val.title,
                style: TextStyleConfig.textStyle(
                    fontSize: 13.sp,
                    fontFamily: FontFamilyText.roboto,
                    fontWeight: FontWeight.w500
                ),
              ),
              trailing: const Icon(Icons.navigate_next_outlined),
            ),
          ),
        );
      },
    );
  }
}
