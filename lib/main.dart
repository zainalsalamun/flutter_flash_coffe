import 'package:flutter/material.dart';
import 'package:flutter_flash_coffe/page/bottom/bottom_nav_bar.dart';
import 'package:flutter_flash_coffe/page/home/home_page.dart';
import 'package:flutter_flash_coffe/page/home/menu_page.dart';
import 'package:flutter_flash_coffe/page/onboarding/onboarding_page.dart';
import 'package:flutter_flash_coffe/page/registration/otp_page.dart';
import 'package:flutter_flash_coffe/page/registration/signup_login_page.dart';
import 'package:flutter_flash_coffe/page/splash_screen/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/onboarding': (context) => const OnboardingPage(),
        '/home': (context) => const HomePage(isDelivery: true),
        '/signup': (context) => const SignupLoginPage(),
        '/otp': (context) => const OtpPage(),
        '/delivery': (context) => const HomePage(isDelivery: true),
        '/pickup': (context) => const HomePage(isDelivery: false),
        '/menu': (context) => const MenuPage(),
        '/promo': (context) => const MenuPage(),
        '/profile': (context) => const MenuPage(),
        '/bottom': (context) => const BottomNavScaffold(),
      },
    );
  }
}
