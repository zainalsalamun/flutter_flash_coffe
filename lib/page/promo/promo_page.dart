import 'package:flutter/material.dart';
import 'package:flutter_flash_coffe/constant/color_constant.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_flash_coffe/page/promo/mission_detail_page.dart';

class PromoPage extends StatelessWidget {
  const PromoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: DefaultTabController(
        length: 4,
        child: Column(
          children: [
            _buildHeader(),
            Stack(
              children: [
                Container(
                  height: 1, // Bottom border for the full width
                  margin: EdgeInsets.only(
                    top: 48,
                  ), // Align with bottom of TabBar
                  color: Colors.grey.shade300,
                ),
                TabBar(
                  isScrollable: false,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: ColorConstant.primaryButton,
                  indicatorWeight: 3,
                  labelStyle: GoogleFonts.inter(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                  tabs: const [
                    Tab(text: "My Subscriptions"),
                    Tab(text: "Vouchers"),
                    Tab(text: "Loyalty"),
                    Tab(text: "Missions"),
                  ],
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _buildMySubscriptions(),
                  _buildVouchers(),
                  _buildLoyalty(),
                  _buildMissions(context),
                ],
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
        "Promo",
        textAlign: TextAlign.center,
        style: GoogleFonts.inter(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildMissions(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Mission List",
            style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            "Start your mission today from the list below",
            style: GoogleFonts.inter(fontSize: 12, color: Colors.grey),
          ),
          const SizedBox(height: 24),
          _buildMissionCard(
            context,
            title: "Upsize Beverage",
            iconText: "UPSIZE\nMINUMAN-MU!",
            iconColor: ColorConstant.primary,
            iconTextColor: ColorConstant.primaryButton,
            reward: "5,600",
          ),
          const SizedBox(height: 16),
          _buildMissionCard(
            context,
            title: "Order Large Size Beverage",
            iconText: "DOSIS\nMINUM\nMINGGUAN",
            iconColor: ColorConstant.primaryButton,
            iconTextColor: ColorConstant.primary,
            reward: "5,600",
          ),
          const SizedBox(height: 16),
          _buildMissionCard(
            context,
            title: "Coffee Bundling",
            iconText: "BUNDLE\nHEMAT!",
            iconColor: ColorConstant.primary,
            iconTextColor: ColorConstant.primaryButton,
            reward: "5,600",
          ),
        ],
      ),
    );
  }

  Widget _buildMissionCard(
    BuildContext context, {
    required String title,
    required String iconText,
    required Color iconColor,
    required Color iconTextColor,
    required String reward,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MissionDetailPage()),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: iconColor,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(8),
              alignment: Alignment.center,
              child: Stack(
                children: [
                  if (iconColor == ColorConstant.primary)
                    Positioned(
                      bottom: -15,
                      right: -15,
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: ColorConstant.primaryButton,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  if (iconColor == ColorConstant.primaryButton)
                    Positioned(
                      bottom: -15,
                      right: -15,
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: ColorConstant.primary,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  Center(
                    child: Text(
                      iconText,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        fontSize: 10,
                        fontWeight: FontWeight.w900,
                        color: iconTextColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Duration",
                            style: GoogleFonts.inter(
                              fontSize: 10,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            "7 Days",
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Reward",
                            style: GoogleFonts.inter(
                              fontSize: 10,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            reward,
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: ColorConstant.primaryButton,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoyalty() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTierCard(),
          const SizedBox(height: 24),
          Text(
            "Reward Voucher",
            style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 16),
          _buildVoucherCard(
            image: "assets/banner/ic_voucher_banner.svg",
            title: "Voucher 5 x 25%",
            validity: "",
            buttonText: "200 Flashpoint",
            buttonColor: ColorConstant.primaryButton,
            showValidity: false,
          ),
          const SizedBox(height: 16),
          _buildVoucherCard(
            image: "assets/banner/ic_voucher_banner_.svg",
            title: "Voucher 5 x 25%",
            validity: "",
            buttonText: "200 Flashpoint",
            buttonColor: ColorConstant.primaryButton,
            showValidity: false,
          ),
        ],
      ),
    );
  }

  Widget _buildTierCard() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFFF0F5), // Pale pink background
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Bronze",
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: LinearProgressIndicator(
                          value: 0.2,
                          backgroundColor: Colors.white,
                          color: ColorConstant.primaryButton,
                          minHeight: 8,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorConstant.primaryButton,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        minimumSize: const Size(0, 32),
                      ),
                      child: Text(
                        "My Rewards",
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text.rich(
                  TextSpan(
                    text: "1000 ",
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: ColorConstant.primaryButton,
                    ),
                    children: [
                      TextSpan(
                        text: "Flash Points",
                        style: GoogleFonts.inter(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "View tier benefits",
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Icon(Icons.arrow_forward_ios, size: 14),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMySubscriptions() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Subscriptions List",
            style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 16),
          _buildSubscriptionCard(
            title: "FlashMob",
            description:
                "Pay only Rp1*, get UNLIMITED promo for various Grab services",
            price: "From Rp 3.000/ week",
            color: ColorConstant.primaryButton,
            labelColor: ColorConstant.primary,
          ),
          const SizedBox(height: 16),
          _buildSubscriptionCard(
            title: "FlashMob",
            description:
                "Pay only Rp1*, get UNLIMITED promo for various Grab services",
            price: "From Rp 3.000/ week",
            color: ColorConstant.primary,
            labelColor: ColorConstant.primaryButton,
          ),
          const SizedBox(height: 16),
          _buildSubscriptionCard(
            title: "FlashMob",
            description:
                "Pay only Rp1*, get UNLIMITED promo for various Grab services",
            price: "From Rp 3.000/ week",
            color: ColorConstant.primaryButton,
            labelColor: ColorConstant.primary,
          ),
        ],
      ),
    );
  }

  Widget _buildVouchers() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          _buildVoucherCard(
            image: "assets/banner/voucher_5x25.png",
            title: "Voucher 5x25% Khusus Untukmu",
            validity: "Valid until 31 December 2026",
            buttonText: "CLAIM",
          ),
          const SizedBox(height: 16),
          _buildVoucherCard(
            image: "assets/banner/voucher_free_cookie.png",
            title: "Free Chocolate Chip Cookie",
            validity: "Valid until 12 February 2026",
            buttonText: "CLAIM",
          ),
          const SizedBox(height: 16),
          _buildVoucherCard(
            image: "assets/banner/ic_voucher_banner.svg",
            title: "Flash with Benefit 25%",
            validity: "Valid until 14 February 2026",
            buttonText: "CLAIM",
          ),
        ],
      ),
    );
  }

  Widget _buildVoucherCard({
    required String image,
    required String title,
    required String validity,
    required String buttonText,
    Color buttonColor = const Color(0xFFFA275A), // Default to primaryButton
    bool showValidity = true,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child:
                image.endsWith('.svg')
                    ? SvgPicture.asset(
                      image,
                      width: double.infinity,
                      height: 150,
                      fit: BoxFit.cover,
                    )
                    : Image.asset(
                      image,
                      width: double.infinity,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            title.contains("25%")
                                ? title.replaceFirst("25%", "")
                                : title,
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          if (title.contains("25%"))
                            Text(
                              " 25%",
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: ColorConstant.primaryButton,
                              ),
                            ),
                        ],
                      ),
                      if (showValidity) ...[
                        const SizedBox(height: 4),
                        Text(
                          validity,
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 0,
                    ),
                  ),
                  child: Text(
                    buttonText,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubscriptionCard({
    required String title,
    required String description,
    required String price,
    required Color color,
    required Color labelColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          _buildLogo(color, labelColor),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  price,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: ColorConstant.primaryButton,
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black),
        ],
      ),
    );
  }

  Widget _buildLogo(Color bg, Color textC) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "FLASH",
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w900,
              color: textC,
              height: 1,
            ),
          ),
          Text(
            "MOB",
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w900,
              color: textC,
              height: 1,
            ),
          ),
        ],
      ),
    );
  }
}
