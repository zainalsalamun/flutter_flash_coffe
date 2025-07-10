import 'package:flutter/material.dart';
import 'package:flutter_flash_coffe/constant/color_constant.dart';
import 'package:flutter_flash_coffe/data/data_dummy.dart';
import 'package:flutter_flash_coffe/model/product.dart';
import 'package:flutter_svg/svg.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          _buildHeader(),
          const TabBar(
            indicatorColor: Color(0xFFFF2D55),
            labelColor: Colors.black,
            tabs: [
              Tab(text: "Frappe Series"),
              Tab(text: "Signature Latte"),
              Tab(text: "Milkshake"),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                _buildGrid(DataDummy().frappeSeries),
                _buildGrid(DataDummy().signatureLattes),

                Center(child: Text("Belum ada data")),
              ],
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

  Widget _buildGrid(List<Product> items) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: GridView.builder(
        itemCount: items.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 0.8,
        ),
        itemBuilder: (context, index) {
          final product = items[index];
          return Container(
            decoration: BoxDecoration(
              color: Colors.yellow[600],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Expanded(child: SvgPicture.asset(product.image)),
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: Column(
                    children: [
                      Text(product.name, textAlign: TextAlign.center),
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
        },
      ),
    );
  }
}
