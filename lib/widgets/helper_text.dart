import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HelperText extends StatelessWidget {
  final String firstText;
  final String secondText;
  final String eventText;
  final GestureRecognizer recognizer;

  const HelperText({
    super.key,
    required this.firstText,
    required this.secondText,
    required this.eventText,
    required this.recognizer,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: RichText(
        text: TextSpan(
          style: TextStyle(
            fontSize: 10,
            fontFamily: 'SpoqaHanSans',
            fontWeight: FontWeight.w400,
            color: Theme.of(context).colorScheme.onBackground.withOpacity(.6),
          ),
          text: firstText,
          children: [
            TextSpan(
              recognizer: recognizer,
              text: eventText,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            TextSpan(text: secondText),
          ],
        ),
      ),
    );
  }
}
