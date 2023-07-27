import 'package:flutter/material.dart';

class CircleTextButton extends StatelessWidget {
  final String text;
  final Function() onPressEvent;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final TextStyle? textStyle;

  const CircleTextButton({
    super.key,
    required this.text,
    required this.onPressEvent,
    this.margin,
    this.padding,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressEvent,
      child: Container(
        margin: margin ?? const EdgeInsets.symmetric(horizontal: 5),
        padding:
            padding ?? const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
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
        child: Text(
          text,
          style: textStyle ??
              TextStyle(
                color:
                    Theme.of(context).colorScheme.onBackground.withOpacity(.5),
                fontSize: 12,
                fontFamily: 'SpoqaHanSans',
                fontWeight: FontWeight.w700,
              ),
        ),
      ),
    );
  }
}
