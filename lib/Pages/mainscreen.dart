import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:turfnpark/Pages/Profile.dart';
import 'package:turfnpark/Pages/claim_page.dart';
import 'package:turfnpark/Pages/Plans.dart';
import 'package:turfnpark/Pages/acoount_page.dart';
import 'package:turfnpark/Pages/help_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  /// Screens (IndexedStack preserves state)
  final List<Widget> _screens = const [
    Profile(),
    ClaimPage(),
    Plans(),
    AccountPage(),
    HelpPage(),
  ];

  static const Color activeColor = Color(0xffF58220);
  static const Color inactiveColor = Color(0xff8A94A6);

  /// Reusable SVG icon builder
  Widget navIcon(String path, bool active) {
    return SvgPicture.asset(
      path,
      height: 22.sp,
      colorFilter: ColorFilter.mode(
        active ? activeColor : inactiveColor,
        BlendMode.srcIn,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,

      body: IndexedStack(index: _currentIndex, children: _screens),

      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 10.h),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(28.r),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.92),
                  borderRadius: BorderRadius.circular(28.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.06),
                      blurRadius: 18.r,
                      offset: Offset(0, 6.h),
                    ),
                  ],
                ),
                child: BottomNavigationBar(
                  currentIndex: _currentIndex,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: activeColor,
                  unselectedItemColor: inactiveColor,
                  showUnselectedLabels: true,
                  selectedFontSize: 12.sp,
                  unselectedFontSize: 11.sp,

                  onTap: (index) {
                    setState(() => _currentIndex = index);
                  },

                  items: [
                    /// HOME
                    BottomNavigationBarItem(
                      icon: navIcon("assets/bottomnav/home.svg", false),
                      activeIcon: navIcon("assets/bottomnav/home.svg", true),
                      label: "Home",
                    ),

                    /// CLAIMS
                    BottomNavigationBarItem(
                      icon: navIcon("assets/bottomnav/claim.svg", false),
                      activeIcon: navIcon("assets/bottomnav/claim.svg", true),
                      label: "Claims",
                    ),

                    /// ⭐ CENTER BUTTON
                    BottomNavigationBarItem(
                      icon: Container(
                        height: 48.w,
                        width: 48.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: activeColor,
                          boxShadow: [
                            BoxShadow(
                              color: activeColor.withOpacity(.35),
                              blurRadius: 12.r,
                              offset: Offset(0, 4.h),
                            ),
                          ],
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            "assets/bottomnav/policy.svg",
                            height: 24.sp,
                            colorFilter: const ColorFilter.mode(
                              Colors.white,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),
                      label: "Policies",
                    ),

                    /// ACCOUNT
                    BottomNavigationBarItem(
                      icon: navIcon("assets/bottomnav/account.svg", false),
                      activeIcon: navIcon("assets/bottomnav/account.svg", true),
                      label: "Account",
                    ),

                    /// HELP
                    BottomNavigationBarItem(
                      icon: navIcon("assets/bottomnav/help.svg", false),
                      activeIcon: navIcon("assets/bottomnav/help.svg", true),
                      label: "Help",
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
