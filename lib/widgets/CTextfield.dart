import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CTextfield extends StatelessWidget {
  final String hintText;
  final String prefixSvg;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;
  final String? text;

  const CTextfield({
    super.key,
    required this.hintText,
    required this.prefixSvg,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.suffixIcon,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (text != null) ...[
            Text(
              text!,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 6),
          ],
          TextField(
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
                    Color.fromARGB(255, 81, 81, 81),
                    BlendMode.srcIn,
                  ),
                ),
              ),
              suffixIcon: suffixIcon,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 156, 156, 156),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 156, 156, 156),
                  width: 1.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
