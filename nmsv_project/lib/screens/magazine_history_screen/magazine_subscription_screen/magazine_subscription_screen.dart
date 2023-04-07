import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:nmsv_project/constants/extension.dart';
import '../../../common_widgets/custom_appbar.dart';
import '../../../common_widgets/custom_loader.dart';
import '../../../constants/color.dart';
import '../../../controller/magazine_history_screen_controller.dart';
import '../../../model/magazine_view_screen_model/magazine_list_model.dart';
import '../../magazine_view_screen/view_magazine_screen/view_magazine_screen.dart';

class MagazineSubscriptionScreen extends StatelessWidget {
  MagazineSubscriptionScreen({Key? key}) : super(key: key);
  final magazineHistoryScreenController =
      Get.find<MagazineHistoryScreenController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          titleText: "Magazine Subscription",
          leadingShow: false,
          actionShow: false),
      body: Obx(
        () => magazineHistoryScreenController.isLoading.value
            ? const CustomLoader()
            : GridView.builder(
                itemCount: magazineHistoryScreenController.magazineList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.80,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, i) {
                  MagazinePdf singleItem =
                      magazineHistoryScreenController.magazineList[i];
                  return InkWell(
                    onTap: () {
                      Get.to(() => ViewMagazineScreen(),
                          arguments: singleItem.magazinepdfId);
                    },
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(singleItem.imageurl),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
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
