import 'package:flutter/material.dart';

class PostInfo extends StatelessWidget {
  final TextStyle style;

  const PostInfo({
    super.key,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('팀명: 움직이면던짐', style: style),
        Text('종목: 농구', style: style),
        Text('경기날짜: 2023-06-27', style: style),
        Text('경기시간: 3시간 10분', style: style),
        Text('경기장소: 인천광역시 부평구 삼산동 458-1', style: style),
      ],
    );
  }
}
