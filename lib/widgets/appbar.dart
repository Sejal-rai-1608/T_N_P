import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppbar extends StatelessWidget {
  final String leftImage;
  final String rightImage;
  const CustomAppbar({
    super.key,
    required this.leftImage,
    required this.rightImage,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      surfaceTintColor: const Color.fromARGB(255, 255, 255, 255),

      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      title: Padding(
        padding: const EdgeInsets.only(left: 4.0),
        child: SvgPicture.asset(leftImage, height: 40),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 4.0),
          child: SvgPicture.asset(rightImage, height: 30),
        ),
      ],
    );
  }
}
