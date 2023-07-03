import 'package:flutter/material.dart';

class SignButton extends StatelessWidget {
  final Function() onTapEvent;
  const SignButton({
    super.key,
    required this.onTapEvent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 70),
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
      child: InkWell(
        onTap: onTapEvent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(
              flex: 2,
            ),
            Image.asset(
              'assets/img/LOS.png',
              scale: 5,
            ),
            const Spacer(
              flex: 1,
            ),
            Text(
              'LOS 아이디 만들고 시작하기',
              style: TextStyle(
                color: Theme.of(context)
                    .colorScheme
                    .onPrimaryContainer
                    .withOpacity(.6),
                fontSize: 14,
                fontFamily: 'SpoqaHanSans',
                fontWeight: FontWeight.w700,
              ),
            ),
            const Spacer(
              flex: 3,
            ),
          ],
        ),
      ),
    );
  }
}
