import 'package:flutter/material.dart';

class TeamIconBox extends StatelessWidget {
  final String iconImage;
  final String teamName;
  EdgeInsetsGeometry? padding;

  TeamIconBox({
    super.key,
    required this.iconImage,
    required this.teamName,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: padding,
          width: 60,
          height: 40,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            borderRadius: const BorderRadius.all(
              Radius.circular(100),
            ),
          ),
          child: Image.asset(
            iconImage,
            fit: BoxFit.contain,
          ),
        ),
        Text(
          teamName,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onBackground,
            fontSize: 8,
            fontFamily: 'SpoqaHanSans',
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
