import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:turfnpark/Categories%20Sub_Pages/insurance_page.dart';
import 'package:turfnpark/utils/app_text_styles.dart';
import 'package:turfnpark/utils/spacing.dart';
import 'package:turfnpark/widgets/appbar.dart';

class AllPlansPage extends StatelessWidget {
  const AllPlansPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: Colors.white,

        appBar: const CustomAppbar(leftImage: "assets/logo/Logo.svg"),

        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("All Available Plans", style: AppTextStyles.mainTitle),
              AppSpace.h14,
              buildSection(
                context,
                title: "Plus Features",
                items: [
                  {
                    "image": "assets/all_categories/health_assistance.png",
                    "title": "Health \nAssistant",
                  },
                  {
                    "image": "assets/all_categories/wellness_feature.png",
                    "title": "Wellness \nFeature",
                  },
                  {
                    "image": "assets/all_categories/vehicle_review.png",
                    "title": "Vehicle \nReview",
                  },
                ],
              ),

              AppSpace.h14,

              buildSection(
                context,
                title: "Life Insurance",
                items: [
                  {
                    "image": "assets/all_categories/term_life_insurance.png",
                    "title": "Term Life \nInsurance",
                  },
                  {
                    "image": "assets/all_categories/spouce_plans.png",
                    "title": "Spouse \nPlan",
                  },
                  {
                    "image": "assets/all_categories/return_of_premium.png",
                    "title": "Return of \nPremium",
                  },
                  {
                    "image": "assets/all_categories/saral_jeevan_bima.png",
                    "title": "Saral Jeevan \nBima",
                  },
                ],
              ),

              AppSpace.h14,

              buildSection(
                context,
                title: "Health Insurance",
                items: [
                  {
                    "image": "assets/all_categories/health_insurance.png",
                    "title": "Health \nInsurance",
                  },
                  {
                    "image": "assets/all_categories/investment_plans.png",
                    "title": "Investment \nPlan",
                  },
                  {
                    "image": "assets/all_categories/retirement_plans.png",
                    "title": "Retirement \nPlans",
                  },
                  {
                    "image": "assets/all_categories/gureented_returns.png",
                    "title": "Guaranteed \nReturns",
                  },
                ],
              ),

              AppSpace.h14,

              buildSection(
                context,
                title: "Tax Saving Investment",
                items: [
                  {
                    "image": "assets/all_categories/tax_saving_investment.png",
                    "title": "Tax Saving \nInvestment",
                  },
                  {
                    "image": "assets/all_categories/child_saving_plans.png",
                    "title": "Child Saving \nPlans",
                  },
                ],
              ),

              AppSpace.h14,
            ],
          ),
        ),
      ),
    );
  }

  /// 🔥 Reusable Section Builder
  Widget buildSection(
    BuildContext context, {
    required String title,
    required List<Map<String, String>> items,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.subTitle),
        AppSpace.h10,

        SizedBox(
          height: 115.h, // responsive height
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const InsurancePage()),
                  );
                },
                child: Container(
                  width: 85.w, // responsive width
                  margin: EdgeInsets.only(right: 12.w),
                  child: Column(
                    children: [
                      Card(
                        elevation: 4,
                        shadowColor: Colors.orange.withOpacity(0.2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: SizedBox(
                          height: 65.h,
                          width: 65.w,
                          child: Center(
                            child: Image.asset(
                              item["image"]!,
                              height: 32.h, // responsive image height
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      AppSpace.h8,
                      Text(
                        item["title"]!,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.smallText,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
