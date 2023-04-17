import 'package:flutter/material.dart';
import 'package:nmsv_project/constants/color.dart';

PreferredSizeWidget customAppBar({
  required String titleText,
  required bool leadingShow,
  Widget? leadingIcon,
  Function()? leadingOnTap,
  required bool actionShow,
  Widget? actionIcon,
  Function()? actionOnTap,
}) {
  return AppBar(
    centerTitle: true,
    toolbarHeight: 50,
    backgroundColor: AppColors.appColors,
    leading: leadingShow
        ? IconButton(
            onPressed: leadingOnTap ?? () {},
            icon: leadingIcon!,
          )
        : null,
    title: Text(
      titleText,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    ),
    actions: [
      actionShow
          ? IconButton(
              onPressed: actionOnTap ?? () {},
              icon: actionIcon!,
            )
          : Container(),
    ],
  );
}
