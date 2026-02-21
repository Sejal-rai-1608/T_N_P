import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:turfnpark/utils/app_text_styles.dart';
import 'package:turfnpark/utils/spacing.dart';

class PlanDetailCard extends StatelessWidget {
  final String imagePath;
  final String planName;
  final String coverAmount;
  final String price;

  const PlanDetailCard({
    super.key,
    required this.imagePath,
    required this.planName,
    required this.coverAmount,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white60,
      elevation: 3,
      shadowColor: Colors.black.withOpacity(0.08),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.r)),
      margin: EdgeInsets.zero,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
        child: Row(
          children: [
            /// 🔹 ICON
            Container(
              height: 52.w,
              width: 52.w,
              decoration: BoxDecoration(
                color: const Color(0xffF7F8FA),
                borderRadius: BorderRadius.circular(14.r),
              ),
              child: Padding(
                padding: EdgeInsets.all(10.w),
                child: Image.asset(imagePath),
              ),
            ),

            AppSpace.w12,

            /// 🔹 PLAN DETAILS
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(planName, style: AppTextStyles.cardTitle),

                  AppSpace.h4,

                  Text(
                    "Coverage up to $coverAmount",
                    style: AppTextStyles.hintText.copyWith(fontSize: 13.sp),
                  ),
                ],
              ),
            ),

            /// 🔹 PRICE
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  price,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xffF58220),
                  ),
                ),

                AppSpace.h4,

                Text(
                  "per year",
                  style: AppTextStyles.hintText.copyWith(fontSize: 11.sp),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
