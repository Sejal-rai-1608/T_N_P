import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:turfnpark/Pages/Profile.dart';
import 'package:turfnpark/Pages/mainscreen.dart';
import '../auth/forgot_password.dart';
import '../auth/register.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60.h),

              /// 🔥 Logo + Title
              Center(
                child: Column(
                  children: [
                    SvgPicture.asset("assets/logo/Branding.svg", height: 70.h),
                    SizedBox(height: 12.h),
                    Text(
                      "PolicyPlus",
                      style: TextStyle(
                        fontSize: 28.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 40.h),

              /// 🔥 Username
              CTextfield(
                hintText: "Username",
                prefixSvg: "assets/icons/Icon.svg",
                controller: usernameController,
              ),

              SizedBox(height: 16.h),

              /// 🔥 Password
              CTextfield(
                hintText: "Password",
                prefixSvg: "assets/icons/key.svg",
                controller: passwordController,
                obscureText: hidePassword,
                suffixIcon: IconButton(
                  icon: Icon(
                    hidePassword ? Icons.visibility_off : Icons.visibility,
                    size: 20.sp,
                  ),
                  onPressed: () {
                    setState(() {
                      hidePassword = !hidePassword;
                    });
                  },
                ),
              ),

              SizedBox(height: 12.h),

              /// 🔥 Forgot Password
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ForgotPassword()),
                    );
                  },
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.grey,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 30.h),

              /// 🔥 Login Button
              SizedBox(
                width: double.infinity,
                height: 52.h,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => MainScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffF58220),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 24.h),

              /// 🔥 Register
              Center(
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: 14.sp, color: Colors.black),
                    children: [
                      const TextSpan(text: "Don't have an account? "),
                      TextSpan(
                        text: "Register Now",
                        style: TextStyle(
                          color: const Color(0xffF58220),
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

              SizedBox(height: 40.h),

              /// 🔥 Divider Text
              Center(
                child: Text(
                  "Other ways to sign in",
                  style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                ),
              ),

              SizedBox(height: 20.h),

              /// 🔥 Social Icons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/logo/facebook.png", height: 40.h),
                  SizedBox(width: 24.w),
                  SvgPicture.asset("assets/logo/google.svg", height: 40.h),
                  SizedBox(width: 24.w),
                  SvgPicture.asset("assets/logo/apple.svg", height: 40.h),
                ],
              ),

              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }
}
