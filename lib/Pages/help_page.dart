import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:turfnpark/widgets/appbar.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({super.key});

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  int expandedIndex = -1;

  final List<Map<String, String>> faqs = [
    {
      "q": "How do I buy an insurance plan?",
      "a":
          "Go to Plans section, compare policies and choose the one that fits your needs.",
    },
    {
      "q": "How can I file a claim?",
      "a":
          "Open Claims section → select policy → upload documents → submit claim.",
    },
    {
      "q": "Can I cancel my policy?",
      "a":
          "Yes, policies can be cancelled from the Account section. Refund rules may apply.",
    },
    {
      "q": "How do I update my personal details?",
      "a": "Go to Account → Profile → Edit Details and save changes.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(48.h),
        child: CustomAppbar(
          leftImage: "assets/logo/Branding.svg",
          rightImage: "assets/icons/notification.svg",
          title: "Policy Plus",
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// 🔹 TITLE
              Text(
                "Help & Support",
                style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 6.h),

              Text(
                "We are here to help you",
                style: TextStyle(fontSize: 15.sp, color: Colors.grey),
              ),

              SizedBox(height: 24.h),

              /// 🔹 CONTACT OPTIONS
              Text(
                "Contact Support",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
              ),

              SizedBox(height: 14.h),

              _supportTile(
                icon: Icons.phone,
                title: "Call Us",
                subtitle: "+91 9769364928",
              ),

              _supportTile(
                icon: Icons.email,
                title: "Email Support",
                subtitle: "support@policyplus.com",
              ),

              _supportTile(
                icon: Icons.chat,
                title: "WhatsApp Support",
                subtitle: "Chat with our support team",
              ),

              SizedBox(height: 26.h),

              /// 🔹 FAQ TITLE
              Text(
                "Frequently Asked Questions",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
              ),

              SizedBox(height: 12.h),

              /// 🔹 FAQ LIST
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: faqs.length,
                itemBuilder: (context, index) {
                  bool isExpanded = expandedIndex == index;

                  return Card(
                    color: Colors.white,
                    elevation: 0,
                    margin: EdgeInsets.only(bottom: 10.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      side: BorderSide(color: Colors.grey.shade200),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            faqs[index]["q"]!,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          trailing: Icon(
                            isExpanded
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down,
                          ),
                          onTap: () {
                            setState(() {
                              expandedIndex = isExpanded ? -1 : index;
                            });
                          },
                        ),
                        if (isExpanded)
                          Padding(
                            padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 12.h),
                            child: Text(
                              faqs[index]["a"]!,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.grey.shade700,
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),

              SizedBox(height: 30.h),

              /// 🔹 STILL NEED HELP
              Center(
                child: Text(
                  "Still need help?",
                  style: TextStyle(fontSize: 15.sp, color: Colors.grey),
                ),
              ),

              SizedBox(height: 12.h),

              SizedBox(
                width: double.infinity,
                height: 50.h,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffF58220),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                  ),
                  child: Text(
                    "Contact Support",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  /// 🔹 SUPPORT TILE
  Widget _supportTile({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Card(
      elevation: 1,
      color: Colors.white,

      margin: EdgeInsets.only(bottom: 10.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 20.r,
          backgroundColor: const Color(0xffF58220).withOpacity(.1),
          child: Icon(icon, color: const Color(0xffF58220)),
        ),
        title: Text(
          title,
          style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
        ),
        subtitle: Text(subtitle, style: TextStyle(fontSize: 13.sp)),
        onTap: () {},
      ),
    );
  }
}
