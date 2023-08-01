import 'package:flutter/material.dart';

class CircleIconButton extends StatelessWidget {
  final Icon icon;
  final Function() onPressEvent;

  const CircleIconButton({
    super.key,
    required this.icon,
    required this.onPressEvent,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressEvent,
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          border: Border.all(
            color: Theme.of(context).colorScheme.onBackground.withOpacity(.5),
          ),
          borderRadius: const BorderRadius.all(Radius.circular(100)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.2),
              blurRadius: 1,
              spreadRadius: 0,
              offset: const Offset(0, 2),
            )
          ],
        ),
        child: icon,
      ),
    );
  }
}
