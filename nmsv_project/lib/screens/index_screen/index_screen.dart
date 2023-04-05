import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nmsv_project/common_widgets/custom_loader.dart';
import '../../constants/color.dart';
import '../../controller/index_screen_controller.dart';


class IndexScreen extends StatelessWidget {
  IndexScreen({Key? key}) : super(key: key);
  final indexScreenController = Get.put(IndexScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => indexScreenController.isLoading.value
        ? CustomLoader()
        : IndexedStack(
          index: indexScreenController.selectedIndex.value,
          children: indexScreenController.screen,
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.orangeColor,
          unselectedItemColor: AppColors.greyColor,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          onTap: (index) {
            //indexScreenController.homeScreenShow.value = false;
            indexScreenController.changeIndex(index);
          },
          currentIndex: indexScreenController.selectedIndex.value,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map_sharp),
              label: 'Contact Us',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.music_note_outlined),
              label: 'Bhajan',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
