import 'package:flutter/material.dart';

import '../../design/dimensions.dart';
import '../global/default_user_profile_icon_small.dart';
import '../global/rounded_button.dart';

class JoinRequestList extends StatelessWidget {
  const JoinRequestList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            joinRequestHelper(context),
          ],
        ),
      ),
    );
  }

  Container joinRequestHelper(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: double.maxFinite,
      height: 60 * getScaleFactorFromHeight(context),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: const BorderRadius.all(Radius.circular(100)),
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DefaultUserProfileIconSmall(
              scaleFactor: getScaleFactorFromHeight(context)),
          RichText(
            textAlign: TextAlign.left,
            text: TextSpan(
              text: '농구가하고싶어요\n\n',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
                fontSize: 8 * getScaleFactorFromHeight(context),
                fontFamily: 'SpoqaHanSans',
                fontWeight: FontWeight.w400,
                height: 1.3,
              ),
              children: const [
                TextSpan(text: '나이: 22세\n'),
                TextSpan(text: '키: 180cm\n'),
                TextSpan(text: '몸무게: 95kg\n'),
              ],
            ),
          ),
          Text(
            '세부정보 공개를 허락하지 않은 유저입니다.',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onBackground.withOpacity(.5),
              fontSize: 6,
              fontFamily: 'SpoqaHanSans',
              fontWeight: FontWeight.w400,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RoundedButton(scaleFactor: getScaleFactorFromHeight(context)),
              RoundedButton(
                scaleFactor: getScaleFactorFromHeight(context),
                color: const Color(0xFFE94251),
                icon: Icons.close,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
