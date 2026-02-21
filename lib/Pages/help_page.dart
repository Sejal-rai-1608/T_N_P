import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:turfnpark/utils/app_text_styles.dart';
import 'package:turfnpark/utils/spacing.dart';
import 'package:turfnpark/widgets/appbar.dart';
import 'package:turfnpark/widgets/primary_button.dart';

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
      appBar: const CustomAppbar(
        showBackButton: false,
        leftImage: "assets/logo/Logo.svg",
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// 🔹 TITLE
              Text("Help & Support", style: AppTextStyles.mainTitle),

              AppSpace.h10,

              /// 🔹 CONTACT OPTIONS
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

              AppSpace.h10,

              /// 🔹 FAQ TITLE
              Text(
                "Frequently Asked Questions",
                style: AppTextStyles.mainTitle,
              ),

              AppSpace.h10,

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
                            style: AppTextStyles.fieldLabel,
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
                              softWrap: true,
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
              AppSpace.h14,

              /// 🔹 STILL NEED HELP
              Center(
                child: Text(
                  "Still need help?",
                  style: AppTextStyles.fieldLabel,
                ),
              ),

              AppSpace.h10,
              PrimaryButton(text: "Contact Support", onPressed: () {}),

              // AppSpace.h14,
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
      child: Padding(
        padding: EdgeInsets.only(left: 10.w),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 8.h),
          leading: CircleAvatar(
            radius: 20.r,
            backgroundColor: const Color(0xffF58220).withOpacity(.1),
            child: Icon(icon, color: const Color(0xffF58220)),
          ),
          title: Text(title, style: AppTextStyles.fieldLabel),
          subtitle: Text(subtitle, style: AppTextStyles.cardMeta),
          onTap: () {},
        ),
      ),
    );
  }
}
