import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class CoustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  String title;
  final Function onAction;
  CoustomAppBar({required this.title, required this.onAction});
  @override
  Size get preferredSize => Size.fromHeight(60);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: Text(title),
      backgroundColor: AppColors.appRedColor,
      leading: IconButton(
          onPressed: () {
            onAction();
          },
          icon: Icon(Icons.arrow_back_outlined)),
    );
  }
}
