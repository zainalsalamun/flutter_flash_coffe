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
            child: const TabBar(
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Color(0xFFFF2D55),
              tabs: [Tab(text: 'Pickup'), Tab(text: 'Delivery')],
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
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        children: const [
          Text("Order from 1.07 km", style: TextStyle(color: Colors.pink)),
          Text(
            "Tebet Raya",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
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
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: const [
          Icon(Icons.location_pin, color: Colors.pink),
          SizedBox(width: 8),
          Text("Office", style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }

  Widget _buildBanner() {
    return SizedBox(
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          SvgPicture.asset("assets/banner/ic_mission_banner.svg"),
          const SizedBox(width: 8),
          SvgPicture.asset("assets/banner/ic_promo_flash_coffee.svg"),
          const SizedBox(width: 8),
          SvgPicture.asset("assets/banner/ic_voucher_banner.svg"),
        ],
      ),
    );
  }

  Widget _buildSection(String title, List<Product> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 180,
          child: ListView.builder(
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
      width: 130,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.yellow[600],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Expanded(child: SvgPicture.asset(product.image, fit: BoxFit.contain)),
          if (product.tag.isNotEmpty)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              color: Colors.green,
              child: Text(
                product.tag,
                style: const TextStyle(color: Colors.white, fontSize: 10),
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(4),
            child: Column(
              children: [
                Text(
                  product.name,
                  style: const TextStyle(fontSize: 14),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Rp ${product.price}",
                  style: const TextStyle(color: Colors.pink),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
