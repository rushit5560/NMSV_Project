import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nmsv_project/common_modules/auth_screen_text_field.dart';
import 'package:nmsv_project/constants/message.dart';
import 'package:nmsv_project/controller/guruvani_list_screen_controller.dart';
import 'package:nmsv_project/screens/guruvani_scrren/guruvani_player_list_screen/guruvani_player_list_screen.dart';
import 'package:nmsv_project/utils/style.dart';
import 'package:sizer/sizer.dart';

class GuruvaniTextFiledModule extends StatelessWidget {
  GuruvaniTextFiledModule({Key? key}) : super(key: key);
  final guruvaniListScreenController = Get.find<GuruvaniListScreenController>();

  @override
  Widget build(BuildContext context) {
    return SearchBarTextFieldModule(
      fieldController: guruvaniListScreenController.gSearchbarController,
      fillColor: Colors.grey[200],
      prefixIcon: const Icon(Icons.search, color: Colors.grey),
      hintText: AppMessage.search,
      keyboardType: TextInputType.text,
      onChanged: (value) {
        // guruvaniListScreenController.isLoading(true);
        // guruvaniListScreenController.searchGalleryDataList =
        //     guruvaniListScreenController.allGalleryList;
        guruvaniListScreenController.searchGuruvaniList =
            guruvaniListScreenController.gurudevAllList
                .where((element) => element.title.toLowerCase().contains(value))
                .toList();
        // guruvaniListScreenController.isLoading(false);
        guruvaniListScreenController.loadUI();
      },
      suffixIcon: guruvaniListScreenController.gSearchbarController.text.isEmpty
          ? null
          : IconButton(
              onPressed: () {
                guruvaniListScreenController.isLoading(true);
                guruvaniListScreenController.searchGuruvaniList =
                    guruvaniListScreenController.gurudevAllList;
                guruvaniListScreenController.gSearchbarController.clear();
                guruvaniListScreenController.isLoading(false);
              },
              icon: const Icon(
                Icons.close,
                color: Colors.grey,
              ),
            ),
    );
  }
}

class GuruvaniListModule extends StatelessWidget {
  GuruvaniListModule({Key? key}) : super(key: key);
  final guruvaniListScreenController = Get.find<GuruvaniListScreenController>();

  @override
  Widget build(BuildContext context) {
    // log("guruvaniListScreenController.allGalleryList.length: ${guruvaniListScreenController.allGalleryList.length}");
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: guruvaniListScreenController.searchGuruvaniList.length,
      itemBuilder: (context, index) {
        final valuedata =
            guruvaniListScreenController.searchGuruvaniList[index];
        return InkWell(
          onTap: () {
            log("allGuruvaniId : ${guruvaniListScreenController.searchGuruvaniList[index].allGuruvaniId}");
            Get.to(
              () => GuruvaniPlayerScreen(),
              arguments: guruvaniListScreenController
                  .searchGuruvaniList[index].allGuruvaniId,
            );
          },
          child: Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.only(bottom: 10),
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
                  valuedata.title,
                  style: TextStyleConfig.textStyle(fontSize: 12.sp),
                ),
                trailing: const Icon(Icons.navigate_next_outlined),
              )),
        );
      },
    );
  }
}
