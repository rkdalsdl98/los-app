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
                Expanded(
                  child: IndexedStack(
                    index: selIndex,
                    children: [
                      ListView.separated(
                        itemBuilder: (_, __) {
                          return const PostItem();
                        },
                        separatorBuilder: (_, __) {
                          return const SizedBox(height: 10);
                        },
                        itemCount: 10,
                      ),
                      ListView.separated(
                        itemBuilder: (_, __) {
                          return const PostItem();
                        },
                        separatorBuilder: (_, __) {
                          return const SizedBox(height: 10);
                        },
                        itemCount: 5,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () => setIndex(0),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2),
                          child: Text('1'),
                        ),
                      ),
                      InkWell(
                        onTap: () => setIndex(1),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2),
                          child: Text('2'),
                        ),
                      ),
                    ],
                  ),
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

class PostItem extends StatelessWidget {
  const PostItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        border: Border.all(
          color: Theme.of(context).colorScheme.onBackground.withOpacity(.5),
        ),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.2),
            blurRadius: 2,
            spreadRadius: 0,
            offset: const Offset(0, 5),
          )
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            padding: const EdgeInsets.all(20),
            child: Image.asset(
              'assets/img/basketball_mark.png',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '부평구 삼산동에서 농구 할 팀 구합니다.',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 10,
                  fontFamily: 'SpoqaHanSans',
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              PostDetail(
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 8,
                  fontFamily: 'SpoqaHanSans',
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                '2023-06-27 작성됨',
                style: TextStyle(
                  color: Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(.5),
                  fontSize: 6,
                  fontFamily: 'SpoqaHanSans',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PostDetail extends StatelessWidget {
  final TextStyle style;

  const PostDetail({
    super.key,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '팀명: 움직이면던짐',
          style: style,
        ),
        Text(
          '종목: 농구',
          style: style,
        ),
        Text(
          '경기날짜: 2023-06-27',
          style: style,
        ),
        Text(
          '경기시간: 3시간 10분',
          style: style,
        ),
        Text(
          '경기장소: 인천광역시 부평구 삼산동 458-1',
          style: style,
        ),
      ],
    );
  }
}
