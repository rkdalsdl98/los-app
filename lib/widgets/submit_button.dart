import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final Function() onTapEvent;
  final String text;
  final Color buttonColor;

  const SubmitButton({
    super.key,
    required this.onTapEvent,
    required this.text,
    required this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onTapEvent,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 100,
            vertical: 10,
          ),
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(45),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.5),
                blurRadius: 1,
                spreadRadius: 0,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Text(
            text,
            style: TextStyle(
              color: Theme.of(context).colorScheme.background,
              fontSize: 12,
              fontFamily: 'SpoqaHanSans',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
