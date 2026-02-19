import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:turfnpark/Categories%20Sub_Pages/insurance_page.dart';
import 'package:turfnpark/widgets/appbar.dart';
import 'package:turfnpark/widgets/policy_card.dart';
import 'package:turfnpark/widgets/categories.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'all_plans_page.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int _currentIndex = 0;
  int _plansIndex = 0;

  final List<String> banners = [
    'assets/images/bann.svg',
    'assets/images/bann.svg',
    'assets/images/bann.svg',
  ];

  final List<String> plansBanners = [
    "assets/images/Plans Banner.svg",
    "assets/images/Plans Banner.svg",
    "assets/images/Plans Banner.svg",
  ];

  /// 🔥 Insurance List
  final List<Map<String, String>> insuranceList = [
    {"image": "assets/images/Frame 51.png", "title": "Health \n Insurance"},
    {"image": "assets/images/Frame 51-1.png", "title": "Travel \n Insurance"},
    {
      "image": "assets/images/Frame 51-2.png",
      "title": "Two wheeler \n Insurance",
    },
    {
      "image": "assets/images/Frame 51-3.png",
      "title": "Term Life \n Insurance",
    },
    {"image": "assets/images/Frame 51-4.png", "title": "Family \n Insurance"},
    {"image": "assets/images/Frame 51-5.png", "title": "Investment \n Plans"},
    {"image": "assets/images/Frame 51-6.png", "title": "Employee \n Plans"},
    {"image": "assets/images/Frame 51-7.png", "title": "Car \n Insurance"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: CustomAppbar(
        leftImage: "assets/logo/Logo.svg",
        rightImage: "assets/icons/notification.svg",
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// 🔹 Greeting
                const Text(
                  "Hello, Sejal",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 4),
                const Text(
                  "Welcome Back",
                  style: TextStyle(fontSize: 22, color: Colors.grey),
                ),
                const SizedBox(height: 15),

                /// 🔥 Top Carousel
                CarouselSlider(
                  options: CarouselOptions(
                    height: 160,
                    viewportFraction: 1,
                    autoPlay: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                  items: banners.map((path) {
                    return SvgPicture.asset(
                      path,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    );
                  }).toList(),
                ),

                const SizedBox(height: 10),

                /// 🔥 Dots Indicator
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    banners.length,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      height: 8,
                      width: _currentIndex == index ? 16 : 8,
                      decoration: BoxDecoration(
                        color: _currentIndex == index
                            ? const Color(0xffF58220)
                            : Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                /// 🔹 Categories Title
                const Text(
                  "Categories",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 20),

                /// 🔥 Insurance Grid
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: insuranceList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.75,

                  ),
                  itemBuilder: (context, index) {
                    final item = insuranceList[index];

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const InsurancePage(),
                          ),
                        );
                      },
                      child: InsuranceItem(
                        imagePath: item["image"]!,
                        title: item["title"]!,
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),

                Center(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AllPlansPage(),
                        ),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xffF58220)),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 10,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      "View All Plans",
                      style: TextStyle(
                        color: Color(0xffF58220),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                /// 🔹 Why PolicyPlus
                const Text(
                  "Why PolicyPlus?",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 20),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: const [
                      PolicyCard(
                        emoji: "📊",
                        title: "Compare Plans",
                        description: "Compare insurance plans side by side.",
                      ),
                      PolicyCard(
                        emoji: "💰",
                        title: "Save Money",
                        description: "Find affordable insurance options.",
                      ),
                      PolicyCard(
                        emoji: "📋",
                        title: "Easy Claims",
                        description: "File claims easily & quickly.",
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 30.h),

                /// 🔹 Popular Plus
                const Text(
                  "Popular Plus",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 20.h),

                CarouselSlider(
                  options: CarouselOptions(
                    height: 115.h,
                    viewportFraction: 1,
                    autoPlay: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _plansIndex = index;
                      });
                    },
                  ),
                  items: plansBanners.map((path) {
                    return SvgPicture.asset(
                      path,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    );
                  }).toList(),
                ),

                SizedBox(height: 12.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    plansBanners.length,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      height: 8,
                      width: _plansIndex == index ? 16 : 8,
                      decoration: BoxDecoration(
                        color: _plansIndex == index
                            ? const Color(0xffF58220)
                            : Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
