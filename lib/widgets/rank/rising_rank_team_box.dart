import 'package:flutter/material.dart';
import 'package:los_app/widgets/rank/rising_rank_team_info.dart';

class RisingRankTeamBox extends StatelessWidget {
  const RisingRankTeamBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 115,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage('assets/img/background_logo.png'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.2),
            BlendMode.dstIn,
          ),
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      child: const RisingRankTeamInfo(),
    );
  }
}
