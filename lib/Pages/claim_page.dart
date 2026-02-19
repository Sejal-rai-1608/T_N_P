import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:turfnpark/widgets/appbar.dart';
import 'package:turfnpark/widgets/CTextfield.dart';

class ClaimPage extends StatefulWidget {
  const ClaimPage({super.key});

  @override
  State<ClaimPage> createState() => _ClaimPageState();
}

class _ClaimPageState extends State<ClaimPage> {
  final TextEditingController descriptionController = TextEditingController();

  String? selectedPolicy;
  String? selectedClaimType;
  bool isSubmitted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F6FA), // 🔥 soft background

      appBar: CustomAppbar(
        leftImage: "assets/logo/Logo.svg",
        rightImage: "assets/icons/notification.svg",
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),

            /// 🔥 FORM CARD CONTAINER
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  /// 🔹 POLICY DROPDOWN
                  CTextfield(
                    text: "Select Policy *",
                    hintText: "Choose Policy",
                    prefix: SvgPicture.asset(
                      "assets/icons/policy.svg",
                      width: 20,
                    ),
                    isDropdown: true,
                    dropdownItems: [
                      "Health Insurance",
                      "Car Insurance",
                      "Life Insurance",
                      "Home Insurance",
                    ],
                    value: selectedPolicy,
                    onChanged: (value) {
                      setState(() {
                        selectedPolicy = value;
                      });
                    },
                    errorText: isSubmitted && selectedPolicy == null
                        ? "Please select sub agent"
                        : null,
                  ),

                  const SizedBox(height: 15),

                  /// 🔹 CLAIM TYPE DROPDOWN
                  CTextfield(
                    text: "Claim Type *",
                    hintText: "Select Claim Type",
                    prefix: SvgPicture.asset(
                      "assets/icons/claim_type.svg",
                      width: 20,
                    ),
                    isDropdown: true,
                    dropdownItems: [
                      "Accident",
                      "Hospitalization",
                      "Theft",
                      "Damage",
                    ],
                    value: selectedClaimType,
                    onChanged: (value) {
                      setState(() {
                        selectedClaimType = value;
                      });
                    },
                    errorText: isSubmitted && selectedClaimType == null
                        ? "Please select sub agent"
                        : null,
                  ),

                  const SizedBox(height: 15),

                  /// 🔹 DESCRIPTION BOX
                  CTextfield(
                    text: "Incident Description",
                    hintText: "Describe what happened...",
                    controller: descriptionController,
                    maxLines: 5,
                  ),

                  const SizedBox(height: 20),

                  /// 🔹 UPLOAD DOCUMENT SECTION
                  Align(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Upload Documents",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.upload_file, color: Colors.black54),
                        SizedBox(width: 10),
                        Text(
                          "Upload Files",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),

                  /// 🔥 GRADIENT SUBMIT BUTTON
                  // GestureDetector(
                  //   onTap: () {
                  //     print("Claim Submitted");
                  //   },
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isSubmitted = true;
                        });

                        if (selectedPolicy != null &&
                            selectedClaimType != null) {
                          print("Move to next step");
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        "Submit Claim",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
