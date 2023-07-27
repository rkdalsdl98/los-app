import 'package:flutter/material.dart';
import 'package:los_app/provider/team_provider.dart';
import 'package:provider/provider.dart';

import '../team/team.dart';

class HomeTeamPage extends StatelessWidget {
  final VoidCallback onOpenDrawer;

  const HomeTeamPage({
    super.key,
    required this.onOpenDrawer,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<TeamProvider>(
      builder: (_, provider, __) {
        return provider.team != null
            ? Team(
                teamData: provider.team!,
                onOpenDrawer: onOpenDrawer,
              )
            : emptyTeam(context);
      },
    );
  }

  Center emptyTeam(BuildContext context) {
    return Center(
      child: Container(
        width: 350,
        height: 350,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/img/los_background_translate.png',
            ),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '소속되어 있는 팀이 없습니다.\n팀을 직접 꾸리거나 다른팀에 소속되어 LOS를 즐겨보세요!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  fontSize: 12,
                  fontFamily: 'SpoqaHanSans',
                  fontWeight: FontWeight.w500,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  roundedButtonHelper(
                    context,
                    text: '팀 만들기',
                    onPressEvent: () =>
                        Navigator.pushNamed(context, '/register-team'),
                  ),
                  roundedButtonHelper(
                    context,
                    text: '팀 찾기',
                    onPressEvent: () =>
                        Navigator.pushNamed(context, '/find-team'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget roundedButtonHelper(
    BuildContext context, {
    String? text,
    VoidCallback? onPressEvent,
  }) {
    return InkWell(
      onTap: onPressEvent,
      child: Container(
        height: 30,
        width: 100,
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(45),
          border: Border.all(
            color: Colors.transparent,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.5),
              blurRadius: 1,
              spreadRadius: 0,
              offset: const Offset(0, 2),
            )
          ],
        ),
        child: Center(
          child: Text(
            text ?? 'Empty',
            style: TextStyle(
              color: Theme.of(context)
                  .colorScheme
                  .onPrimaryContainer
                  .withOpacity(.6),
              fontSize: 12,
              fontFamily: 'SpoqaHanSans',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
