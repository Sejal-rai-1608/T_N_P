import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:turfnpark/widgets/primary_button.dart';
import '../widgets/CTextfield.dart';
import '../auth/register.dart';

class ConfirmPassword extends StatefulWidget {
  const ConfirmPassword({super.key});

  @override
  State<ConfirmPassword> createState() => _ConfirmPasswordState();
}

class _ConfirmPasswordState extends State<ConfirmPassword> {
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool hidePassword = true;
  bool hideConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined, color: Colors.black),
          onPressed: () {
            Navigator.pop(
              context,
              MaterialPageRoute(builder: (context) => Register()),
            );
          },
        ),

        title: Text(
          "Save Password",
          style: TextStyle(
            color: Color(0xffF58220),
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Text(
            "Verify with the OTP to change Password \n Sent to 91****6848",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: CTextfield(
              hintText: "New Password",
              prefix: SvgPicture.asset(
                "assets/icons/key.svg",
                color: const Color.fromARGB(255, 51, 51, 51),
              ),
              controller: passwordController,
              obscureText: hidePassword,
              suffixIcon: IconButton(
                icon: Icon(
                  hidePassword ? Icons.visibility_off : Icons.visibility,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                onPressed: () {
                  setState(() {
                    hidePassword = !hidePassword;
                  });
                },
              ),
            ),
          ),
          const SizedBox(height: 10),

          /// CONFIRM PASSWORD
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: CTextfield(
              hintText: "Confirm Password",
              prefix: SvgPicture.asset(
                "assets/icons/key.svg",
                color: const Color.fromARGB(255, 51, 51, 51),
              ),
              controller: confirmPasswordController,
              obscureText: hideConfirmPassword,
              suffixIcon: IconButton(
                icon: Icon(
                  hideConfirmPassword ? Icons.visibility_off : Icons.visibility,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                onPressed: () {
                  setState(() {
                    hideConfirmPassword = !hideConfirmPassword;
                  });
                },
              ),
            ),
          ),

          const SizedBox(height: 30),

          /// SIGN UP BUTTON
          PrimaryButton(text: "Save Password", onPressed: () {}),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
