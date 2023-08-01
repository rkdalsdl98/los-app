import 'package:flutter/material.dart';
import 'package:los_app/widgets/posts/post_item.dart';

class PostPage extends StatelessWidget {
  const PostPage({
    super.key,
    required this.selIndex,
    required this.pages,
  });

  final int selIndex;
  final int pages;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: IndexedStack(
        index: selIndex,
        children: [
          for (int i = 0; i < pages; ++i)
            ListView.separated(
              itemBuilder: (_, __) {
                return const PostItem();
              },
              separatorBuilder: (_, __) {
                return const SizedBox(height: 10);
              },
              itemCount: 10,
            ),
        ],
      ),
    );
  }
}
