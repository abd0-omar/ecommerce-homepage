class Product {
  final String id;
  final String name;
  final double price;
  final String image;
  final bool isBestSeller;
  final bool isNewArrival;
  final bool isRecommended;
  bool isFavorite;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    this.isBestSeller = false,
    this.isNewArrival = false,
    this.isRecommended = false,
    this.isFavorite = false,
  });
}
