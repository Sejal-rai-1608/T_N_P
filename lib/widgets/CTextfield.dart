import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';

class CTextfield extends StatelessWidget {
  final String hintText;
  final String? text;
  final Widget? prefix;

  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;

  final bool isDropdown;
  final List<String>? dropdownItems;
  final String? value;
  final Function(String?)? onChanged;

  final int maxLines;
  final double? height;
  final String? errorText;
  final String? icondata;

  const CTextfield({
    super.key,
    required this.hintText,
    this.text,
    this.prefix,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.suffixIcon,
    this.isDropdown = false,
    this.dropdownItems,
    this.value,
    this.onChanged,
    this.maxLines = 1,
    this.height,
    this.errorText,
    this.icondata,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 🔹 text
          if (text != null) ...[
            Text(
              text!,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
          ],

          /// 🔹 FIELD CONTAINER
          SizedBox(
            height: height,
            child: isDropdown
                ? DropdownButtonFormField<String>(
                    dropdownColor: Colors.white,
                    value: value,
                    hint: Text(hintText),
                    items: dropdownItems!
                        .map(
                          (item) => DropdownMenuItem(
                            value: item,
                            child: Row(
                              children: [
                                Icon(
                                  getIcon(item),
                                  size: 20,
                                  color: Colors.orange,
                                ),
                                const SizedBox(width: 10),
                                Text(item),
                              ],
                            ),
                          ),
                        )
                        .toList(),

                    onChanged: onChanged,
                    decoration: _decoration(),
                  )
                : TextField(
                    controller: controller,
                    keyboardType: keyboardType,
                    obscureText: obscureText,
                    maxLines: height != null ? null : maxLines,
                    expands: height != null,
                    decoration: _decoration(),
                  ),
          ),

          // 🔹 ERROR TEXT
          if (errorText != null) ...[
            const SizedBox(height: 6),
            Text(
              errorText!,
              style: const TextStyle(color: Colors.red, fontSize: 13),
            ),
          ],
        ],
      ),
    );
  }

  IconData getIcon(String title) {
    switch (title.toLowerCase()) {
      case "health":
        return Icons.health_and_safety;
      case "car":
        return Icons.directions_car;
      case "life":
        return Icons.favorite;
      case "home":
        return Icons.home;
      default:
        return Icons.category;
    }
  }

  InputDecoration _decoration() {
    return InputDecoration(
      hintText: hintText,
      filled: true,
      fillColor: Colors.white,
      //prefixIconColor: Colors.grey,
      contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),

      prefixIconConstraints: const BoxConstraints(minWidth: 10, minHeight: 10),
      prefixIcon: prefix != null
          ? Padding(padding: const EdgeInsets.only(left: 16), child: prefix)
          : null,

      suffixIcon: suffixIcon,

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Color(0xff9C9C9C)),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Colors.orange, width: 1.5),
      ),
    );
  }
}
