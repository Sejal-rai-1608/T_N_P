import 'package:flutter/material.dart';
import 'package:turfnpark/widgets/appbar.dart';
import 'package:turfnpark/widgets/categories.dart';

class AllPlansPage extends StatelessWidget {
  const AllPlansPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: CustomAppbar(
          leftImage: "assets/logo/Branding.svg",
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

            // Plus Features Section
            const Text(
              "Plus Features",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            buildCategoryRow(const [
              InsuranceItem(
                imagePath: "assets/all_categories/health_assistance.png",
                title: "Health \nAssistant",
              ),
              InsuranceItem(
                imagePath: "assets/all_categories/wellness_feature.png",
                title: "Wellness \nFeature",
              ),
              InsuranceItem(
                imagePath: "assets/all_categories/vehicle_review.png",
                title: "Vehicle \nReview",
              ),
            ]),

            const SizedBox(height: 20),

            // Life Insurance Section
            const Text(
              "Life Insurance",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            buildCategoryRow(const [
              InsuranceItem(
                imagePath: "assets/all_categories/term_life_insurance.png",
                title: "Term Life \nInsurance",
              ),
              InsuranceItem(
                imagePath:
                    "assets/all_categories/spouce_plans.png", // CHANGED: spouse_plan.png → spouce_plans.png
                title: "Spouse \nPlan",
              ),
              InsuranceItem(
                imagePath: "assets/all_categories/return_of_premium.png",
                title: "Return of \nPremium",
              ),
              InsuranceItem(
                imagePath: "assets/all_categories/saral_jeevan_bima.png",
                title: "Saral Jeevan \nBima",
              ),
            ]),

            const SizedBox(height: 20),

            // Health Insurance Section
            const Text(
              "Health Insurance",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            buildCategoryRow(const [
              InsuranceItem(
                imagePath: "assets/all_categories/health_insurance.png",
                title: "Health \nInsurance",
              ),
              InsuranceItem(
                imagePath:
                    "assets/all_categories/investment_plans.png", // CHANGED: investment_plan.png → investment_plans.png
                title: "Investment \nPlan",
              ),
              InsuranceItem(
                imagePath:
                    "assets/all_categories/retirement_plans.png", // CHANGED: retirement_plan.png → retirement_plans.png
                title: "Retirement \nPlans",
              ),
              InsuranceItem(
                imagePath: "assets/all_categories/gureented_returns.png",
                title: "Guaranteed \nReturns",
              ),
            ]),

            const SizedBox(height: 20),

            // Tax Saving Investment Section
            const Text(
              "Tax Saving Investment",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            buildCategoryRow(const [
              InsuranceItem(
                imagePath:
                    "assets/all_categories/tax_saving_investment.png", // CHANGED: tax_saving_plans.png → tax_saving_investment.png
                title: "Tax Saving \nInvestment",
              ),
              InsuranceItem(
                imagePath: "assets/all_categories/child_saving_plans.png",
                title: "Child Saving \nPlans",
              ),
            ]),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Build horizontal row of insurance items
  Widget buildCategoryRow(List<InsuranceItem> items) {
    return SizedBox(
      height: 115, // increased slightly to fit title below
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Container(
            width: 80,
            margin: const EdgeInsets.only(right: 10),
            child: Column(
              children: [
                // CARD
                Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SizedBox(
                    height: 60,
                    width: 60,
                    child: Center(
                      child: Image.asset(
                        items[index].imagePath,
                        height: 32,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 6),

                // TITLE OUTSIDE CARD
                Text(
                  items[index].title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
