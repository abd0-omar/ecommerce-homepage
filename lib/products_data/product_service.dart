// product_service.dart

import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/Product.dart';

class ProductService {
  Future<List<Product>> getProducts() async {
    try {
      String data =
          await rootBundle.loadString('lib/products_data/dummy_data.json');
      final jsonResult = json.decode(data);

      List<Product> products = [];

      // Process 'bestSelling' items
      if (jsonResult.containsKey('bestSelling')) {
        for (var item in jsonResult['bestSelling']) {
          products.add(Product(
            id: item['id'].toString(),
            name: item['name'].toString(),
            price: item['price'].toDouble(),
            image: '${item['image']}',
            isBestSeller: true,
          ));
        }
      }

      // Process 'newArrival' items
      if (jsonResult.containsKey('newArrival')) {
        for (var item in jsonResult['newArrival']) {
          products.add(Product(
            id: item['id'].toString(),
            name: item['name'].toString(),
            price: item['price'].toDouble(),
            image: '${item['image']}',
            isNewArrival: true,
          ));
        }
      }

      // Process 'recommendedForYou' items
      if (jsonResult.containsKey('recommendedForYou')) {
        for (var item in jsonResult['recommendedForYou']) {
          products.add(Product(
              id: item['id'].toString(),
              name: item['name'].toString(),
              price: item['price'].toDouble(),
              image: '${item['image']}',
              isRecommended: true));
        }
      }

      return products;
    } catch (e) {
      print('Error loading JSON: $e');
      return [];
    }
  }
}
