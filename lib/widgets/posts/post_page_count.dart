import 'package:flutter/material.dart';

import 'count_button.dart';

class PostPageCount extends StatelessWidget {
  final Function(int) setIndex;
  final int len;
  final int currIndex;

  const PostPageCount({
    super.key,
    required this.setIndex,
    required this.len,
    required this.currIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int i = 0; i < len; ++i)
            CountButton(
              setIndex: setIndex,
              position: i,
              currIndex: currIndex,
            )
        ],
      ),
    );
  }
}
