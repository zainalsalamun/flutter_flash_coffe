class Product {
  final String name;
  final String image;
  final int price;
  final String tag;

  Product({
    required this.name,
    required this.image,
    required this.price,
    this.tag = "",
  });
}
