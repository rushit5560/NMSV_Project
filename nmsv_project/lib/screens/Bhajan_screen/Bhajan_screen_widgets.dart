import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common_modules/auth_screen_text_field.dart';
import '../../constants/message.dart';
import '../../controller/bhajan_screen_controller.dart';
import '../Bhajan_player_screen/Bhajan_player_screen.dart';

class TextFiledModule extends StatelessWidget {
   TextFiledModule({Key? key}) : super(key: key);
final bhajanScreenController = Get.find<BhajanScreenController>();
  @override
  Widget build(BuildContext context) {
    return TextFieldModule(
      fieldController: bhajanScreenController.searchbarController,
      prefixIcon: const Icon(Icons.search),
      hintText: AppMessage.search,
      keyboardType: TextInputType.text,
    );
  }
}

class BhajanListModule extends StatelessWidget {
  const BhajanListModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: ListView.separated(
        itemCount: 5,
        itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Get.to(()=> BhajanPlayerScreen());
          },
          child: Container(
            padding: const EdgeInsets.all(3),
            decoration: const BoxDecoration(
              //color: Colors.white,
            ),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Guru Naam rass'),
                Spacer(),
                Icon(
                  Icons.navigate_next_outlined,
                  size: 20,
                ),
              ],
            ),
          ),
        );
      }, separatorBuilder: (BuildContext context, int index) {
          return const Divider(
            height: 3,
           // color: AppColors.blackColor,
          );
      },
      ),
    );
  }
}
