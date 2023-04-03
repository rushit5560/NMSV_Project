import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nmsv_project/constants/message.dart';
import '../../common_modules/auth_screen_text_field.dart';
import '../../controller/bhajan_player_screen_controller.dart';
import '../Bhajan_audio_screen/Bhajan_audio_screen.dart';


class TextFormFiledModule extends StatelessWidget {
  TextFormFiledModule({Key? key}) : super(key: key);
  final bhajanPlayerScreenController = Get.find<BhajanPlayerScreenController>();
  @override
  Widget build(BuildContext context) {
    return TextFieldModule(
      fieldController: bhajanPlayerScreenController.searchController,
      prefixIcon: const Icon(Icons.search),
      hintText: AppMessage.search,
      keyboardType: TextInputType.text,
    );
  }
}

class BhajanPlayerListModule extends StatelessWidget {
  const BhajanPlayerListModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: ListView.separated(
        itemCount: 5,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Get.to(()=> BhajanAudioScreen());
            },
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                //color: Colors.white,
              ),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  const [
                  Text('Jab Yaad Tumhaari Aai 01'),
                  Spacer(),
                  Icon(
                    Icons.download,
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
