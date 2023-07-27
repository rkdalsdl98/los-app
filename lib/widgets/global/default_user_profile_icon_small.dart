import 'package:flutter/material.dart';

class DefaultUserProfileIconSmall extends StatelessWidget {
  final double? scaleFactor;
  const DefaultUserProfileIconSmall({
    super.key,
    this.scaleFactor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: scaleFactor != null ? 30 * scaleFactor! : 30,
      height: scaleFactor != null ? 30 * scaleFactor! : 30,
      decoration: const BoxDecoration(
        color: Color(0xFFA6C4E5),
        borderRadius: BorderRadius.all(Radius.circular(100)),
      ),
      child: Icon(
        Icons.person,
        color: const Color(0xFFE9F1F4),
        size: scaleFactor != null ? 18 * scaleFactor! : 18,
      ),
    );
  }
}
