import 'package:flutter/material.dart';

class DotsItem extends StatelessWidget {
  final int position;
  final double currPage;
  double sizeScale = 1;
  double colorInterpolation = 1;

  DotsItem({
    super.key,
    required this.position,
    required this.currPage,
  });

  @override
  Widget build(BuildContext context) {
    if (position == currPage.floor()) {
      colorInterpolation = currPage - position;
      sizeScale = sizeScale * (2 - (currPage - position));
    } else if (position == currPage.ceil()) {
      colorInterpolation = position - currPage;
      sizeScale = sizeScale * (2 - (position - currPage));
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      margin: const EdgeInsets.symmetric(horizontal: 2),
      width: 10 * sizeScale,
      height: 10,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(100),
        ),
        color: Color.lerp(
          const Color(0xFF265EA7),
          const Color(0xFFACAEAF),
          colorInterpolation,
        ),
      ),
    );
  }
}
