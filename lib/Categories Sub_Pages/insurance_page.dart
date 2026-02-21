import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:turfnpark/utils/app_text_styles.dart';
import 'package:turfnpark/utils/spacing.dart';
import 'package:turfnpark/widgets/CTextfield.dart';
import 'package:turfnpark/widgets/primary_button.dart';

class InsurancePage extends StatefulWidget {
  const InsurancePage({super.key});

  @override
  State<InsurancePage> createState() => _InsurancePageState();
}

class _InsurancePageState extends State<InsurancePage> {
  String? selectedClient;
  String? selectedPolicyHolder;
  String? selectedSubAgent;

  final TextEditingController insuredController = TextEditingController();
  final TextEditingController referenceController = TextEditingController();

  bool isSubmitted = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: const Color(0xffF5F5F5),

        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: const Text(
            "Client Detail",
            style: TextStyle(color: Colors.white),
          ),
          leading: const BackButton(color: Colors.white),
        ),

        body: SingleChildScrollView(
          padding: EdgeInsets.all(20.w),
          child: Column(
            children: [
              AppSpace.h10,

              Icon(Icons.person, size: 70.sp, color: Colors.orange),

              Text("Client Detail", style: AppTextStyles.subTitle),

              Text(
                "Step 1: Client Information",
                style: AppTextStyles.fieldLabel,
              ),

              AppSpace.h14,

              /// 🔹 Client Name
              CTextfield(
                text: "Client Name *",
                hintText: "Select Client",
                isDropdown: true,
                dropdownItems: ["Client A", "Client B", "Client C"],
                value: selectedClient,
                onChanged: (val) {
                  setState(() {
                    selectedClient = val;
                  });
                },
                errorText: isSubmitted && selectedClient == null
                    ? "Please select a client"
                    : null,
              ),

              /// 🔹 Policy Holder
              CTextfield(
                text: "Policy Holder *",
                hintText: "Select Policy Holder",
                isDropdown: true,
                dropdownItems: ["Holder 1", "Holder 2", "Holder 3"],
                value: selectedPolicyHolder,
                onChanged: (val) {
                  setState(() {
                    selectedPolicyHolder = val;
                  });
                },
                errorText: isSubmitted && selectedPolicyHolder == null
                    ? "Please select policy holder"
                    : null,
              ),

              /// 🔹 Sub Agent
              CTextfield(
                text: "Sub Agent *",
                hintText: "Select Sub Agent",
                isDropdown: true,
                dropdownItems: ["Agent 1", "Agent 2", "Agent 3"],
                value: selectedSubAgent,
                onChanged: (val) {
                  setState(() {
                    selectedSubAgent = val;
                  });
                },
                errorText: isSubmitted && selectedSubAgent == null
                    ? "Please select sub agent"
                    : null,
              ),

              /// 🔹 Insured Name
              CTextfield(
                text: "Insured Name",
                hintText: "Enter insured name",
                controller: insuredController,
              ),

              /// 🔹 Reference Name
              CTextfield(
                text: "Reference By Name",
                hintText: "Enter reference name",
                controller: referenceController,
              ),

              AppSpace.h10,
              PrimaryButton(
                text: "Next",
                onPressed: () {
                  setState(() {
                    isSubmitted = true;
                  });

                  if (selectedClient != null &&
                      selectedPolicyHolder != null &&
                      selectedSubAgent != null) {
                    print("Move to next step");
                  }
                },
              ),
              AppSpace.h10,
            ],
          ),
        ),
      ),
    );
  }
}
