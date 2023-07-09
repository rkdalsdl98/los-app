import 'package:flutter/material.dart';
import 'package:los_app/widgets/rank/rising_rank_team_box.dart';

import '../global/category_text.dart';

class RisingRankTeam extends StatelessWidget {
  const RisingRankTeam({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 145,
        maxHeight: 155,
        minWidth: 171,
        maxWidth: 181,
      ),
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
