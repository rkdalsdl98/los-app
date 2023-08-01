import 'package:flutter/material.dart';

import 'dots_indicator.dart';
import 'game_detail_item.dart';

class LatelyGameDetails extends StatefulWidget {
  final int detailCount;

  const LatelyGameDetails({
    super.key,
    required this.detailCount,
  });

  @override
  State<LatelyGameDetails> createState() => _LatelyGameDetailsState();
}

class _LatelyGameDetailsState extends State<LatelyGameDetails> {
  PageController pageController = PageController(viewportFraction: .9);
  double currPage = 0;
  double boxOpacity = 0;
  void setShowQuestionBox(bool state) {
    setState(() {
      boxOpacity = boxOpacity == 0 ? 1 : 0;
    });
  }

  @override
  void initState() {
    super.initState();
    pageController.addListener(() => setState(() {
          currPage = pageController.page!;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Text(
              '최근 경기',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
                fontSize: 14,
                fontFamily: 'SpoqaHanSans',
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            InkWell(
              onTapDown: (_) => setShowQuestionBox(true),
              onTapUp: (_) => setShowQuestionBox(false),
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: const Color(0xFFD9DDEB),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(100),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.2),
                      blurRadius: 2,
                      spreadRadius: 0,
                      offset: const Offset(1, 2),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.question_mark_rounded,
                  color: Color(0xFF93969F),
                  size: 10,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Stack(
          children: [
            SizedBox(
              width: 180 * (MediaQuery.of(context).size.width / 360),
              height: 150,
              child: PageView.builder(
                controller: pageController,
                itemBuilder: (context, index) {
                  return const GameDetailItem();
                },
                itemCount: widget.detailCount,
              ),
            ),
            Positioned(
              top: 5,
              left: 20,
              right: 25,
              child: AnimatedOpacity(
                opacity: boxOpacity,
                duration: const Duration(milliseconds: 300),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                  decoration: const BoxDecoration(
                    color: Color(0xFFD9DDEB),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: Text(
                    '최근 한달동안 있었던 경기 중,\n최대 5개의 기록을 불러옵니다.\n모든 내역을 보시려면 "경기기록보기" 탭에서 확인 하실 수 있습니다.',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize: 8,
                      fontFamily: 'SpoqaHanSans',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        DotsIndicator(
          currPage: currPage,
          len: widget.detailCount,
        ),
      ],
    );
  }
}
