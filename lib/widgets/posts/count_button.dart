import 'package:flutter/material.dart';

class CountButton extends StatelessWidget {
  const CountButton({
    super.key,
    required this.setIndex,
    required this.position,
    required this.currIndex,
  });

  final Function(int p1) setIndex;
  final int position;
  final int currIndex;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => setIndex(position),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: Text(
          '${position + 1}',
          style: TextStyle(
            color: currIndex == position
                ? Theme.of(context).colorScheme.onBackground
                : Theme.of(context).colorScheme.onBackground.withOpacity(.5),
            fontSize: 12,
            fontFamily: 'SpoqaHanSans',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
