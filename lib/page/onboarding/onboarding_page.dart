import 'package:flutter/material.dart';
import 'package:flutter_flash_coffe/constant/color_constant.dart';
import 'package:flutter_svg/svg.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<Map<String, String>> onboardingData = [
    {
      'image': 'assets/svg/onboarding/onboard_satu.svg',
      'title': 'ENJOY SPECIALTY COFFEE AT AN AFFORDABLE PRICE',
      'description':
          'Our menu is curated by Would Barista Champions using only 100% Arabica beans. You can now enjoy high-quality accessible brews everyday',
    },
    {
      'image': 'assets/svg/onboarding/onboard_dua.svg',
      'title': 'SKIP THE QUEUE & TRACK YOUR ORDERS',
      'description':
          'Choose from a wide selection of drinks and snacks. Pick it up at an outlet near you, or let our riders bring it right to your doorstep!',
    },
    {
      'image': 'assets/svg/onboarding/onboard_tiga.svg',
      'title': 'EARN FLASH POINT & REDEEM FREE DRINKS',
      'description':
          'Earn exclusive rewards, participate in fun challanges and earn Flash points every time you place an order through the app!',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.grey0,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        'assets/svg/onboarding/flag.svg',
                        height: 16,
                      ),
                      SizedBox(width: 6),
                      Text('EN'),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: onboardingData.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      // Image.asset(onboardingData[index]['image']!, height: 300),
                      SvgPicture.asset(
                        onboardingData[index]['image']!,
                        height: 300,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 20,
                        ),
                        child: Column(
                          children: [
                            Text(
                              onboardingData[index]['title']!,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: ColorConstant.black80,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              onboardingData[index]['description']!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                onboardingData.length,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        _currentIndex == index
                            ? ColorConstant.primaryButton
                            : Colors.grey.shade300,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/signup');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorConstant.primaryButton,
                      minimumSize: const Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      "Sign Up/Login",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorConstant.primary,
                      foregroundColor: ColorConstant.primaryButton,
                      minimumSize: const Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text("Skip For Now"),
                  ),
                  const SizedBox(height: 10),
                  Text.rich(
                    TextSpan(
                      text: 'By logging in or registering, you agree to our ',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black45,
                      ),
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
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
