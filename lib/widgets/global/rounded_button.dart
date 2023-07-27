import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final double? scaleFactor;
  final Color? color;
  final IconData? icon;
  final Color? iconColor;

  const RoundedButton({
    super.key,
    this.scaleFactor,
    this.color,
    this.icon,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: scaleFactor != null ? 30 * scaleFactor! : 30,
      height: scaleFactor != null ? 15 * scaleFactor! : 15,
      decoration: BoxDecoration(
        color: color ?? const Color(0xFF1CBA3E),
        borderRadius: const BorderRadius.all(Radius.circular(100)),
      ),
      child: Icon(
        icon ?? Icons.check,
        size: scaleFactor != null ? 8 * scaleFactor! : 8,
        color: iconColor ?? Theme.of(context).colorScheme.background,
      ),
    );
  }
}
