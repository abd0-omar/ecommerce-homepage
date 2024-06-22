import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          const Text(
            'Slash.',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 60),
            child: InkWell(
              onTap: () {
                // Handle location tap
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                child: const Row(
                  children: [
                    Icon(Icons.location_on),
                    SizedBox(width: 5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Nasr City', style: TextStyle(fontSize: 16)),
                        Text(
                          'Cairo',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(width: 5),
                    Icon(Icons.keyboard_arrow_down),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      actions: [
        Stack(
          children: [
            IconButton(
              icon: const Icon(CupertinoIcons.bell),
              onPressed: () {
                // Handle bell icon press
              },
            ),
            Positioned(
              right: 11,
              top: 11,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(6),
                ),
                constraints: const BoxConstraints(
                  minWidth: 12,
                  minHeight: 12,
                ),
                // Uncomment the below lines if you want to show a notification count
                // child: const Text(
                //   '1',
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontSize: 8,
                //   ),
                //   textAlign: TextAlign.center,
                // ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
