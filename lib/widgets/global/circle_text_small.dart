import 'package:flutter/material.dart';

class CircleTextSmall extends StatelessWidget {
  final String text;
  final double? scaleFactor;
  Icon? icon;

  CircleTextSmall({
    super.key,
    required this.text,
    this.icon,
    this.scaleFactor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
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
              fontSize: scaleFactor != null ? 8 * scaleFactor! : 8,
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
