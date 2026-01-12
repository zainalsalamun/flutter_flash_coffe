import 'package:flutter/material.dart';
import 'package:flutter_flash_coffe/data/data_dummy.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_flash_coffe/constant/color_constant.dart';
import 'package:flutter_flash_coffe/model/product.dart';

class HomePage extends StatefulWidget {
  final bool isDelivery;

  const HomePage({super.key, required this.isDelivery});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          _buildHeader(),
          Container(
            color: Colors.white,
            child: TabBar(
              labelColor: Colors.black,
              labelStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              unselectedLabelColor: Colors.grey,
              unselectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
              indicatorColor: ColorConstant.primaryButton,
              indicatorWeight: 3,
              tabs: const [Tab(text: 'Pickup'), Tab(text: 'Delivery')],
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [_buildPickupTab(), _buildDeliveryTab()],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      color: ColorConstant.primary,
      padding: const EdgeInsets.only(top: 48, bottom: 12, left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Order from 1.07 km",
            style: TextStyle(
              color: ColorConstant.orange10, // Assuming orange/reddish color
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: const [
              Text(
                "Tebet Raya",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              SizedBox(width: 4),
              Icon(Icons.keyboard_arrow_down, size: 20),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDeliveryTab() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildDeliveryAddress(),
          const SizedBox(height: 16),
          _buildBanner(),
          _buildSection("RECOMMENDED", DataDummy().recommendedProducts),
          _buildSection(
            "Flash Coffee X Tinder Series",
            DataDummy().frappeSeries,
          ),
        ],
      ),
    );
  }

  Widget _buildPickupTab() {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 16),
          _buildBanner(),
          _buildSection("RECOMMENDED", DataDummy().recommendedProducts),
          _buildSection(
            "Flash Coffee X Tinder Series",
            DataDummy().frappeSeries,
          ),
        ],
      ),
    );
  }

  Widget _buildDeliveryAddress() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "DELIVERY TO",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: ColorConstant.formAuth,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: ColorConstant.primaryButton,
                ),
                const SizedBox(width: 12),
                const Text(
                  "Office",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const Spacer(),
                Icon(
                  Icons.edit_outlined,
                  color: ColorConstant.primaryButton,
                  size: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBanner() {
    return SizedBox(
      height: 180, // Adjusted height for better visibility
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: DataDummy().banners.length,
        itemBuilder: (context, index) {
          return _buildBannerItem(DataDummy().banners[index]);
        },
      ),
    );
  }

  Widget _buildBannerItem(String assetPath) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      width: 300, // Explicit width locally to ensure it takes space
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey[200], // Enabled placeholder color
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child:
            assetPath.endsWith('.svg')
                ? SvgPicture.asset(
                  assetPath,
                  fit: BoxFit.cover, // Use cover to ensure it fills
                  height: 180,
                  placeholderBuilder:
                      (context) =>
                          const Center(child: CircularProgressIndicator()),
                )
                : Image.asset(
                  assetPath,
                  fit: BoxFit.cover,
                  height: 180,
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(child: Icon(Icons.broken_image));
                  },
                ),
      ),
    );
  }

  Widget _buildSection(String title, List<Product> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "5 Item",
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 240, // Needs enough height for the larger card
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            itemBuilder: (context, index) => _buildProductCard(items[index]),
          ),
        ),
      ],
    );
  }

  Widget _buildProductCard(Product product) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 160,
                width: 160,
                decoration: BoxDecoration(
                  color: ColorConstant.primary, // Yellow background
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(
                      20.0,
                    ), // Padding for the image inside
                    child:
                        product.image.endsWith('.svg')
                            ? SvgPicture.asset(
                              product.image,
                              fit: BoxFit.contain,
                            )
                            : Image.asset(product.image, fit: BoxFit.contain),
                  ),
                ),
              ),
              // Badge
              if (product
                  .tag
                  .isNotEmpty) // Assuming all have it or checking tag
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: ColorConstant.green70,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.flash_on, color: Colors.white, size: 12),
                        SizedBox(width: 4),
                        Text(
                          "Rekomendasi", // Hardcoded per design or use product.tag
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            product.name,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            "Rp ${product.price}",
            style: TextStyle(
              color: ColorConstant.primaryButton, // Pink/Red
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
