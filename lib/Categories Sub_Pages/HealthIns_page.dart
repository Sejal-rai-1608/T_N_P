import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../widgets/CTextfield.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:turfnpark/auth/login_page.dart';

class HealthInsPage extends StatefulWidget {
  const HealthInsPage({super.key});

  @override
  State<HealthInsPage> createState() => _HealthInsPageState();
}

class _HealthInsPageState extends State<HealthInsPage> {
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
                const SizedBox(height: 40),
                SvgPicture.asset("assets/logo/Branding.svg", height: 70),

                /// TITLE
                Text(
                  "PolicyPlus",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),

                const SizedBox(height: 40),

                /// USERNAME
                CTextfield(
                  text: "Client Name",
                  hintText: "Select User",
                  prefixSvg: "assets/icons/Icon.svg",
                  controller: usernameController,
                ),

                /// EMAIL
                CTextfield(
                  text: "Policy Holder",
                  hintText: "Select Policy Holder",
                  prefixSvg: "assets/icons/mail.svg",
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                ),

                /// CONTACT
                CTextfield(
                  text: "Sub Agent",
                  hintText: "Select Sub Agent",
                  prefixSvg: "assets/icons/contact.svg",
                  keyboardType: TextInputType.phone,
                  controller: phoneController,
                ),

                /// PASSWORD
                CTextfield(
                  text: "Insured's Name",
                  hintText: "Enter Insured's Name",
                  prefixSvg: "assets/icons/key.svg",
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
                      color: Color.fromARGB(255, 0, 0, 0),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffF58220),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: const Text(
                      "HealthInsPage",
                      style: TextStyle(
                        fontSize: 19,
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
                    const Text("Already Have An Account? "),
                    Text.rich(
                      TextSpan(
                        text: "Login Now",
                        style: TextStyle(
                          color: Color(0xffF58220),
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ),
                            );
                          },
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                const Text(
                  "----------------- Others Ways to sign-in -------------------",
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

  // Widget _socialIcon(IconData icon, Color color) {
  //   return CircleAvatar(
  //     radius: 22,
  //     backgroundColor: color.withOpacity(0.1),
  //     child: Icon(icon, color: color, size: 28),
  //   );
  // }
}
