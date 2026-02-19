import 'package:flutter/material.dart';
import 'package:turfnpark/Categories%20Sub_Pages/insurance_page.dart';
import 'package:turfnpark/widgets/appbar.dart';

class AllPlansPage extends StatelessWidget {
  const AllPlansPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: CustomAppbar(
          leftImage: "assets/logo/Logo.svg",
          rightImage: "assets/icons/notification.svg",
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "All Available Plans",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

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

            const SizedBox(height: 20),

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

            const SizedBox(height: 20),


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

            const SizedBox(height: 20),


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

            const SizedBox(height: 30),
          ],
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
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),

        SizedBox(
          height: 115,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const InsurancePage(),
                    ),
                  );
                },
                child: Container(
                  width: 85,
                  margin: const EdgeInsets.only(right: 12),
                  child: Column(
                    children: [
                      /// 🔹 CARD
                      Card(
                        elevation: 4,
                        shadowColor: Colors.orange.withOpacity(0.2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: SizedBox(
                          height: 65,
                          width: 65,
                          child: Center(
                            child: Image.asset(
                              item["image"]!,
                              height: 32,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 6),

                      /// 🔹 TITLE
                      Text(
                        item["title"]!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                        ),
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
