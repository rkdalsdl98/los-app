import 'package:flutter/material.dart';
import 'package:los_app/design/dimensions.dart';

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
  String selSports = '종목선택';
  bool fromDate = false;
  bool fromTime = false;

  void setIndex(int index) {
    setState(() {
      selIndex = index;
    });
  }

  void setSelSports(String sel) => selSports = sel;
  void setFromDate(bool val) => fromDate = val;
  void setFromTime(bool val) => fromTime = val;

  void showSortModal() {
    showDialog(
      context: context,
      builder: (modalcontext) => SortModal(
        sports: selSports,
        onSelSports: setSelSports,
        date: fromDate,
        time: fromTime,
        onPressDate: setFromDate,
        onPressTime: setFromTime,
      ),
    );
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
                      onPressEvent: () =>
                          Navigator.pushNamed(context, '/write-post'),
                    ),
                    const Spacer(
                      flex: 2,
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
                      onPressEvent: showSortModal,
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

class SortModal extends StatefulWidget {
  String sports;
  bool date, time;

  final Function(bool) onPressDate;
  final Function(bool) onPressTime;
  final Function(String) onSelSports;

  SortModal({
    super.key,
    required this.sports,
    required this.onSelSports,
    required this.onPressDate,
    required this.onPressTime,
    required this.date,
    required this.time,
  });

  @override
  State<SortModal> createState() => _SortModalState();
}

class _SortModalState extends State<SortModal> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: EdgeInsets.zero,
      backgroundColor: Theme.of(context).colorScheme.background,
      surfaceTintColor: Theme.of(context).colorScheme.background,
      shape: const RoundedRectangleBorder(
        side: BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      title: Container(
        padding: const EdgeInsets.all(5),
        width: 400 * getScaleFactorFromWidth(context),
        height: 150 * getScaleFactorFromHeight(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 5),
                  child: DropdownButton<String>(
                    items: ['종목선택', '농구', '축구']
                        .map<DropdownMenuItem<String>>(
                          (sports) => DropdownMenuItem<String>(
                            value: sports,
                            child: Text(sports),
                          ),
                        )
                        .toList(),
                    onChanged: (sel) => setState(() {
                      widget.sports = sel!;
                      widget.onSelSports(sel);
                    }),
                    icon: Align(
                      alignment: Alignment.topLeft,
                      child: RotatedBox(
                        quarterTurns: 1,
                        child: Icon(
                          Icons.play_arrow_rounded,
                          size: 8 * getScaleFactorFromWidth(context),
                          color: Theme.of(context)
                              .colorScheme
                              .onBackground
                              .withOpacity(.5),
                        ),
                      ),
                    ),
                    elevation: 0,
                    underline: Container(
                        decoration: const BoxDecoration(border: Border())),
                    alignment: Alignment.center,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize: 12 * getScaleFactorFromWidth(context),
                      fontFamily: 'SpoqaHanSans',
                      fontWeight: FontWeight.w700,
                    ),
                    value: widget.sports,
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 24 * getScaleFactorFromWidth(context),
                      height: 24 * getScaleFactorFromWidth(context),
                      child: Checkbox(
                        value: widget.date,
                        onChanged: (val) => setState(() {
                          widget.date = val!;
                          widget.onPressDate(val);
                        }),
                      ),
                    ),
                    Text(
                      '경기날짜순',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onBackground,
                        fontSize: 12 * getScaleFactorFromWidth(context),
                        fontFamily: 'SpoqaHanSans',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 24 * getScaleFactorFromWidth(context),
                      height: 24 * getScaleFactorFromWidth(context),
                      child: Checkbox(
                        value: widget.time,
                        onChanged: (val) => setState(() {
                          widget.time = val!;
                          widget.onPressTime(val);
                        }),
                      ),
                    ),
                    Text(
                      '경기시간순',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onBackground,
                        fontSize: 12 * getScaleFactorFromWidth(context),
                        fontFamily: 'SpoqaHanSans',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                const SizedBox(height: 20),
                Text(
                  '종목을 선택하지 않을 경우 모든종목을 불러옵니다.',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    color: Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withOpacity(.5),
                    fontSize: 6 * getScaleFactorFromWidth(context),
                    fontFamily: 'SpoqaHanSans',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleTextButton(
                  text: '적용',
                  onPressEvent: () => Navigator.pop(context),
                  textStyle: TextStyle(
                    color: Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withOpacity(.5),
                    fontSize: 8 * getScaleFactorFromWidth(context),
                    fontFamily: 'SpoqaHanSans',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
