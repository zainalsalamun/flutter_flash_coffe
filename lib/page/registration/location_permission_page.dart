import 'package:flutter/material.dart';
import 'package:flutter_flash_coffe/constant/color_constant.dart';
import 'package:flutter_flash_coffe/page/registration/location_permission_bottom.dart';

class PageLocationPermission extends StatelessWidget {
  const PageLocationPermission({super.key});

  void _showLocationBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const LocationPermissionBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Location Permission"),
        backgroundColor: ColorConstant.primary,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showLocationBottomSheet(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorConstant.primaryButton,
          ),
          child: const Text("Request Location Access"),
        ),
      ),
    );
  }
}
