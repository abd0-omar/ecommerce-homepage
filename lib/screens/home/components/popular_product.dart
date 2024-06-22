import 'package:final_ecommerce/screens/home/components/section_title.dart';
import 'package:flutter/material.dart';
import 'package:final_ecommerce/models/Product.dart';
import 'product_card.dart';

class PopularProducts extends StatelessWidget {
  final List<Product> products;
  final String title;

  const PopularProducts({
    super.key,
    required this.products,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    List<Product> filteredProducts = [];
    switch (title) {
      case 'Best Selling':
        filteredProducts =
            products.where((product) => product.isBestSeller).toList();
        break;
      case 'New Arrivals':
        filteredProducts =
            products.where((product) => product.isNewArrival).toList();
        break;
      case 'Recommended for You':
        filteredProducts =
            products.where((product) => product.isRecommended).toList();
        break;
      default:
        filteredProducts = products;
        break;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SectionTitle(
            title: title, // Use the title passed in
            press: () {
              // Implement the press action
            },
          ),
        ),
        const SizedBox(height: 16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              filteredProducts.length,
              (index) => Padding(
                padding: EdgeInsets.only(
                  left: index == 0 ? 20 : 10,
                  right: index == filteredProducts.length - 1 ? 20 : 0,
                ),
                child: ProductCard(
                  product: filteredProducts[index],
                  onPress: () {
                    // Implement action when product card is pressed
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
