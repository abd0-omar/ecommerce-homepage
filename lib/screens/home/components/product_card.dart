import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:final_ecommerce/constants.dart';
import 'package:final_ecommerce/models/Product.dart';
import 'package:final_ecommerce/cubit/favorites_cubit.dart';
import 'package:final_ecommerce/cubit/quantity_cubit.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    this.width = 140,
    this.aspectRatio = 1.02,
    required this.product,
    required this.onPress,
  });

  final double width, aspectRatio;
  final Product product;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    final String category = _getCategory(product);

    return SizedBox(
      width: width,
      child: GestureDetector(
        onTap: onPress,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: aspectRatio,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: kSecondaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Image.asset(product.image),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: BlocBuilder<FavoritesCubit,
                      Map<String, Map<String, bool>>>(
                    builder: (context, favorites) {
                      final isFavorite =
                          favorites[category]?[product.id] ?? false;
                      return InkWell(
                        borderRadius: BorderRadius.circular(50),
                        onTap: () {
                          context
                              .read<FavoritesCubit>()
                              .toggleFavorite(category, product.id);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: isFavorite
                                ? kPrimaryColor.withOpacity(0.15)
                                : kSecondaryColor.withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: isFavorite
                                ? const Color(0xFFFF4848)
                                : Colors.black,
                            size: 16,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              product.name,
              style: Theme.of(context).textTheme.bodyMedium,
              maxLines: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "EGP ${product.price}",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(50),
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          height: 24,
                          width: 24,
                          decoration: BoxDecoration(
                            color: kSecondaryColor.withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(50),
                      onTap: () {
                        context
                            .read<QuantityCubit>()
                            .increaseQuantity(category, product.id);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        height: 24,
                        width: 24,
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          CupertinoIcons.add,
                          color: Colors.white,
                          size: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _getCategory(Product product) {
    if (product.isBestSeller) {
      return 'bestSelling';
    } else if (product.isNewArrival) {
      return 'newArrival';
    } else if (product.isRecommended) {
      return 'recommendedForYou';
    } else {
      return '';
    }
  }
}
