import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nmsv_project/common_widgets/custom_appbar.dart';
import 'package:nmsv_project/common_widgets/custom_loader.dart';
import 'package:nmsv_project/constants/color.dart';
import 'package:nmsv_project/constants/extension.dart';
import 'package:nmsv_project/screens/magazine_view_screen/view_magazine_screen/view_magazine_screen.dart';
import '../../controller/magazine_view_screen_controller.dart';
import '../../model/magazine_view_screen_model/magazine_list_model.dart';

class MagazineViewScreen extends StatelessWidget {
  MagazineViewScreen({Key? key}) : super(key: key);
  final magazineViewScreenController = Get.put(MagazineViewScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          titleText: "Magazine Subscription",
          leadingShow: false,
          actionShow: false),
      body: Obx(
        () => magazineViewScreenController.isLoading.value
            ? const CustomLoader()
            : GridView.builder(
                itemCount: magazineViewScreenController.magazineList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.80,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, i) {
                  MagazinePdf singleItem =
                      magazineViewScreenController.magazineList[i];
                  return InkWell(
                    onTap: () {
                      Get.to(() => ViewMagazineScreen(),
                          arguments: singleItem.magazinepdfId);
                    },
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          width: Get.width,
                          decoration: const BoxDecoration(
                            color: AppColors.whiteColor,
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
                            imageUrl: singleItem.imageurl,
                            fit: BoxFit.fill,
                          ),
                        ),
                        // Container(
                        //   decoration: BoxDecoration(
                        //     image: DecorationImage(
                        //       image: NetworkImage(singleItem.imageurl),
                        //       fit: BoxFit.cover,
                        //     ),
                        //   ),
                        // ),
                        Container(
                          width: Get.width,
                          decoration: const BoxDecoration(
                            color: AppColors.blackColor,
                          ),
                          child: Text(
                            singleItem.magazinepdfTitle,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: AppColors.whiteColor,
                            ),
                          ).commonSymmetricPadding(vertical: 3),
                        ),
                        // SfPdfViewer.network(
                        //   singleItem.pdfurl,
                        // ),
                      ],
                    ),
                  );
                },
              ).commonAllSidePadding(10),
      ),
    );
  }
}
