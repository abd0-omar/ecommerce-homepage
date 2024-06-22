import 'package:final_ecommerce/constants.dart';
import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.title,
    required this.press,
  });

  final String title;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          InkWell(
            onTap: press,
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  child: Text(
                    "See all",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  color: kSecondaryColor.withOpacity(0.1),
                  width: 20,
                  height: 20,
                  child: const Center(
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
