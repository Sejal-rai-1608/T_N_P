import 'package:flutter/material.dart';
import 'package:turfnpark/controller/CTextfield.dart';
import 'package:flutter_svg/flutter_svg.dart';


class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool hidePassword = true;
  bool hideConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 30),

                /// TITLE
                Text(
                  "Sign - Up",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff00BE76),
                  ),
                ),

                const SizedBox(height: 40),

                /// USERNAME
                CTextfield(
                  hintText: "Username",
                  prefixSvg: "assets/icons/Icon.svg",
                  controller: usernameController,
                ),

                /// EMAIL
                CTextfield(
                  hintText: "Email Id",
                  prefixSvg: "assets/icons/mail.svg",
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                ),

                /// CONTACT
                CTextfield(
                  hintText: "Contact Number",
                  prefixSvg: "assets/icons/contact.svg",
                  keyboardType: TextInputType.phone,
                  controller: phoneController,
                ),

                /// PASSWORD
                CTextfield(
                  hintText: "New Password",
                  prefixSvg: "assets/icons/key.svg",
                  controller: passwordController,
                  obscureText: hidePassword,
                  suffixIcon: IconButton(
                    icon: Icon(
                      hidePassword ? Icons.visibility_off : Icons.visibility,
                      color: Color(0xff00BE76),
                    ),
                    onPressed: () {
                      setState(() {
                        hidePassword = !hidePassword;
                      });
                    },
                  ),
                ),

                /// CONFIRM PASSWORD
                CTextfield(
                  hintText: "Confirm Password",
                  prefixSvg: "assets/icons/key.svg",
                  controller: confirmPasswordController,
                  obscureText: hideConfirmPassword,
                  suffixIcon: IconButton(
                    icon: Icon(
                      hideConfirmPassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Color(0xff00BE76),
                    ),
                    onPressed: () {
                      setState(() {
                        hideConfirmPassword = !hideConfirmPassword;
                      });
                    },
                  ),
                ),

                const SizedBox(height: 30),

                /// SIGN UP BUTTON
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: () {
                      // signup logic
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff00BE76),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: const Text(
                      "Sign-Up",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                /// FOOTER TEXT
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Didn\'t Have Account? "),
                    Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Color(0xff00BE76),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                const Text(
                  "Others Ways to sign-in",
                  style: TextStyle(fontSize: 14),
                ),

                const SizedBox(height: 15),

                /// SOCIAL ICONS
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/logo/facebook.png"),
                    const SizedBox(width: 20),
                    SvgPicture.asset("assets/logo/google.svg"),
                    const SizedBox(width: 20),
                    SvgPicture.asset("assets/logo/apple.svg"),
                  ],
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _socialIcon(IconData icon, Color color) {
    return CircleAvatar(
      radius: 22,
      backgroundColor: color.withOpacity(0.1),
      child: Icon(icon, color: color, size: 28),
    );
  }
}
