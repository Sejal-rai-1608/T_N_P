import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:turfnpark/utils/app_text_styles.dart';
import 'package:turfnpark/utils/spacing.dart';
import 'package:turfnpark/widgets/appbar.dart';
import 'package:turfnpark/widgets/outlined_button.dart';
import 'package:turfnpark/widgets/planlist_cards.dart';
import 'package:turfnpark/Pages/plandetail.dart';

class Plans extends StatelessWidget {
  const Plans({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: const CustomAppbar(
        showBackButton: false,
        leftImage: "assets/logo/Logo.svg",
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "73 Plans for self",
                    style: AppTextStyles.mainTitle,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Icon(Icons.tune, size: 22.w, color: Colors.black),
              ],
            ),
          ),
          AppSpace.h10,

          Expanded(
            child: ListView(
              children: [
                PlanListCard(
                  imagePath: "assets/insurance/care.png",
                  planName: "Care Supreme",
                  coverAmount: "₹5 Lakhs",
                  price: "₹893/months",
                  title: 'View 12 more plans \n view features',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PlanDetail(
                          // planName: "Care Supreme",
                          // coverAmount: "₹5 Lakhs",
                          // price: "₹593/months",
                        ),
                      ),
                    );
                  },
                ),
                AppSpace.h14,
                PlanListCard(
                  imagePath: "assets/insurance/maxlife.png",
                  planName: "Max Life",
                  coverAmount: "₹5 Lakhs",
                  price: "₹593/months",
                  title: 'View 12 more plans \n view features',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PlanDetail(
                          // planName: "Max Life",
                          // coverAmount: "₹5 Lakhs",
                          // price: "₹593/months",
                        ),
                      ),
                    );
                  },
                ),
                AppSpace.h14,
                PlanListCard(
                  imagePath: "assets/insurance/activefp.png",
                  planName: "Active Fit Plus",
                  coverAmount: "₹5 Lakhs",
                  price: "₹503/months",
                  title: 'View 8 more plans \n view features',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PlanDetail(
                          // planName: "Max Life",
                          // coverAmount: "₹5 Lakhs",
                          // price: "₹593/months",
                        ),
                      ),
                    );
                  },
                ),
                // const SizedBox(height: 16),
                // PlanListCard(
                //   imagePath: "assets/insurance/star.png",
                //   planName: "Young Star Gold",
                //   coverAmount: "₹5 Lakhs",
                //   price: "₹593/months",
                //   title: 'View  6 more plans \n view features',
                // ),
                // const SizedBox(height: 16),
                // PlanCard(
                //   imagePath: "assets/insurance/care.png",
                //   planName: "Care Supreme",
                //   coverAmount: "₹5 Lakhs",
                //   price: "₹593/months",
                //   title: 'View 12 more plans \n view features',
                // ),
                AppSpace.h14,
                Center(
                  child: OutlinedButtonWidget(
                    text: "View All Plans",
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
