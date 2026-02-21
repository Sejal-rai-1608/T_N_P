import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:turfnpark/widgets/appbar.dart';
import 'package:turfnpark/widgets/notification_card.dart';

class NotificationPage extends StatelessWidget {
  static const String routeName = "/notification";
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final notifications = [
      {
        "title": "Policy Approved",
        "subtitle": "Your health insurance policy has been approved.",
        "time": "2 min ago",
        "icon": Icons.verified,
      },
      {
        "title": "Payment Successful",
        "subtitle": "₹2,500 payment received successfully.",
        "time": "1 hour ago",
        "icon": Icons.payment,
      },
      {
        "title": "Reminder",
        "subtitle": "Your policy renewal is due tomorrow.",
        "time": "Yesterday",
        "icon": Icons.notifications_active,
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xffF7F7F7),
      appBar: const CustomAppbar(
        title: "Notifications",
        showBackButton: true,
        hideRightIcon: true,
      ),

      body: notifications.isEmpty
          ? Center(
              child: Text(
                "No notifications yet",
                style: TextStyle(fontSize: 16.sp, color: Colors.grey),
              ),
            )
          : ListView.builder(
              padding: EdgeInsets.all(16.w),
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final item = notifications[index];
                return NotificationCard(
                  icon: item["icon"] as IconData,
                  title: item["title"] as String,
                  subtitle: item["subtitle"] as String,
                  time: item["time"] as String,
                );
              },
            ),
    );
  }
}
