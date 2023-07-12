import 'package:flutter/material.dart';

class CircleTextLarge extends StatelessWidget {
  final String text;
  Icon? icon;

  CircleTextLarge({
    super.key,
    required this.text,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        border: Border.all(
          color: Theme.of(context).colorScheme.onBackground.withOpacity(.5),
        ),
        borderRadius: const BorderRadius.all(Radius.circular(100)),
      ),
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onBackground,
              fontSize: 12,
              fontFamily: 'SpoqaHanSans',
              fontWeight: FontWeight.w500,
            ),
          ),
          if (icon != null)
            RotatedBox(
              quarterTurns: 3,
              child: icon,
            ),
        ],
      ),
    );
  }
}
