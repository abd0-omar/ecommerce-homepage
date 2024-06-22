import 'package:final_ecommerce/constants.dart';
import 'package:flutter/material.dart';

import 'search_field.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(child: SearchField()),
          const SizedBox(width: 16),
          InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {},
            child: Container(
                padding: const EdgeInsets.all(12),
                height: 46,
                width: 46,
                decoration: BoxDecoration(
                  color: kSecondaryColor.withOpacity(0.1),
                  shape: BoxShape.rectangle,
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                ),
                child: const Icon(Icons.tune)),
          ),
        ],
      ),
    );
  }
}
