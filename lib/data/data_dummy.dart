import 'package:flutter_flash_coffe/model/product.dart';

class DataDummy {
  List<Product> recommendedProducts = [
    Product(
      name: "Choco Fudge Frappe",
      image: "assets/svg/menu/choco_fudge_frappe.svg",
      price: 24000,
      tag: "Rekomendasi",
    ),
    Product(
      name: "Charcoal Latte",
      image: "assets/svg/menu/charcoal_latte.svg",
      price: 26000,
      tag: "Rekomendasi",
    ),
  ];

  List<Product> frappeSeries = [
    Product(
      name: "Choco Fudge Frappe",
      image: "assets/svg/menu/choco_fudge_frappe.svg",
      price: 28000,
    ),
    Product(
      name: "Aren Frappe",
      image: "assets/svg/menu/aren_frappe.svg",
      price: 32000,
    ),
    Product(
      name: "Matcha Frappe",
      image: "assets/svg/menu/matcha_frappe.svg",
      price: 28000,
    ),
    Product(
      name: "Choco Hazelnut Frappe",
      image: "assets/svg/menu/choco_hazelnut_frappe.svg",
      price: 32000,
    ),
  ];

  List<Product> signatureLattes = [
    Product(
      name: "Charcoal Latte",
      image: "assets/svg/menu/charcoal_latte.svg",
      price: 26000,
    ),
    Product(
      name: "Brown Sugar Latte",
      image: "assets/svg/menu/brown_sugar_latte.svg",
      price: 28000,
    ),
  ];
  List<String> banners = [
    "assets/banner/ic_mission_banner.svg",
    "assets/banner/ic_promo_flash_coffee.svg",
    "assets/banner/ic_voucher_banner.svg",
    "assets/banner/ic_profile_banner.svg",
    "assets/banner/ic_voucher_banner_.svg",
  ];
}
