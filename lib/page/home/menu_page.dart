import 'package:flutter/material.dart';
import 'package:flutter_flash_coffe/constant/color_constant.dart';
import 'package:flutter_flash_coffe/data/data_dummy.dart';
import 'package:flutter_flash_coffe/model/product.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: DefaultTabController(
        length: 6,
        child: Column(
          children: [
            _buildHeader(),
            _buildSearchBar(),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: TabBar(
                isScrollable: true,
                indicatorColor: ColorConstant.primaryButton,
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                labelStyle: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                tabs: const [
                  Tab(text: "Frappe Series"),
                  Tab(text: "Signature Latte"),
                  Tab(text: "Milkshake"),
                  Tab(text: "Tea"),
                  Tab(text: "Food"),
                  Tab(text: "Snack"),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: TabBarView(
                children: [
                  _buildContent("Frappe Series", DataDummy().frappeSeries),
                  _buildContent("Signature Latte", DataDummy().signatureLattes),
                  _buildContent("Milkshake", DataDummy().milkshake),
                  _buildContent("Tea", DataDummy().tea),
                  _buildContent("Food", DataDummy().food),
                  _buildContent("Snack", DataDummy().snack),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(String title, List<Product> products) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildGrid(products),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      color: ColorConstant.primary,
      padding: const EdgeInsets.only(top: 50, bottom: 16, left: 20, right: 20),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Order from 1.07 km",
                style: GoogleFonts.inter(
                  color: const Color(0xFFD35400),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Text(
                "Tebet Raya",
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 4),
              const Icon(Icons.keyboard_arrow_down, size: 20),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.pink.shade100),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        decoration: InputDecoration(
          icon: const Icon(Icons.search, color: Colors.grey),
          hintText: "Search",
          hintStyle: GoogleFonts.inter(color: Colors.grey),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 12),
        ),
      ),
    );
  }

  Widget _buildGrid(List<Product> items) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 0.85,
      ),
      itemBuilder: (context, index) {
        final product = items[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ColorConstant.primary,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(12),
                child:
                    product.image.endsWith('.svg')
                        ? SvgPicture.asset(product.image, fit: BoxFit.contain)
                        : Image.asset(product.image, fit: BoxFit.contain),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              product.name,
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Text(
              NumberFormat.currency(
                locale: 'id_ID',
                symbol: 'Rp ',
                decimalDigits: 0,
              ).format(product.price),
              style: GoogleFonts.inter(
                color: ColorConstant.primaryButton,
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
          ],
        );
      },
    );
  }
}
