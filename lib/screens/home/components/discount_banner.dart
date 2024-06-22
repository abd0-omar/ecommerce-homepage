import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: Colors.indigo,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Text.rich(
        TextSpan(
          style: TextStyle(color: Colors.white),
          children: [
            TextSpan(
              text: "Black Friday 50%",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TestScrollView extends StatefulWidget {
  const TestScrollView({super.key});

  @override
  _TestScrollViewState createState() => _TestScrollViewState();
}

class _TestScrollViewState extends State<TestScrollView> {
  final PageController _controller = PageController(viewportFraction: 0.8);
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 160,
          child: PageView.builder(
            itemCount: 2,
            controller: _controller,
            onPageChanged: (index) => setState(() => _index = index),
            itemBuilder: (context, index) {
              return AnimatedPadding(
                  padding: EdgeInsets.all(_index == index ? 0.0 : 8.0),
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.fastOutSlowIn,
                  child: const DiscountBanner());
            },
          ),
        ),
        SmoothPageIndicator(
          controller: _controller,
          count: 2,
          effect: const ExpandingDotsEffect(
            dotHeight: 10,
            dotWidth: 8,
            activeDotColor: Colors.black,
          ),
        ),
      ],
    );
  }
}

class TestSmooth extends StatelessWidget {
  const TestSmooth({super.key});

  @override
  Widget build(BuildContext context) {
    return const SmoothIndicator(offset: 3.0, count: 2, size: Size(3, 3));
  }
}
