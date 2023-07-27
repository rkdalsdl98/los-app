import 'package:flutter/material.dart';

import '../../design/dimensions.dart';
import '../global/circle_text_button.dart';

class FindTeamListItem extends StatelessWidget {
  const FindTeamListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 50,
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.2),
            blurRadius: 1,
            spreadRadius: 1,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                width: 50,
                height: 50,
                child: Image.asset(
                  'assets/img/basketball_mark.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
              Text(
                '움직이면던짐',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 8 * getScaleFactorFromWidth(context),
                  fontFamily: 'SpoqaHanSans',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(width: 30 * getScaleFactorFromWidth(context)),
          Text(
            '3.0점',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onBackground,
              fontSize: 8 * getScaleFactorFromWidth(context),
              fontFamily: 'SpoqaHanSans',
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(width: 40 * getScaleFactorFromWidth(context)),
          Text(
            'Unknown',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onBackground,
              fontSize: 8 * getScaleFactorFromWidth(context),
              fontFamily: 'SpoqaHanSans',
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(width: 40 * getScaleFactorFromWidth(context)),
          Row(
            children: [
              Text(
                '1명',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 8 * getScaleFactorFromWidth(context),
                  fontFamily: 'SpoqaHanSans',
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(width: 10 * getScaleFactorFromWidth(context)),
              CircleTextButton(
                text: '상세정보',
                onPressEvent: () {},
                margin: const EdgeInsets.only(right: 10),
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                textStyle: TextStyle(
                  color: Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(.5),
                  fontSize: 7 * getScaleFactorFromWidth(context),
                  fontFamily: 'SpoqaHanSans',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
