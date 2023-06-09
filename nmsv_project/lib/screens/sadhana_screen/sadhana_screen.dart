import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nmsv_project/common_widgets/custom_loader.dart';
import 'package:nmsv_project/constants/color.dart';
import 'package:nmsv_project/constants/extension.dart';

import '../../common_widgets/custom_appbar.dart';
import '../../controller/sadhana_screen_controller.dart';
import '../../model/sadhana_screen_model/sadhna_list_model.dart';
import 'sadhana_image_show_screen.dart';

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
      body: Obx(
        () => sadhanaScreenController.isLoading.value
            ? const CustomLoader()
            : GridView.builder(
                itemCount: sadhanaScreenController.sadhanaImageList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1.20,
                ),
                itemBuilder: (context, i) {
                  String singleItem =
                      sadhanaScreenController.sadhanaImageList[i];
                  return GestureDetector(
                    onTap: () {
                      sadhanaScreenController.pageController = PageController(initialPage: i);
                      Get.to(
                        () => SadhanaImageShowScreen(
                            image: singleItem, initialPageViewIndex: i),
                      );
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 1,
                            offset: Offset(0, 1),
                          )
                        ],
                      ),
                      child: CachedNetworkImage(
                        errorWidget: (context, url, error) {
                          return const CustomLoader();
                        },
                        imageUrl: singleItem,
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                },
              ).commonAllSidePadding(10),
      ),
    );
  }
}
