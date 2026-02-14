import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:turfnpark/widgets/appbar.dart';

class Plans extends StatelessWidget {
  const Plans({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: CustomAppbar(
          leftImage: "assets/logo/Branding.svg",
          rightImage: "assets/icons/notification.svg",
        ),
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16.0, left: 8.0),
            child: Icon(
              Icons.arrow_back,
              size: 30,
              fontWeight: FontWeight.w400,
              color: const Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 14.0),
            child: Text(
              "73 Plans for self",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 155.0, top: 28.0),
            child: SvgPicture.asset("assets/icons/option.svg", height: 16),
          ),
        ],
      ),
    );
  }
}
