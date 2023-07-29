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
      width: scaleFactor != null ? 40 * scaleFactor! : 40,
      height: scaleFactor != null ? 20 * scaleFactor! : 20,
      decoration: BoxDecoration(
        color: color ?? const Color(0xFF1CBA3E),
        borderRadius: const BorderRadius.all(Radius.circular(100)),
      ),
      child: Icon(
        icon ?? Icons.check,
        size: scaleFactor != null ? 14 * scaleFactor! : 14,
        color: iconColor ?? Theme.of(context).colorScheme.background,
      ),
    );
  }
}
