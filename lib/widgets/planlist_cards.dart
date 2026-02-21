import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:turfnpark/utils/app_text_styles.dart';
import 'package:turfnpark/utils/spacing.dart';

class PlanListCard extends StatelessWidget {
  final String imagePath;
  final String planName;
  final String coverAmount;
  final String price;
  final VoidCallback onTap;
  final String title;

  const PlanListCard({
    super.key,
    required this.imagePath,
    required this.planName,
    required this.coverAmount,
    required this.price,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18.r),
      child: Container(
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 14,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          children: [
            /// 🟠 Logo Container
            Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                color: const Color(0xffF5F6FA),
                borderRadius: BorderRadius.circular(14.r),
              ),
              child: Image.asset(
                imagePath,
                width: 46.w,
                height: 46.w,
                fit: BoxFit.contain,
              ),
            ),

            AppSpace.w12,

            /// 🟢 Plan Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(planName, style: AppTextStyles.cardTitle),
                  AppSpace.h4,
                  Text(title, style: AppTextStyles.cardSubtitle),
                  AppSpace.h8,
                  Text("Cover: $coverAmount", style: AppTextStyles.cardMeta),
                ],
              ),
            ),

            /// 🟠 Price & Arrow
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 14.w,
                    vertical: 6.h,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xffF58220),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Text(price, style: AppTextStyles.badgeText),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
