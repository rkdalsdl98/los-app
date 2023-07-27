import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../datasource/dto/team_dto.dart';
import '../../design/dimensions.dart';
import '../../provider/team_provider.dart';
import '../../system/func.dart';
import '../global/circle_text_large.dart';
import '../global/custom_text_wraper.dart';

class Team extends StatefulWidget {
  final TeamDto teamData;
  final VoidCallback onOpenDrawer;

  const Team({
    super.key,
    required this.teamData,
    required this.onOpenDrawer,
  });

  @override
  State<Team> createState() => _TeamState();
}

class _TeamState extends State<Team> {
  bool notify = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Stack(children: [
          Positioned(
            right: 5,
            top: 0,
            child: IconButton(
              onPressed: () {
                setState(() {
                  notify = false;
                  widget.onOpenDrawer();
                });
              },
              icon: const Icon(Icons.menu),
            ),
          ),
          Consumer<TeamProvider>(
            builder: (_, provider, __) {
              notify = provider.team!.joinRequests!.isNotEmpty;
              return notify
                  ? Positioned(
                      right: 10,
                      top: 0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 1,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.error,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(45),
                          ),
                        ),
                        child: const Text(
                          '!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontFamily: 'SpoqaHanSans',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    )
                  : const SizedBox();
            },
          ),
          Column(
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
                      widget.teamData.teamName!,
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
                          content: widget.teamData.tier!,
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
                          content: '${addCommas(widget.teamData.point!)} LP',
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
                          content: '${widget.teamData.kindness} 점',
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
                              '${DateTime.fromMillisecondsSinceEpoch(widget.teamData.createdAt! * 1000)}'),
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
                          content: '${widget.teamData.todayPlayedCount}',
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
                          content: '${widget.teamData.todayMaxPlayedCount}',
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
                          content: '${widget.teamData.members!.length}',
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
        ]),
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
