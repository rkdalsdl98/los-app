import 'package:flutter/material.dart';

class RisingRankTeamInfoText extends StatelessWidget {
  final TextStyle style;
  final String text;

  const RisingRankTeamInfoText({
    super.key,
    required this.style,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 2,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black, //const Color(0xFFD9DDEB),
        ),
        borderRadius: const BorderRadius.all(Radius.circular(100)),
      ),
      child: Text(
        text,
        style: style,
      ),
    );
  }
}
