import 'package:flutter/material.dart';
import 'package:los_app/design/dimensions.dart';
import 'package:los_app/provider/team_provider.dart';
import 'package:los_app/system/func.dart';
import 'package:los_app/widgets/global/circle_text_large.dart';
import 'package:los_app/widgets/global/custom_text_wraper.dart';
import 'package:provider/provider.dart';

import '../../datasource/dto/team_dto.dart';

class HomeTeamPage extends StatelessWidget {
  const HomeTeamPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TeamProvider>(
      builder: (_, provider, __) {
        return provider.team != null
            ? Team(
                teamData: provider.team!,
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

class Team extends StatelessWidget {
  final TeamDto teamData;

  const Team({
    super.key,
    required this.teamData,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 350,
              height: 350,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/img/los_background_translate.png',
                  ),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(30),
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.background,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(100),
                      ),
                    ),
                    child: Image.asset(
                      'assets/img/basketball_mark.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  Text(
                    teamData.teamName!,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize: 16,
                      fontFamily: 'SpoqaHanSans',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          CircleTextLarge(text: '전적: 51 전 25 승 26 패'),
                          CircleTextLarge(
                            text: '승률: 49.03 %',
                            icon: const Icon(
                              Icons.play_arrow_rounded,
                              size: 16,
                              color: Color(0xFF1CBA3E),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    roundedBoxHelper(
                      context,
                      CustomTextWraper(
                        title: 'Rank',
                        content: teamData.tier!,
                        assetImage: Image.asset(
                          'assets/img/medal.png',
                          width: 18,
                          height: 26,
                        ),
                        alignment: MainAxisAlignment.spaceBetween,
                        showAssetLeft: true,
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      width: 149,
                      height: 55,
                    ),
                    const SizedBox(width: 13),
                    roundedBoxHelper(
                      context,
                      CustomTextWraper(
                        title: 'Los Team Point',
                        content: '${addCommas(teamData.point!)} LP',
                        alignment: MainAxisAlignment.center,
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      width: 105,
                      height: 55,
                    ),
                    const SizedBox(width: 13),
                    roundedBoxHelper(
                      context,
                      CustomTextWraper(
                        title: '친절도',
                        content: '${teamData.kindness} 점',
                        alignment: MainAxisAlignment.center,
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      width: 80 * getScaleFactorFromWidth(context),
                      height: 55,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    roundedBoxHelper(
                      context,
                      CustomTextWraper(
                        title: '팀 생성일',
                        content: dateFormat(
                            '${DateTime.fromMillisecondsSinceEpoch(teamData.createdAt! * 1000)}'),
                        alignment: MainAxisAlignment.center,
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      width: 145,
                      height: 55,
                    ),
                    const SizedBox(width: 13),
                    roundedBoxHelper(
                      context,
                      CustomTextWraper(
                        content: '경기기록보기',
                        alignment: MainAxisAlignment.center,
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      width: 145,
                      height: 55,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    roundedBoxHelper(
                      context,
                      CustomTextWraper(
                        title: '오늘 경기 횟수',
                        content: '${teamData.todayPlayedCount}',
                        alignment: MainAxisAlignment.center,
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      width: 105,
                      height: 55,
                    ),
                    const SizedBox(width: 13),
                    roundedBoxHelper(
                      context,
                      CustomTextWraper(
                        title: '오늘 경기 남은 횟수',
                        content: '${teamData.todayMaxPlayedCount}',
                        alignment: MainAxisAlignment.center,
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      width: 105,
                      height: 55,
                    ),
                    const SizedBox(width: 13),
                    roundedBoxHelper(
                      context,
                      CustomTextWraper(
                        title: '인원수',
                        content: '${teamData.members!.length}',
                        alignment: MainAxisAlignment.center,
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      width: 105,
                      height: 55,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    roundedBoxHelper(
                      context,
                      CustomTextWraper(
                        content: '팀 게시글 이동',
                        alignment: MainAxisAlignment.center,
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      width: 145,
                      height: 55,
                      onPressEvent: () => Navigator.pushNamed(
                        context,
                        '/postdetail',
                      ),
                    ),
                    const SizedBox(width: 13),
                    roundedBoxHelper(
                      context,
                      CustomTextWraper(
                        content: '채팅방 이동',
                        alignment: MainAxisAlignment.center,
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      width: 145,
                      height: 55,
                    ),
                  ],
                ),
                roundedBoxHelper(
                  context,
                  CustomTextWraper(
                    content: '팀 정보 수정하기',
                    alignment: MainAxisAlignment.center,
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  width: 200,
                  height: 55,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget roundedBoxHelper(
  BuildContext context,
  Widget child, {
  EdgeInsetsGeometry? padding,
  double? width,
  double? height,
  VoidCallback? onPressEvent,
}) {
  return InkWell(
    onTap: onPressEvent,
    child: Container(
      width: width,
      height: height,
      padding: padding,
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.2),
            blurRadius: 2,
            spreadRadius: 0,
            offset: const Offset(0, 5),
          )
        ],
      ),
      child: child,
    ),
  );
}
