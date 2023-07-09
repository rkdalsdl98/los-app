import 'package:flutter/material.dart';

class AdviceCard extends StatelessWidget {
  const AdviceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      width: 190,
      height: 110,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onTertiaryContainer,
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.2),
            blurRadius: 2,
            spreadRadius: 0,
            offset: const Offset(0, 5),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              top: 5,
            ),
            child: Text(
              'LOS',
              style: TextStyle(
                color: Theme.of(context).colorScheme.tertiaryContainer,
                fontSize: 12,
                fontFamily: 'SpoqaHanSans',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Column(
                children: [
                  Text(
                    '오늘의 띵언 카드',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiaryContainer,
                      fontSize: 13,
                      fontFamily: 'SpoqaHanSans',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '" 몸을 잘 돌보고 조심해서 다뤄라 "',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiaryContainer,
                      fontSize: 11,
                      fontFamily: 'SpoqaHanSans',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 15, right: 5),
              child: Text(
                'Advice By - 핑크덤벨요정',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.tertiaryContainer,
                  fontSize: 6,
                  fontFamily: 'SpoqaHanSans',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
