import 'package:flutter/material.dart';
import 'package:los_app/design/dimensions.dart';

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
            constraints: BoxConstraints(
              minHeight: 22,
              maxHeight: 27,
              minWidth: 150 * getScaleFactorFromWidth(context),
              maxWidth: 160 * getScaleFactorFromWidth(context),
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
                Container(
                  padding: const EdgeInsets.all(4),
                  margin: const EdgeInsets.only(right: 5),
                  child: Image.asset(
                    'assets/img/basketball_mark.png',
                    fit: BoxFit.contain,
                    width: 20 * getScaleFactorFromWidth(context),
                    height: 30 * getScaleFactorFromWidth(context),
                  ),
                ),
                Text(
                  '움직이면던짐',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                    fontSize: 8 * getScaleFactorFromWidth(context),
                    fontFamily: 'SpoqaHanSans',
                    fontWeight: FontWeight.w400,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const Spacer(
                  flex: 2,
                ),
                Text(
                  'Bronze',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                    fontSize: 8 * getScaleFactorFromWidth(context),
                    fontFamily: 'SpoqaHanSans',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                RotatedBox(
                  quarterTurns: 3,
                  child: Icon(
                    Icons.play_arrow_rounded,
                    size: 16 * getScaleFactorFromWidth(context),
                    color: const Color(0xFF1CBA3E),
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
