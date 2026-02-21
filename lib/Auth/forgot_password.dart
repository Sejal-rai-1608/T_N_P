import 'package:flutter/material.dart';
//import 'package:flutter/gestures.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:turfnpark/auth/Login_page.dart';
import 'package:turfnpark/widgets/otp_widget.dart';
import 'package:turfnpark/auth/confirm_password.dart';
import 'package:turfnpark/widgets/primary_button.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController otpController = TextEditingController();

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
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          },
        ),

        title: Text(
          "Forgot Password",
          style: TextStyle(
            color: Color(0xffF58220),
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisAlignment: MainAxisAlignment.start,
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
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(height: 20),

                OtpInput(
                  controller: otpController,
                  onCompleted: (otp) {
                    print("OTP entered: $otp");
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/load.svg",
                      color: Color(0xffF58220),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "Auto fetching OTP...",
                      style: TextStyle(
                        color: Color.fromARGB(255, 174, 174, 174),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),

                PrimaryButton(
                  text: "Submit",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ConfirmPassword(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),

                RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 174, 174, 174),
                    ),
                    children: [
                      const TextSpan(text: "Didn't receive it? "),
                      TextSpan(
                        text: "Retry in 00:60",
                        style: const TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
