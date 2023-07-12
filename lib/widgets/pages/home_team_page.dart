import 'package:flutter/material.dart';
import 'package:los_app/widgets/global/circle_text_large.dart';

class HomeTeamPage extends StatelessWidget {
  const HomeTeamPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
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
                      '움직이면던짐',
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
                        textWrapHelper(
                          context,
                          'Rank',
                          'Bronze',
                          'assets/img/medal.png',
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                      ),
                      const SizedBox(width: 13),
                      roundedBoxHelper(
                        context,
                        textWrapHelper(
                          context,
                          'Los Team Point',
                          '1,000 LP',
                          null,
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        width: 105,
                        height: 55,
                      ),
                      const SizedBox(width: 13),
                      roundedBoxHelper(
                        context,
                        textWrapHelper(
                          context,
                          '친절도',
                          '3.0 점',
                          null,
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
                        textWrapHelper(
                          context,
                          '팀 생성일',
                          '2023-06-27',
                          null,
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        width: 145,
                        height: 55,
                      ),
                      const SizedBox(width: 13),
                      roundedBoxHelper(
                        context,
                        textWrapHelper(
                          context,
                          null,
                          '경기기록보기',
                          null,
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
                        textWrapHelper(
                          context,
                          '오늘 경기 횟수',
                          '0',
                          null,
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        width: 105,
                        height: 55,
                      ),
                      const SizedBox(width: 13),
                      roundedBoxHelper(
                        context,
                        textWrapHelper(
                          context,
                          '오늘 경기 남은 횟수',
                          '1',
                          null,
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        width: 105,
                        height: 55,
                      ),
                      const SizedBox(width: 13),
                      roundedBoxHelper(
                        context,
                        textWrapHelper(
                          context,
                          '인원수',
                          '20',
                          null,
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
                        textWrapHelper(
                          context,
                          null,
                          '팀 게시글 이동',
                          null,
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
                        textWrapHelper(
                          context,
                          null,
                          '채팅방 이동',
                          null,
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        width: 145,
                        height: 55,
                      ),
                    ],
                  ),
                  roundedBoxHelper(
                    context,
                    textWrapHelper(
                      context,
                      null,
                      '팀 정보 수정하기',
                      null,
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
      ),
    );
  }

  Widget textWrapHelper(
    BuildContext context,
    String? title,
    String content,
    String? assetImage,
  ) {
    return assetImage != null
        ? Row(
            children: [
              Image.asset(
                assetImage,
                width: 20,
                height: 30,
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    title!,
                    style: TextStyle(
                      color: Theme.of(context)
                          .colorScheme
                          .onBackground
                          .withOpacity(.5),
                      fontSize: 8,
                      fontFamily: 'SpoqaHanSans',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    content,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize: 16,
                      fontFamily: 'SpoqaHanSans',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              Image.asset(
                assetImage,
                width: 20,
                height: 30,
              ),
            ],
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              if (title != null)
                Text(
                  title,
                  style: TextStyle(
                    color: Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withOpacity(.5),
                    fontSize: 8,
                    fontFamily: 'SpoqaHanSans',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              Text(
                content,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 16,
                  fontFamily: 'SpoqaHanSans',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          );
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
}
