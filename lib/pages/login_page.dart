import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:turfnpark/pages/forgot_password.dart';
import 'package:turfnpark/pages/signup_page.dart';
import 'package:turfnpark/controller/CTextfield.dart';

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
                const SizedBox(height: 120),

                Center(
                  child: Column(
                    children: [
                      Text(
                        "LOGIN",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w900,
                          color: Color(0xff00BE76),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Have Fun with Friends..!!",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
                      color: Colors.green,
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
                        color: Color(0xff00BE76),
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
                      // MaterialPageRoute(builder: (context) => SignupPage());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff00BE76),
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
                          text: "Sign Up",
                          style: const TextStyle(
                            color: Color(0xff00BE76),
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignupPage(),
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
                    'Other ways to sign-in',
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
