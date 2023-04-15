import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nmsv_project/common_modules/custom_alert_dialog.dart';
import 'package:nmsv_project/common_widgets/custom_loader.dart';
import 'package:nmsv_project/constants/app_images.dart';
import '../../constants/color.dart';
import '../../controller/index_screen_controller.dart';

class IndexScreen extends StatelessWidget {
  IndexScreen({Key? key}) : super(key: key);
  final indexScreenController = Get.put(IndexScreenController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool shouldPop = false;
        if (indexScreenController.selectedIndex.value != 0) {
          indexScreenController.selectedIndex.value = 0;
        } else {
          shouldPop = await showDialog<bool>(
                context: context,
                builder: (context) {
                  return CustomMobileBackPressAlertDialog();
                },
              ) ??
              false;
        }
        return shouldPop;
      },
      child: Scaffold(
        body: Obx(
          () => indexScreenController.isLoading.value
              ? const CustomLoader()
              : IndexedStack(
                  index: indexScreenController.selectedIndex.value,
                  children: indexScreenController.screen,
                ),
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.appColors,
            unselectedItemColor: AppColors.greyColor,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            onTap: (index) {
              //indexScreenController.homeScreenShow.value = false;
              indexScreenController.changeIndex(index);
            },
            currentIndex: indexScreenController.selectedIndex.value,
            items:  [
              BottomNavigationBarItem(
                icon: Image.asset(AppImages.homeImage,height: 25,color: Colors.grey,),

                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(AppImages.iconContact,height: 25,color: Colors.grey,),

                label: 'Contact Us',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(AppImages.bhajanImage,height: 25,color: Colors.grey,),

                label: 'Bhajan',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(AppImages.iconProfileImage,height: 25,color: Colors.grey,),

                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
