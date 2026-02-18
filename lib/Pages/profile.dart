import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:turfnpark/Pages/all_plans_page.dart';
import 'package:turfnpark/widgets/appbar.dart';
import 'package:turfnpark/widgets/policy_card.dart';
import '../widgets/categories.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:turfnpark/Pages/mainscreen.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      //surfaceTintColor: Colors.white,
      appBar: CustomAppbar(
        leftImage: "assets/logo/Branding.svg",
        rightImage: "assets/icons/notification.svg",
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello, Sejal",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "Welcome Back",
                  style: TextStyle(
                    color: Color.fromARGB(255, 122, 121, 121),
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 10),
                Column(
                  children: [
                    /// 🔥 Carousel Slider
                    CarouselSlider(
                      options: CarouselOptions(
                        //aspectRatio: 16 / 10,
                        height: 160, // adjust if needed
                        viewportFraction: 1,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        enlargeCenterPage: false,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                      ),
                      items: banners.map((imagePath) {
                        return Builder(
                          builder: (BuildContext context) {
                            return SvgPicture.asset(
                              imagePath,
                              width: double.infinity,
                              fit: BoxFit.fill,
                            );
                          },
                        );
                      }).toList(),
                    ),

                    const SizedBox(height: 10),

                    /// 🔥 Indicator Dots
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
                  ],
                ),
                const Text(
                  "Categories",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        InsuranceItem(
                          imagePath: "assets/images/Frame 51.png",
                          title: "Health \n Insurance",
                        ),
                        InsuranceItem(
                          imagePath: "assets/images/Frame 51-1.png",
                          title: "Travel \n Insurance",
                        ),
                        InsuranceItem(
                          imagePath: "assets/images/Frame 51-2.png",
                          title: "Two wheeler \n Insurance",
                        ),
                        InsuranceItem(
                          imagePath: "assets/images/Frame 51-3.png",
                          title: "Term Life \n Insurance",
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        InsuranceItem(
                          imagePath: "assets/images/Frame 51-4.png",
                          title: "Family \n Insurance",
                        ),
                        InsuranceItem(
                          imagePath: "assets/images/Frame 51-5.png",
                          title: "Investment \n Plans",
                        ),
                        InsuranceItem(
                          imagePath: "assets/images/Frame 51-6.png",
                          title: "Employee \n Plans",
                        ),
                        InsuranceItem(
                          imagePath: "assets/images/Frame 51-7.png",
                          title: "Car \n Insurance",
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Center(
                  child: Container(
                    // alignment: Alignment.center,
                    height: 30,
                    width: 150,

                    // decoration: BoxDecoration(
                    //   color: Color.fromARGB(255, 255, 255, 255),
                    //   border: Border.all(color: const Color(0xffF58220)),

                    //   borderRadius: BorderRadius.circular(5),
                    // ),
                    child: Center(
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
                          side: const BorderSide(
                            color: Color(0xffF58220),
                            width: 1,
                          ),

                          //foregroundColor: const Color(0xffF58220),
                          minimumSize: const Size(150, 32),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        child: const Text(
                          "view all plans",
                          style: TextStyle(
                            color: Color(0xffF58220),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  "Why PolicyPlus?",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      PolicyCard(
                        emoji: "📊",
                        title: "Compare Plans",
                        description: "Compare insurance plans side by side.",
                      ),
                      PolicyCard(
                        emoji: "💰",
                        title: "Save Money",
                        description:
                            "Find the most affordable insurance options.",
                      ),
                      PolicyCard(
                        emoji: "📋",
                        title: "Easy Claims",
                        description:
                            "File claims easily and get quick payouts.",
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30.h),

                Text(
                  "Popular Plus",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.h),
                Column(
                  children: [
                    /// 🔥 Plans Carousel
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 115.h,
                        viewportFraction: 1,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
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

                    /// 🔥 Indicator Dots
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
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: const BottomNav(),
    );
  }
}
