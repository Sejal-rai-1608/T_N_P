// import 'package:flutter/material.dart';
// //import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:turfnpark/Pages/Profile.dart';
// import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

// // import your pages
// // import 'Pages/Profile.dart';
// // import 'Pages/Claims.dart';
// // import 'Pages/Policies.dart';
// // import 'Pages/Profile.dart';
// // import 'Pages/Help.dart';

// class MainScreen extends StatelessWidget {
//   MainScreen({super.key});

//   final PersistentTabController _controller = PersistentTabController(
//     initialIndex: 2,
//   ); // Policies selected

//   List<Widget> _screens() {
//     return const [
//       Profile(),
//       Profile(),
//       Profile(),
//       Profile(),
//       Profile(),
//     ]; // Replace with actual pages
//   }

//   List<PersistentBottomNavBarItem> _navItems() {
//     const inactive = Color(0xff8A94A6);
//     const active = Color(0xffF58220);

//     return [
//       PersistentBottomNavBarItem(
//         contentPadding: 0.0,
//         icon: SvgPicture.asset(
//           "assets/bottomnav/home.svg",
//           height: 26,
//           color: active,
//         ),
//         inactiveIcon: SvgPicture.asset(
//           "assets/bottomnav/home.svg",
//           height: 26,
//           color: inactive,
//         ),

//         title: "Home",
//         textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
//         activeColorPrimary: active,
//         inactiveColorPrimary: inactive,
//       ),

//       PersistentBottomNavBarItem(
//         contentPadding: 0.0,
//         icon: SvgPicture.asset(
//           "assets/bottomnav/claim.svg",
//           height: 26,
//           color: active,
//         ),
//         inactiveIcon: SvgPicture.asset(
//           "assets/bottomnav/claim.svg",
//           height: 26,
//           color: inactive,
//         ),
//         title: "Claims",
//         textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//         activeColorPrimary: active,
//         inactiveColorPrimary: inactive,
//       ),

//       PersistentBottomNavBarItem(
//         contentPadding: 0.0,
//         icon: Stack(
//           alignment: Alignment.center,
//           children: [
//             SvgPicture.asset("assets/bottomnav/policy_bg.svg", height: 40),
//             SvgPicture.asset(
//               "assets/bottomnav/policy.svg",
//               height: 26,

//               color: Colors.white,
//             ),
//           ],
//         ),
//         title: "Policies",
//         activeColorPrimary: Colors.transparent,
//         inactiveColorPrimary: Colors.transparent,
//       ),
//       // PersistentBottomNavBarItem(
//       //   icon: SvgPicture.asset(
//       //     "assets/bottomnav/account.svg",
//       //     height: 20,
//       //     color: active,
//       //   ),
//       //   inactiveIcon: SvgPicture.asset(
//       //     "assets/bottomnav/account.svg",
//       //     height: 20,
//       //     color: inactive,
//       //   ),
//       //   title: "Account",
//       //   activeColorPrimary: active,
//       //   inactiveColorPrimary: inactive,
//       // ),
//       PersistentBottomNavBarItem(
//         contentPadding: 0.0,
//         icon: SvgPicture.asset(
//           "assets/bottomnav/account.svg",
//           height: 20,
//           color: active,
//         ),
//         inactiveIcon: SvgPicture.asset(
//           "assets/bottomnav/account.svg",
//           height: 20,
//           color: inactive,
//         ),
//         title: "Account",
//         activeColorPrimary: active,
//         inactiveColorPrimary: inactive,
//       ),

//       PersistentBottomNavBarItem(
//         contentPadding: 0.0,
//         icon: SvgPicture.asset(
//           "assets/bottomnav/help.svg",
//           height: 20,
//           color: active,
//         ),
//         inactiveIcon: SvgPicture.asset(
//           "assets/bottomnav/help.svg",
//           height: 20,
//           color: inactive,
//         ),
//         title: "Help",
//         activeColorPrimary: active,
//         inactiveColorPrimary: inactive,
//       ),
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return PersistentTabView(
//       context,
//       controller: _controller,
//       screens: _screens(),
//       items: _navItems(),

//       navBarStyle: NavBarStyle.style15,
//       backgroundColor: Colors.black,
//       confineToSafeArea: true,
//       handleAndroidBackButtonPress: true,

//       resizeToAvoidBottomInset: true,
//       stateManagement: true,
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:turfnpark/Pages/Plans.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import 'package:turfnpark/Pages/Profile.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final PersistentTabController _controller = PersistentTabController(
    initialIndex: 2,
  );

  Color get active => const Color(0xffF58220);
  Color get inactive => const Color(0xff8A94A6);

  Widget svgIcon(String path, Color color, {double size = 22}) {
    return SvgPicture.asset(
      path,
      height: size,
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      avoidBottomPadding: false,

      //   context,
      controller: _controller,

      tabs: [
        PersistentTabConfig(
          screen: const Profile(),
          item: ItemConfig(
            activeForegroundColor: Colors.orange,
            icon: navIconWithTitle(
              iconPath: "assets/bottomnav/home.svg",
              title: "Home",
            ),
          ),
        ),
        PersistentTabConfig(
          screen: const Profile(),
          item: ItemConfig(
            activeForegroundColor: Colors.orange,
            inactiveBackgroundColor: Colors.grey,
            icon: navIconWithTitle(
              iconPath: "assets/bottomnav/claim.svg",

              title: "Claims",
            ),
            //  activeIcon: svgIcon("assets/bottomnav/claim.svg", active),
          ),
        ),

        // 🔥 CENTER TAB
        PersistentTabConfig(
          screen: const Plans(),
          item: ItemConfig(
            activeForegroundColor: Colors.orange,
            inactiveBackgroundColor: Colors.grey,
            icon: Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset("assets/bottomnav/policy_bg.svg", height: 48),
                SvgPicture.asset(
                  "assets/bottomnav/policy.svg",
                  height: 24,
                  colorFilter: const ColorFilter.mode(
                    Colors.white,

                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),

            title: "Policies", // no label for center
          ),
        ),

        PersistentTabConfig(
          screen: const Profile(),
          item: ItemConfig(
            activeForegroundColor: Colors.orange,
            inactiveBackgroundColor: Colors.grey,
            icon: navIconWithTitle(
              iconPath: "assets/bottomnav/account.svg",

              title: "Account",
            ),

            //  activeIcon: svgIcon("assets/bottomnav/account.svg", active),
          ),
        ),
        PersistentTabConfig(
          screen: const Profile(),
          item: ItemConfig(
            activeForegroundColor: Colors.orange,
            inactiveBackgroundColor: Colors.transparent,
            icon: navIconWithTitle(
              iconPath: "assets/bottomnav/help.svg",
              title: "Help",
            ),
          ),
        ),
      ],

      // 🔥 REQUIRED IN V2
      navBarBuilder: (navBarConfig) =>
          Style13BottomNavBar(navBarConfig: navBarConfig, height: 60),

      backgroundColor: Colors.white,

      resizeToAvoidBottomInset: true,
    );
  }
}

Widget navIconWithTitle({
  required String iconPath,
  required String title,

  double iconSize = 22,
  double gap = 4, // 🔥 CONTROL SPACING HERE
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SvgPicture.asset(
        iconPath,
        height: iconSize,
        colorFilter: ColorFilter.mode(Colors.grey, BlendMode.srcIn),
      ),
      SizedBox(height: gap), // 🔥 ICON–TITLE GAP
      Text(
        title,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          color: Colors.grey,
        ),
      ),
    ],
  );
}
