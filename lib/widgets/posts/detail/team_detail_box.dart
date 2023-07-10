import 'package:flutter/material.dart';

import '../../global/circle_text.dart';

class TeamDetailBox extends StatelessWidget {
  const TeamDetailBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '작성 팀 정보',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onBackground,
              fontSize: 14,
              fontFamily: 'SpoqaHanSans',
              fontWeight: FontWeight.w700,
            ),
          ),
          Container(
            width: 500,
            height: 93.5,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            margin: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFD9DDEB)),
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              color: const Color(0xFFF8FDFF),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.2),
                  blurRadius: 4,
                  spreadRadius: 0,
                  offset: const Offset(0, 5),
                )
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Image.asset(
                    'assets/img/basketball_mark.png',
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleTextSmall(text: '팀: 움직이면던짐'),
                        CircleTextSmall(text: '랭크: Bronze'),
                        CircleTextSmall(text: '친절도: 3.0 점'),
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleTextSmall(text: '전적: 51 전 25 승 26 패'),
                        CircleTextSmall(
                          text: '승률: 49.03 %',
                          icon: const Icon(
                            Icons.play_arrow_rounded,
                            size: 12,
                            color: Color(0xFF1CBA3E),
                          ),
                        ),
                        CircleTextSmall(text: 'Los Team Point: 1,000 LP'),
                      ],
                    ),
                  ],
                ),
                const Spacer(flex: 2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
