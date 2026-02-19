import 'package:flutter/material.dart';
import 'package:turfnpark/widgets/appbar.dart';
import 'package:turfnpark/widgets/covereage_section.dart';
import 'package:turfnpark/widgets/plandetail_card.dart';

class PlanDetail extends StatelessWidget {
  const PlanDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: CustomAppbar(
          leftImage: "assets/logo/Logo.svg",
          rightImage: "assets/icons/notification.svg",
        ),
      ),
      body: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16.0, left: 8.0),
                // child: Icon(
                //   Icons.arrow_back,
                //   size: 30,
                //   fontWeight: FontWeight.w400,
                //   color: const Color.fromARGB(255, 0, 0, 0),
                // ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 14.0),
                child: Text(
                  "Plan Details",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PlanDetailCard(
                  imagePath: "assets/insurance/care.png",
                  planName: "Care Supreme",
                  coverAmount: "₹5 Lakhs",
                  price: "₹716/months",
                ),

                const SizedBox(height: 20),

                const SizedBox(height: 10),

                CoverageSection(
                  items: [
                    "Single Private AC Room",
                    "Restoration of cover",
                    "No Claim Bonus",
                    "Free health checkup",
                    "Existing Illness cover",
                    "Cashless Hospitalization",
                    "Pre and post hospitalization",
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
