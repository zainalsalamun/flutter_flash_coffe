import 'package:flutter/material.dart';
import 'package:flutter_flash_coffe/constant/color_constant.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            _buildProfileInfo(),
            const Divider(thickness: 1, color: Color(0xFFEEEEEE)),
            _buildMenuItem(
              icon: Icons.location_on_outlined,
              text: "Saved Address",
              iconColor: ColorConstant.primaryButton,
            ),
            const Divider(
              indent: 20,
              endIndent: 20,
              height: 1,
              color: Color(0xFFEEEEEE),
            ),
            _buildMenuItem(
              icon: Icons.credit_card,
              text: "Payment Methods",
              iconColor: ColorConstant.primaryButton,
            ),
            const Divider(
              indent: 20,
              endIndent: 20,
              height: 1,
              color: Color(0xFFEEEEEE),
            ),
            _buildMenuItem(
              icon: Icons.translate,
              text: "Languages",
              iconColor: ColorConstant.primaryButton,
            ),
            const Divider(
              indent: 20,
              endIndent: 20,
              height: 1,
              color: Color(0xFFEEEEEE),
            ),
            _buildMenuItem(
              icon: Icons.info_outline,
              text: "Privacy and Sharing",
              iconColor: ColorConstant.primaryButton,
            ),
            const Divider(
              indent: 20,
              endIndent: 20,
              height: 1,
              color: Color(0xFFEEEEEE),
            ),
            _buildMenuItem(
              icon: Icons.help_outline,
              text: "Help Center",
              iconColor: ColorConstant.primaryButton,
            ),
            const Divider(
              indent: 20,
              endIndent: 20,
              height: 1,
              color: Color(0xFFEEEEEE),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorConstant.primaryButton,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                ),
                icon: const Icon(Icons.logout, color: Colors.white),
                label: Text(
                  "Logout",
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      color: ColorConstant.primary,
      padding: const EdgeInsets.only(top: 60, bottom: 20),
      child: Text(
        "Profile",
        textAlign: TextAlign.center,
        style: GoogleFonts.inter(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildProfileInfo() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: ColorConstant.primaryButton,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: ClipOval(
              child: SvgPicture.asset(
                "assets/svg/ic_character.svg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "JUNIARTA SAPUTRA",
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "+62813070229220",
                  style: GoogleFonts.inter(fontSize: 12, color: Colors.grey),
                ),
                Row(
                  children: [
                    Text(
                      "junsapt@gmail.com",
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(Icons.verified, color: Colors.amber, size: 16),
                  ],
                ),
              ],
            ),
          ),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: ColorConstant.primaryButton),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
              minimumSize: const Size(0, 32),
            ),
            child: Text(
              "Edit Profile",
              style: GoogleFonts.inter(
                fontSize: 12,
                color: ColorConstant.primaryButton,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String text,
    required Color iconColor,
  }) {
    return ListTile(
      leading: Icon(icon, color: iconColor),
      title: Text(
        text,
        style: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: Colors.grey,
      ),
      onTap: () {},
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
    );
  }
}
