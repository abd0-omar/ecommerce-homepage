import 'package:flutter/material.dart';
import 'section_title.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"icon": "assets/", "text": "Fashion"},
      {"icon": "assets/", "text": "Games"},
      {"icon": "assets/", "text": "Accessories"},
      {"icon": "assets/", "text": "Books"},
      {"icon": "assets/", "text": "Artists"},
      {"icon": "assets/", "text": "Fashion"},
    ];

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SectionTitle(
            title: "Categories",
            press: () {},
          ),
        ),
        const SizedBox(height: 16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              categories.length,
              (index) => Padding(
                padding: EdgeInsets.only(
                  left: index == 0 ? 20 : 10,
                  // padding for the last index to the right
                  right: index == categories.length - 1 ? 20 : 0,
                ),
                child: CategoryCard(
                  icon: categories[index]["icon"],
                  text: categories[index]["text"],
                  press: () {},
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.icon,
    required this.text,
    required this.press,
  });

  final String icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            height: 75,
            width: 75,
            decoration: BoxDecoration(
              color: const Color(0xFFFFECDF),
              borderRadius: BorderRadius.circular(100),
            ),
            // child: SvgPicture.asset(icon),
          ),
          const SizedBox(height: 4),
          Text(text, textAlign: TextAlign.center)
        ],
      ),
    );
  }
}
