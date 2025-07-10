import 'package:flutter/material.dart';
import 'package:flutter_flash_coffe/constant/color_constant.dart';
import 'package:flutter_flash_coffe/page/onboarding/onboarding_page.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.primary,
      body: Center(
        child: SvgPicture.asset('assets/svg/logo_flash_pink.svg', width: 150),
      ),
    );
  }
}
