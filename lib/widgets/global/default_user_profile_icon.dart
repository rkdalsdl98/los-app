import 'package:flutter/material.dart';

class DefaultUserProfileIcon extends StatelessWidget {
  const DefaultUserProfileIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: const BoxDecoration(
        color: Color(0xFFA6C4E5),
        borderRadius: BorderRadius.all(Radius.circular(100)),
      ),
      child: const Icon(
        Icons.person,
        color: Color(0xFFE9F1F4),
        size: 64,
      ),
    );
  }
}
