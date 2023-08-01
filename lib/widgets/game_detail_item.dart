import 'package:flutter/material.dart';
import 'package:los_app/widgets/team_icon_box.dart';

class GameDetailItem extends StatefulWidget {
  const GameDetailItem({
    super.key,
  });

  @override
  State<GameDetailItem> createState() => _GameDetailItemState();
}

class _GameDetailItemState extends State<GameDetailItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 5, bottom: 5),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.2),
            blurRadius: 2,
            spreadRadius: 0,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            '농구',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onBackground,
              fontSize: 18,
              fontFamily: 'SpoqaHanSans',
              fontWeight: FontWeight.w700,
            ),
          ),
          RichText(
            text: const TextSpan(
              style: TextStyle(
                color: Color(0xFF1CBA3E),
                fontSize: 18,
                fontFamily: 'SpoqaHanSans',
                fontWeight: FontWeight.w700,
              ),
              text: '승',
              children: [
                WidgetSpan(
                  child: SizedBox(
                    width: 20,
                  ),
                ),
                TextSpan(
                  text: '64 ',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: ':',
                ),
                TextSpan(
                  text: ' 63',
                  style: TextStyle(
                    color: Color(0xFFE94251),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                WidgetSpan(
                  child: SizedBox(
                    width: 20,
                  ),
                ),
                TextSpan(
                  text: '패',
                  style: TextStyle(
                    color: Color(0xFFE94251),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TeamIconBox(
                iconImage: 'assets/img/basketball_mark.png',
                teamName: '움직이면던짐',
                padding: const EdgeInsets.all(8),
              ),
              Text(
                'VS',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 16,
                  fontFamily: 'SpoqaHanSans',
                  fontWeight: FontWeight.w400,
                ),
              ),
              TeamIconBox(
                iconImage: 'assets/img/basketball_mark2.png',
                teamName: '움직이면던짐',
              ),
            ],
          ),
          const Text(
            '승리',
            style: TextStyle(
              color: Color(0xFF1CBA3E),
              fontSize: 16,
              fontFamily: 'SpoqaHanSans',
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
