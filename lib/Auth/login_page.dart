import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:turfnpark/Pages/Profile.dart';
import '../auth/forgot_password.dart';
import '../auth/register.dart';
import '../widgets/CTextfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController usernameController;
  late TextEditingController passwordController;
  bool hidePassword = true;

  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          // ✅ prevents overflow
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 60),

                Center(
                  child: Column(
                    children: [
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
                      const SizedBox(height: 8),
                      // const Text(
                      //   "Have Fun with Friends..!!",
                      //   style: TextStyle(
                      //     fontSize: 22,
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      // ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                /// Password Field
                // Image.asset("assets/key.svg", height: 24),
                const SizedBox(width: 12),
                CTextfield(
                  hintText: "Username",
                  prefixSvg: "assets/icons/Icon.svg",
                  controller: usernameController,

                  // suffixIcon: SvgPicture.asset(
                  //   "assets/icons/eye.svg",
                  //   height: 12,
                  //   width: 12,
                  // ),
                ),
                CTextfield(
                  hintText: "New Password",
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

                const SizedBox(height: 10),

                /// Forgot password
                Align(
                  alignment: Alignment.bottomRight, // ✅ correct alignment
                  child: RichText(
                    text: TextSpan(
                      text: 'Forgot Password?',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 156, 156, 156),
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ForgotPassword(),
                            ),
                          );
                        },
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                /// Login Button
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Profile()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffF58220),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                Center(
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(fontSize: 16, color: Colors.black),
                      children: [
                        const TextSpan(text: "Didn't Have an Account? "),
                        TextSpan(
                          text: "Register Now",
                          style: const TextStyle(
                            color: Color(0xffF58220),
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Register(),
                                ),
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                Center(
                  child: Text(
                    "----------------- Others Ways to sign-in -------------------",
                    style: const TextStyle(fontSize: 16),
                  ),
                ),

                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/logo/facebook.png", height: 50),
                    const SizedBox(width: 20),
                    SvgPicture.asset("assets/logo/google.svg", height: 50),
                    const SizedBox(width: 20),
                    SvgPicture.asset("assets/logo/apple.svg", height: 50),
                  ],
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
