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
    return SearchBarTextFieldModule(
      fieldController: bhajanPlayerScreenController.searchController,
      fillColor: Colors.grey[200],
      prefixIcon: const Icon(Icons.search,color: Colors.grey),
      suffixIcon: const Icon(Icons.close,color: Colors.grey),
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
      child: ListView.builder(
        // itemCount: galleryScreenController.allGalleryList.length,
        itemCount: 10,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Get.to(()=> BhajanAudioScreen());
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.only(bottom: 10),
              decoration:  BoxDecoration(
                // border: Border.all(color: Colors.grey.shade400, width: 0.0),
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.3), //color of shadow
                      // spreadRadius: 3,
                      blurRadius: 5,
                      blurStyle: BlurStyle.outer
                  )
                ],
              ),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:   const [
                  //Text(galleryScreenController.allGalleryList[index].shivirGalleryTitle),
                  Text('DMKSEFJMKTHMY,J,'),
                  Spacer(),
                  Icon(
                    Icons.navigate_next_outlined,
                    size: 20,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
