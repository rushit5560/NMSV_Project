
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/color.dart';
import '../../controller/index_screen_controller.dart';
import '../Bhajan_screen/Bhajan_screen.dart';
import '../Contact_us_screen/Contact_us_screen.dart';
import '../home_screen/home_screen.dart';
import '../profile_screen/profile_screen.dart';

class IndexScreen extends StatelessWidget {
  IndexScreen({Key? key}) : super(key: key);
  final indexScreenController = Get.put(IndexScreenController());
  final screen = [
    HomeScreen(),
    ContactUsScreen(),
    BhajanScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
            () => IndexedStack(
          index: indexScreenController.selectedIndex.value,
          children: screen,
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
