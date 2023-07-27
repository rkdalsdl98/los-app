import 'package:flutter/material.dart';

import 'dots_item.dart';

class DotsIndicator extends StatelessWidget {
  const DotsIndicator({
    super.key,
    required this.currPage,
    required this.len,
  });

  final int len;
  final double currPage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < len; ++i)
          DotsItem(
            position: i,
            currPage: currPage,
          )
      ],
    );
  }
}
