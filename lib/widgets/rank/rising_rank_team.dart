import 'package:flutter/material.dart';
import 'package:los_app/widgets/rank/rising_rank_team_box.dart';

import '../../design/dimensions.dart';
import '../global/category_text.dart';

class RisingRankTeam extends StatelessWidget {
  const RisingRankTeam({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: 145,
        maxHeight: 155,
        minWidth: 150 * getScaleFactorFromWidth(context),
        maxWidth: 160 * getScaleFactorFromWidth(context),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CategoryText(category: '순위 급상승 팀'),
          RisingRankTeamBox(),
        ],
      ),
    );
  }
}
