import 'package:final_ecommerce/screens/home/components/discount_banner.dart';
import 'package:flutter/material.dart';
import 'package:final_ecommerce/products_data/product_service.dart';
import 'package:final_ecommerce/models/Product.dart';
import 'package:final_ecommerce/screens/home/components/popular_product.dart';
import 'components/custom_app_bar.dart';
import 'components/categories.dart';
import 'components/home_header.dart';
import 'components/custom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/home";

  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Product> bestSelling;
  late List<Product> newArrival;
  late List<Product> recommendedForYou;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    loadProducts();
  }

  Future<void> loadProducts() async {
    ProductService productService = ProductService();
    List<Product> allProducts = await productService.getProducts();
    bestSelling = allProducts.where((product) => product.isBestSeller).toList();
    newArrival = allProducts.where((product) => product.isNewArrival).toList();
    recommendedForYou =
        allProducts.where((product) => product.isRecommended).toList();
    setState(() {}); // Trigger a rebuild after data is loaded
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (bestSelling.isEmpty ||
        newArrival.isEmpty ||
        recommendedForYou.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              children: [
                const HomeHeader(),
                const TestScrollView(),
                const Categories(),
                const SizedBox(height: 20),
                PopularProducts(products: bestSelling, title: 'Best Selling'),
                const SizedBox(height: 20),
                PopularProducts(products: newArrival, title: 'New Arrival'),
                const SizedBox(height: 20),
                PopularProducts(
                    products: recommendedForYou, title: 'Recommended for you'),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Material(
          color: Colors.white,
          child: CustomTabBar(
            selectedIndex: _selectedIndex,
            onItemTapped: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
