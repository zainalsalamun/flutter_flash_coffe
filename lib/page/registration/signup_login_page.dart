import 'package:flutter/material.dart';
import 'package:flutter_flash_coffe/constant/color_constant.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignupLoginPage extends StatelessWidget {
  const SignupLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.grey0,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "SIGN UP / LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 8),
            const Text(
              "Enter your mobile number to continues\nMake sure your mobile phone number is active",
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 14,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey.shade100,
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/svg/ic_flag_indonesia.svg",
                        width: 24,
                        height: 24,
                      ),
                      const SizedBox(width: 6),
                      const Text("+62"),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "81234567890",
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text(
              "Issue with number?",
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/otp');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorConstant.primaryButton,
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "Received OTP via Whatsapp",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/otp');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorConstant.primary,
                foregroundColor: ColorConstant.primaryButton,
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text("Received OTP via Call"),
            ),
            const Spacer(),
            Text.rich(
              TextSpan(
                text: 'By logging in or registering, you agree to our ',
                style: const TextStyle(fontSize: 12, color: Colors.black45),
                children: [
                  TextSpan(
                    text: 'Term of servive',
                    style: TextStyle(
                      color: ColorConstant.primaryButton,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  const TextSpan(text: ' and '),
                  TextSpan(
                    text: 'Privacy policy',
                    style: TextStyle(
                      color: ColorConstant.primaryButton,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
