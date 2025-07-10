import 'package:flutter/material.dart';
import 'package:flutter_flash_coffe/constant/color_constant.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LocationPermissionBottomSheet extends StatelessWidget {
  const LocationPermissionBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset('assets/svg/ic_character.svg', height: 140),
          const SizedBox(height: 16),
          const Text(
            "SHARE YOUR LOCATION",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 12),
          const Text(
            "Let us serve you better, by allowing location access,\nwe can suggest store listing in your vicinity.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorConstant.primaryButton,
              minimumSize: const Size.fromHeight(50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              "Allow Location",
              style: TextStyle(color: ColorConstant.grey0),
            ),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/bottom');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorConstant.primary,
              foregroundColor: ColorConstant.primaryButton,
              minimumSize: const Size.fromHeight(50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text("Manually Select a Store"),
          ),
        ],
      ),
    );
  }
}
