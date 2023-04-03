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
    return SearchBarTextFieldModule(
      fieldController: bhajanScreenController.searchbarController,
      fillColor: Colors.grey[200],
      prefixIcon: const Icon(Icons.search,color: Colors.grey),
      suffixIcon: const Icon(Icons.close,color: Colors.grey),
      hintText: AppMessage.search,
      keyboardType: TextInputType.text,

    );
  }
}

class BhajanListModule extends StatelessWidget {
  const BhajanListModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        // itemCount: galleryScreenController.allGalleryList.length,
        itemCount: 10,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Get.to(()=> BhajanPlayerScreen());
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
