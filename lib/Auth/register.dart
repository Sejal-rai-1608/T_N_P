import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:turfnpark/widgets/primary_button.dart';
import '../widgets/CTextfield.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:turfnpark/auth/login_page.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
                SvgPicture.asset("assets/logo/Logo.svg", height: 70),

                /// TITLE
                const SizedBox(height: 40),

                /// USERNAME
                CTextfield(
                  hintText: "Username",
                  prefix: SvgPicture.asset(
                    "assets/icons/Icon.svg",
                    color: const Color.fromARGB(255, 51, 51, 51),
                  ),
                  controller: usernameController,
                ),

                /// EMAIL
                CTextfield(
                  hintText: "Email Id",
                  prefix: SvgPicture.asset(
                    "assets/icons/mail.svg",
                    color: const Color.fromARGB(255, 51, 51, 51),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                ),

                /// CONTACT
                CTextfield(
                  hintText: "Contact Number",
                  prefix: SvgPicture.asset(
                    "assets/icons/contact.svg",
                    color: const Color.fromARGB(255, 51, 51, 51),
                  ),
                  keyboardType: TextInputType.phone,
                  controller: phoneController,
                ),

                /// PASSWORD
                CTextfield(
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

                /// CONFIRM PASSWORD
                CTextfield(
                  hintText: "Confirm Password",
                  prefix: SvgPicture.asset(
                    "assets/icons/key.svg",
                    color: const Color.fromARGB(255, 51, 51, 51),
                  ),
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
                PrimaryButton(
                  text: "Register",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
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
