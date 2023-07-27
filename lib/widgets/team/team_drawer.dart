import 'package:flutter/material.dart';

import 'join_request_list.dart';

class TeamDrawer extends StatelessWidget {
  final VoidCallback onCloseDrawer;

  const TeamDrawer({
    super.key,
    required this.onCloseDrawer,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color(0xFFE9F1F4),
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Container(
              width: double.maxFinite,
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 80),
              decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: Color(0xFFD9DDEB))),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '요청',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize: 16,
                      fontFamily: 'SpoqaHanSans',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '채팅',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize: 16,
                      fontFamily: 'SpoqaHanSans',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const JoinRequestList(),
            Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                height: 32,
                child: IconButton(
                  onPressed: () => onCloseDrawer(),
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
