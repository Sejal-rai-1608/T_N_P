import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InsuranceItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final VoidCallback? onTap;

  const InsuranceItem({
    super.key,
    required this.imagePath,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(imagePath, height: 60.h),
        const SizedBox(height: 6),
        Text(title, textAlign: TextAlign.center),
      ],
    );
  }
}
