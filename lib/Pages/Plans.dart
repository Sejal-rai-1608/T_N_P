import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:turfnpark/widgets/appbar.dart';
import 'package:turfnpark/widgets/planlist_cards.dart';
import 'package:turfnpark/Pages/plandetail.dart';

class Plans extends StatelessWidget {
  const Plans({super.key});

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
                  "73 Plans for self",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 180.0, top: 28.0),
                child: SvgPicture.asset("assets/icons/option.svg", height: 14),
              ),
            ],
          ),
          const SizedBox(height: 20),
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
                const SizedBox(height: 16),
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
                const SizedBox(height: 16),
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
                // PlanCard(
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
                const SizedBox(height: 16),
                Center(
                  child: SizedBox(
                    height: 30,
                    width: 150,
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                          color: Color(0xffF58220),
                          width: 1.5,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        backgroundColor: Colors.white,
                      ),
                      child: const Text(
                        "View All Plans",
                        style: TextStyle(
                          color: Color(0xffF58220),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
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
