import 'package:flutter/material.dart';
import 'package:los_app/widgets/global/circle_text_button.dart';

import '../widgets/posts/detail/team_detail_box.dart';

class PostDetail extends StatelessWidget {
  const PostDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Align(
        alignment: Alignment.topCenter,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          margin: const EdgeInsets.only(bottom: 20, left: 5, right: 5),
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.note_rounded,
                          color:
                              Theme.of(context).colorScheme.tertiaryContainer,
                          shadows: [
                            Shadow(
                              color: Colors.black.withOpacity(.2),
                              offset: const Offset(0, 2),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                        Text(
                          '팀명: 움직이면던짐\n종목: 농구\n경기날짜: 2023-06-27\n경기시간: 3시간 10분\n경기장소: 인천광역시 부평구 삼산동 458-1\n친절도: 3.0 점',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onBackground
                                .withOpacity(.5),
                            fontSize: 10,
                            fontFamily: 'SpoqaHanSans',
                            fontWeight: FontWeight.w400,
                            height: 1.5,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      '2023-06-27 작성됨',
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
                  ],
                ),
                const SizedBox(height: 5),
                Text(
                  '시간나는 사람끼리 가볍게 농구 즐기는 동아리 입니다.\n부담갖지 마시고 편하게 신청 해주세요.😀',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 12,
                    fontFamily: 'SpoqaHanSans',
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleTextButton(
                      text: '수정하기',
                      onPressEvent: () {},
                    ),
                    CircleTextButton(
                      text: '경기신청',
                      onPressEvent: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                const TeamDetailBox(),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: Text(
          '부평구 삼산동에서 농구 할 팀 구합니다.',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onBackground,
            fontSize: 16,
            fontFamily: 'SpoqaHanSans',
            fontWeight: FontWeight.w700,
          ),
        ),
        elevation: 0,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.close_rounded),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
