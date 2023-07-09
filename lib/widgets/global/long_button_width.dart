import 'package:flutter/material.dart';

class LongButtonWidth extends StatelessWidget {
  final String text;
  final Function() onPressEvent;

  const LongButtonWidth({
    super.key,
    required this.text,
    required this.onPressEvent,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressEvent,
      child: Container(
        width: double.maxFinite,
        height: 30,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.2),
              blurRadius: 2,
              spreadRadius: 0,
              offset: const Offset(0, 5),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                text,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  fontSize: 14,
                  fontFamily: 'SpoqaHanSans',
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
