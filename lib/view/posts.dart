import 'package:flutter/material.dart';

import '../widgets/global/circle_icon_button.dart';
import '../widgets/global/circle_text_button.dart';

class Posts extends StatefulWidget {
  const Posts({super.key});

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  int selIndex = 0;

  void setIndex(int index) {
    setState(() {
      selIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ConstrainedBox(
        constraints: BoxConstraints.tight(const Size.fromWidth(500)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleTextButton(
                    text: '글쓰기',
                    onPressEvent: () {},
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  CircleIconButton(
                    icon: Icon(
                      Icons.message,
                      color: Theme.of(context)
                          .colorScheme
                          .onBackground
                          .withOpacity(.5),
                      size: 20,
                    ),
                    onPressEvent: () {},
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  CircleIconButton(
                    icon: Icon(
                      Icons.filter_list_rounded,
                      color: Theme.of(context)
                          .colorScheme
                          .onBackground
                          .withOpacity(.5),
                      size: 20,
                    ),
                    onPressEvent: () {},
                  )
                ],
              ),
            ),
            IndexedStack(
              index: selIndex,
              children: const [],
            ),
            const Row(
              children: [],
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(
          '게시판',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onBackground,
            fontSize: 16,
            fontFamily: 'SpoqaHanSans',
            fontWeight: FontWeight.w400,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 18,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).colorScheme.onBackground.withOpacity(.5),
          ),
        ),
      ),
    );
  }
}
