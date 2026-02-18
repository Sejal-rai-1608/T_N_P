import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String leftImage;
  final String rightImage;
  final String title;

  const CustomAppbar({
    super.key,
    required this.leftImage,
    required this.rightImage,
    this.title = "",
  });

  @override
  Size get preferredSize => const Size.fromHeight(30); // 🔥 reduced height

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 30,
      elevation: 0,
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      centerTitle: false,

      titleSpacing: 8,

      title: SvgPicture.asset(leftImage, height: 28, fit: BoxFit.contain),

      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: SvgPicture.asset(rightImage, height: 22),
        ),
      ],
    );
  }
}
