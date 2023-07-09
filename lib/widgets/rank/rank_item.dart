import 'package:flutter/material.dart';

class RankItem extends StatelessWidget {
  const RankItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 27,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            constraints: const BoxConstraints(
              minHeight: 22,
              maxHeight: 27,
              minWidth: 150,
              maxWidth: 181,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: const BorderRadius.all(Radius.circular(100)),
              border: Border.all(color: const Color(0xFFD9DDEB)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(2),
                  child: Image.asset(
                    'assets/img/basketball_mark.png',
                    fit: BoxFit.contain,
                    width: 40,
                    height: 40,
                  ),
                ),
                Text(
                  '움직이면던짐',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                    fontSize: 10,
                    fontFamily: 'SpoqaHanSans',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Spacer(
                  flex: 2,
                ),
                Text(
                  'Bronze',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                    fontSize: 10,
                    fontFamily: 'SpoqaHanSans',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const RotatedBox(
                  quarterTurns: 3,
                  child: Icon(
                    Icons.play_arrow_rounded,
                    size: 18,
                    color: Color(0xFF1CBA3E),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
