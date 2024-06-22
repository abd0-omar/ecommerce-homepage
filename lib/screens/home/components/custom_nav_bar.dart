import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  const CustomTabBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    print("selected:::: $selectedIndex");
    return TabBar(
      indicator: TopIndicator(),
      onTap: onItemTapped,
      tabs: [
        Tab(
          icon: Icon(
            selectedIndex == 0 ? Icons.home_filled : Icons.home_outlined,
            color: Colors.black,
          ),
          text: 'Home',
        ),
        Tab(
          icon: Icon(
            selectedIndex == 1
                ? CupertinoIcons.heart_fill
                : CupertinoIcons.heart,
            color: Colors.black,
          ),
          text: 'Favorites',
        ),
        Tab(
          icon: Icon(
            selectedIndex == 2 ? CupertinoIcons.cart_fill : CupertinoIcons.cart,
            color: Colors.black,
          ),
          text: 'My Cart',
        ),
        Tab(
          icon: Icon(
            selectedIndex == 3
                ? Icons.account_circle
                : Icons.account_circle_outlined,
            color: Colors.black,
          ),
          text: 'Profile',
        ),
      ],
    );
  }
}

class TopIndicator extends Decoration {
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _TopIndicatorBox();
  }
}

class _TopIndicatorBox extends BoxPainter {
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final Paint paint = Paint()
      ..color = Colors.black
      ..isAntiAlias = true;

    // Set the length and height of the indicator
    const double lineLength = 100.0;
    const double lineHeight = 7.0;
    const double borderRadius = 7.0;

    // Calculate the position of the rectangle
    final double startX = offset.dx + (cfg.size!.width - lineLength) / 2;
    final double rectTop = offset.dy;
    final double rectBottom = rectTop + lineHeight;

    final Rect rect =
        Rect.fromLTRB(startX, rectTop, startX + lineLength, rectBottom);
    final RRect rRect = RRect.fromRectAndCorners(
      rect,
      bottomLeft: const Radius.circular(borderRadius),
      bottomRight: const Radius.circular(borderRadius),
    );

    // Draw the rounded rectangle
    canvas.drawRRect(rRect, paint);
  }
}
