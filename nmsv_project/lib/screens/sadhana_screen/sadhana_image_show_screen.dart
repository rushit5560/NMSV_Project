import 'package:flutter/material.dart';
import 'package:nmsv_project/constants/color.dart';
import 'package:photo_view/photo_view.dart';

class SadhanaImageShowScreen extends StatelessWidget {
  final String image;

  const SadhanaImageShowScreen({Key? key, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: PhotoView(
            imageProvider: NetworkImage(image),
            backgroundDecoration: const BoxDecoration(
              color: AppColors.whiteColor,
            ),
          ),
        ),
      ),
    );
  }
}
