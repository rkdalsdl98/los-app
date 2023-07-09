import 'package:flutter/material.dart';

class CategoryText extends StatelessWidget {
  final String category;

  const CategoryText({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      category,
      style: TextStyle(
        color: Theme.of(context).colorScheme.onBackground,
        fontSize: 14,
        fontFamily: 'SpoqaHanSans',
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
