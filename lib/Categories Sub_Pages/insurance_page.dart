import 'package:flutter/material.dart';
import 'package:turfnpark/widgets/CTextfield.dart';

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
    return Scaffold(
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
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 10),

            const Icon(Icons.person, size: 70, color: Colors.orange),

            const SizedBox(height: 5),

            const Text(
              "Client Detail",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),

            const SizedBox(height: 4),

            const Text(
              "Step 1: Client Information",
              style: TextStyle(color: Colors.grey, fontSize: 15),
            ),

            const SizedBox(height: 30),

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

            const SizedBox(height: 40),

        
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
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
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Next",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
