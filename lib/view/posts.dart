import 'package:flutter/material.dart';

import '../widgets/global/circle_icon_button.dart';
import '../widgets/global/circle_text_button.dart';
import '../widgets/posts/post_page.dart';
import '../widgets/posts/post_page_count.dart';

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
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints.tight(const Size.fromWidth(500)),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              children: [
                Row(
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
                const SizedBox(
                  height: 20,
                ),
                PostPage(
                  selIndex: selIndex,
                  pages: 2,
                ),
                const SizedBox(
                  height: 10,
                ),
                PostPageCount(
                  setIndex: setIndex,
                  len: 2,
                  currIndex: selIndex,
                ),
              ],
            ),
          ),
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
        elevation: 0,
        scrolledUnderElevation: 0,
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
