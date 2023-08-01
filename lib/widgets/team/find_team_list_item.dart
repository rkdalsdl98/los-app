import 'package:flutter/material.dart';
import 'package:los_app/datasource/dto/simple_team_info_dto.dart';
import 'package:los_app/provider/user_provider.dart';
import 'package:los_app/system/func.dart';
import 'package:los_app/system/message.dart';
import 'package:provider/provider.dart';

import '../../design/dimensions.dart';
import '../global/circle_text_button.dart';
import '../global/circle_text_small.dart';

class FindTeamListItem extends StatelessWidget {
  final SimpleTeamInfoDto info;

  const FindTeamListItem({
    super.key,
    required this.info,
  });

  void showDetailModal(
    BuildContext context, {
    Future<String> Function(String)? onPressEvent,
  }) {
    showDialog(
      context: context,
      builder: (dialogContext) => ScaffoldMessenger(
        child: Builder(builder: (builderContext) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: AlertDialog(
              backgroundColor: Theme.of(builderContext).colorScheme.background,
              surfaceTintColor: Theme.of(builderContext).colorScheme.background,
              title: Container(
                constraints: const BoxConstraints(
                  minWidth: 250,
                  minHeight: 350,
                  maxHeight: 700,
                  maxWidth: 450,
                ),
                width: 300 * getScaleFactorFromWidth(builderContext),
                height: 500 * getScaleFactorFromHeight(builderContext),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        width: 100 * getScaleFactorFromWidth(builderContext),
                        height: 100 * getScaleFactorFromWidth(builderContext),
                        child: Image.asset(
                          'assets/img/basketball_mark.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    roundedBoxHelper(
                      builderContext,
                      Text(
                        '공지사항',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground,
                          fontSize:
                              10 * getScaleFactorFromWidth(builderContext),
                          fontFamily: 'SpoqaHanSans',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                    ),
                    roundedBoxHelper(
                      builderContext,
                      Text(
                        '시간나는 사람끼리 가볍게 농구 즐기는 동아리 입니다.\n부담갖지 마시고 편하게 신청 해주세요.😀',
                        style: TextStyle(
                          color:
                              Theme.of(builderContext).colorScheme.onBackground,
                          fontSize: 8 * getScaleFactorFromWidth(builderContext),
                          fontFamily: 'SpoqaHanSans',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      width: 280 * getScaleFactorFromWidth(builderContext),
                      height: 150 * getScaleFactorFromHeight(builderContext),
                      padding: const EdgeInsets.all(10),
                    ),
                    roundedBoxHelper(
                      builderContext,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleTextSmall(
                                text: '팀: ${info.teamName}',
                                scaleFactor:
                                    getScaleFactorFromHeight(builderContext),
                              ),
                              CircleTextSmall(
                                text: '랭크: ${info.tier}',
                                scaleFactor:
                                    getScaleFactorFromHeight(builderContext),
                              ),
                              CircleTextSmall(
                                text: '친절도: ${info.kindness} 점',
                                scaleFactor:
                                    getScaleFactorFromHeight(builderContext),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleTextSmall(
                                text: '인원수: ${info.memberCount} 명',
                                scaleFactor:
                                    getScaleFactorFromHeight(builderContext),
                              ),
                              CircleTextSmall(
                                text: '전적: 51 전 25 승 26 패',
                                scaleFactor:
                                    getScaleFactorFromHeight(builderContext),
                              ),
                              CircleTextSmall(
                                text:
                                    'Los Team Point: ${addCommas(info.point!)} LP',
                                scaleFactor:
                                    getScaleFactorFromHeight(builderContext),
                              ),
                            ],
                          ),
                        ],
                      ),
                      width: 280 * getScaleFactorFromWidth(builderContext),
                      height: 93.5 * getScaleFactorFromHeight(builderContext),
                      padding: const EdgeInsets.all(10),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleTextButton(
                            text: '가입신청',
                            onPressEvent: onPressEvent != null
                                ? () {
                                    try {
                                      onPressEvent(info.teamCode!)
                                          .then((value) {
                                        Navigator.pop(context);
                                        snackBarMessage(
                                          context,
                                          value,
                                          null,
                                        );
                                      });
                                    } catch (e) {
                                      Navigator.pop(context);
                                      snackBarErrorMessage(context,
                                          "예기치 못한 오류가 발생했습니다", e.toString());
                                    }
                                  }
                                : null,
                            textStyle: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onBackground
                                  .withOpacity(.5),
                              fontSize:
                                  12 * getScaleFactorFromHeight(builderContext),
                              fontFamily: 'SpoqaHanSans',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          CircleTextButton(
                            text: '닫기',
                            onPressEvent: () => Navigator.pop(builderContext),
                            textStyle: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onBackground
                                  .withOpacity(.5),
                              fontSize:
                                  12 * getScaleFactorFromHeight(builderContext),
                              fontFamily: 'SpoqaHanSans',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          );
        }),
      ),
    );
  }

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
                info.teamName!,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 8 * getScaleFactorFromWidth(context),
                  fontFamily: 'SpoqaHanSans',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(width: 40 * getScaleFactorFromWidth(context)),
          Text(
            '${info.kindness}점',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onBackground,
              fontSize: 8 * getScaleFactorFromWidth(context),
              fontFamily: 'SpoqaHanSans',
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(width: 50 * getScaleFactorFromWidth(context)),
          Text(
            info.tier!,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onBackground,
              fontSize: 8 * getScaleFactorFromWidth(context),
              fontFamily: 'SpoqaHanSans',
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(width: 50 * getScaleFactorFromWidth(context)),
          Row(
            children: [
              Text(
                '${info.memberCount}명',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 8 * getScaleFactorFromWidth(context),
                  fontFamily: 'SpoqaHanSans',
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(width: 10 * getScaleFactorFromWidth(context)),
              Consumer<UserProvider>(
                builder: (_, provider, __) {
                  if (provider.subcribeTeamInfo == null) {
                    return CircleTextButton(
                      text: '상세정보',
                      onPressEvent: () => showDetailModal(
                        context,
                        onPressEvent: provider.setSubcribeTeam,
                      ),
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
                    );
                  } else {
                    final isSubcribe =
                        provider.subcribeTeamInfo!['teamCode'] == info.teamCode;
                    return CircleTextButton(
                      isActive: isSubcribe,
                      text: isSubcribe ? '가입취소' : '상세정보',
                      onPressEvent: isSubcribe
                          ? () {
                              try {
                                provider.removeSubcribeTeam();
                              } catch (e) {
                                print(e);
                              }
                            }
                          : null,
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
                    );
                  }
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}

Widget roundedBoxHelper(
  BuildContext context,
  Widget child, {
  EdgeInsetsGeometry? padding,
  EdgeInsetsGeometry? margin,
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
      margin: margin ?? const EdgeInsets.symmetric(vertical: 5),
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
