import 'package:flutter/material.dart';
import 'package:los_app/widgets/rank/rising_rank_team_info_text.dart';

class RisingRankTeamInfo extends StatelessWidget {
  const RisingRankTeamInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xFFD9DDEB),
            ),
            borderRadius: const BorderRadius.all(Radius.circular(100)),
          ),
          child: Image.asset(
            'assets/img/basketball_mark.png',
            fit: BoxFit.cover,
          ),
        ),
        RisingRankTeamInfoText(
          style: TextStyle(
            color: Theme.of(context).colorScheme.onBackground,
            fontSize: 6,
            fontFamily: 'SpoqaHanSans',
            fontWeight: FontWeight.w600,
          ),
          text: 'Bronze',
        ),
        RisingRankTeamInfoText(
          style: TextStyle(
            color: Theme.of(context).colorScheme.onBackground,
            fontSize: 6,
            fontFamily: 'SpoqaHanSans',
            fontWeight: FontWeight.w400,
          ),
          text: '움직이면던짐',
        ),
        RisingRankTeamInfoText(
          style: TextStyle(
            color: Theme.of(context).colorScheme.onBackground,
            fontSize: 6,
            fontFamily: 'SpoqaHanSans',
            fontWeight: FontWeight.w400,
          ),
          text: '친절도 3.0 점',
        ),
      ],
    );
  }
}
