import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/CTextfield.dart';
import '../auth/register.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final passwordController = TextEditingController();
  final ChangePasswordController = TextEditingController();
  final NewPasswordController = TextEditingController();

  bool hidePassword = true;
  bool hideChangePassword = true;
  bool hideNewPassword = true;

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
          "Change Password",
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
            "Your changed password must be different from \n previous used password.",
            style: TextStyle(
              color: const Color.fromARGB(255, 157, 157, 157),
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: CTextfield(
              text: "Current Password",
              hintText: "Enter Your Current Password",
              prefix: SvgPicture.asset("assets/icons/key.svg"),
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
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: CTextfield(
              text: "New Password",
              hintText: "Enter Your New Password",
              prefix: SvgPicture.asset("assets/icons/key.svg"),
              controller: NewPasswordController,
              obscureText: hideNewPassword,
              suffixIcon: IconButton(
                icon: Icon(
                  hideNewPassword ? Icons.visibility_off : Icons.visibility,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                onPressed: () {
                  setState(() {
                    hideNewPassword = !hideNewPassword;
                  });
                },
              ),
            ),
          ),
          SizedBox(height: 10),

          /// CONFIRM PASSWORD
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: CTextfield(
              text: "Confirm Password",
              hintText: "Enter Your Confirm Password",
              prefix: SvgPicture.asset("assets/icons/key.svg"),
              controller: ChangePasswordController,
              obscureText: hideChangePassword,
              suffixIcon: IconButton(
                icon: Icon(
                  hideChangePassword ? Icons.visibility_off : Icons.visibility,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                onPressed: () {
                  setState(() {
                    hideChangePassword = !hideChangePassword;
                  });
                },
              ),
            ),
          ),

          const SizedBox(height: 80),

          /// SIGN UP BUTTON
          SizedBox(
            width: 388,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                // signup logic
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffF58220),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: const Text(
                "Updated Password",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
