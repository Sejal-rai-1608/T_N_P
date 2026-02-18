import 'package:flutter/material.dart';
import 'package:turfnpark/widgets/appbar.dart';

class ClaimPage extends StatefulWidget {
  const ClaimPage({super.key});

  @override
  State<ClaimPage> createState() => _ClaimPageState();
}

class _ClaimPageState extends State<ClaimPage> {
  final TextEditingController descriptionController = TextEditingController();

  String? selectedPolicy;
  String? selectedClaimType;

  final List<String> policies = [
    "Health Insurance",
    "Car Insurance",
    "Life Insurance",
  ];

  final List<String> claimTypes = [
    "Accident",
    "Hospitalization",
    "Theft",
    "Damage",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: CustomAppbar(
        leftImage: "assets/logo/Branding.svg",
        rightImage: "assets/icons/notification.svg",
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),

            // 🔹 Policy Dropdown
            const Text(
              "Select Policy",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            DropdownButtonFormField<String>(
              dropdownColor: Colors.white,
              hint: const Text("Select Policy"),
              value: selectedPolicy,
              items: policies.map((policy) {
                return DropdownMenuItem(value: policy, child: Text(policy));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedPolicy = value;
                });
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                focusColor: Colors.orange,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Claim Type",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            DropdownButtonFormField<String>(
              dropdownColor: Colors.white,
              hint: const Text("Select Claim Type"),
              value: selectedClaimType,
              items: claimTypes.map((type) {
                return DropdownMenuItem(value: type, child: Text(type));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedClaimType = value;
                });
              },
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),

            const SizedBox(height: 20),

            const Text(
              "Incident Description",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            TextField(
              controller: descriptionController,
              maxLines: 4,
              decoration: const InputDecoration(
                hintText: "Describe what happened...",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 30),

            // 🔹 Upload Section
            const Text(
              "Upload Documents",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Container(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () {
                  print("Upload Clicked");
                },
                icon: const Icon(Icons.upload_file),
                label: const Text("Upload Files"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade200,
                  foregroundColor: Colors.black,
                ),
              ),
            ),

            const SizedBox(height: 80),

            // 🔹 Submit Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  print("Claim Submitted");
                },

                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffF58220),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  "Submit Claim",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
