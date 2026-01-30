import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CTextfield extends StatelessWidget {
  final String hintText;
  final String prefixSvg;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;

  const CTextfield({
    super.key,
    required this.hintText,
    required this.prefixSvg,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 20,
          ),
      
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12),
            child: SvgPicture.asset(
              prefixSvg,
              width: 22,
              height: 22,
              colorFilter: const ColorFilter.mode(
                Colors.green,
                BlendMode.srcIn,
              ),
            ),
          ),
      
          suffixIcon: suffixIcon,
          // contentPadding: const EdgeInsets.symmetric(
          //   vertical: 16,
          //   horizontal: 10,
          // ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.green),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.green, width: 1.5),
          ),
        ),
      ),
    );
  }
}
