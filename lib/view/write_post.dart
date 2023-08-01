import 'package:flutter/material.dart';
import 'package:los_app/design/dimensions.dart';
import 'package:los_app/widgets/global/circle_text_button.dart';
import 'package:los_app/widgets/input_field.dart';

class WritePost extends StatefulWidget {
  const WritePost({super.key});

  @override
  State<WritePost> createState() => _WritePostState();
}

class _WritePostState extends State<WritePost> {
  TextEditingController titleController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController placeController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  String? playDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30 * getScaleFactorFromHeight(context)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 300 * getScaleFactorFromWidth(context),
                    height: 50,
                    child: InputField(
                      controller: titleController,
                      hintText: null,
                      prefixIcon: null,
                      type: 'title',
                      validator: null,
                      textStyle: TextStyle(
                        color: Theme.of(context).colorScheme.onBackground,
                        fontSize: 20 * getScaleFactorFromHeight(context),
                        fontFamily: 'SpoqaHanSans',
                        fontWeight: FontWeight.w700,
                      ),
                      alignVertical: TextAlignVertical.center,
                      align: TextAlign.left,
                      padding: EdgeInsets.zero,
                      customDecoration: InputDecoration(
                        border: InputBorder.none,
                        errorBorder: InputBorder.none,
                        hintStyle: TextStyle(
                          color: Theme.of(context)
                              .colorScheme
                              .onBackground
                              .withOpacity(.5),
                          fontSize: 20 * getScaleFactorFromHeight(context),
                          fontFamily: 'SpoqaHanSans',
                          fontWeight: FontWeight.w700,
                        ),
                        hintText: '제목을 입력해주세요.',
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.close,
                      size: 24 * getScaleFactorFromHeight(context),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: roundedBoxHelper(
                context,
                InkWell(
                  onTap: () async {
                    final birth = await showDatePicker(
                      context: context,
                      locale: const Locale('ko', 'KR'),
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(DateTime.now().year + 1),
                      initialDatePickerMode: DatePickerMode.day,
                    );
                    if (birth == null && context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('날짜를 선택해주세요')));
                    } else {
                      playDate = birth.toString().split(' ')[0];
                    }
                    setState(() {});
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            playDate ?? '경기날짜를 선택해주세요',
                            style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onBackground
                                  .withOpacity(.2),
                              fontSize: 18 * getScaleFactorFromHeight(context),
                              fontFamily: 'SpoqaHanSans',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        RotatedBox(
                          quarterTurns: 1,
                          child: Icon(
                            Icons.play_arrow_rounded,
                            size: 20 * getScaleFactorFromHeight(context),
                            color: Theme.of(context)
                                .colorScheme
                                .onBackground
                                .withOpacity(.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                width: double.maxFinite,
                height: 50,
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.symmetric(horizontal: 5),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: roundedBoxHelper(
                context,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: InputField(
                    controller: timeController,
                    hintText: null,
                    prefixIcon: null,
                    type: 'time',
                    validator: null,
                    textInputType: TextInputType.number,
                    textStyle: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize: 18 * getScaleFactorFromHeight(context),
                      fontFamily: 'SpoqaHanSans',
                      fontWeight: FontWeight.w700,
                    ),
                    alignVertical: TextAlignVertical.center,
                    align: TextAlign.left,
                    padding: EdgeInsets.zero,
                    customDecoration: InputDecoration(
                      border: InputBorder.none,
                      errorBorder: InputBorder.none,
                      hintStyle: TextStyle(
                        color: Theme.of(context)
                            .colorScheme
                            .onBackground
                            .withOpacity(.2),
                        fontSize: 18 * getScaleFactorFromHeight(context),
                        fontFamily: 'SpoqaHanSans',
                        fontWeight: FontWeight.w600,
                      ),
                      hintText: '경기시간을 입력해주세요',
                      suffixText: '단위 = 분',
                      suffixStyle: TextStyle(
                        color: Theme.of(context)
                            .colorScheme
                            .onBackground
                            .withOpacity(.2),
                        fontSize: 12 * getScaleFactorFromHeight(context),
                        fontFamily: 'SpoqaHanSans',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                width: double.maxFinite,
                height: 50,
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.symmetric(horizontal: 5),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: roundedBoxHelper(
                context,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: InputField(
                    controller: placeController,
                    hintText: null,
                    prefixIcon: null,
                    type: 'place',
                    validator: null,
                    textStyle: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize: 18 * getScaleFactorFromHeight(context),
                      fontFamily: 'SpoqaHanSans',
                      fontWeight: FontWeight.w700,
                    ),
                    alignVertical: TextAlignVertical.center,
                    align: TextAlign.left,
                    padding: EdgeInsets.zero,
                    customDecoration: InputDecoration(
                      border: InputBorder.none,
                      errorBorder: InputBorder.none,
                      hintStyle: TextStyle(
                        color: Theme.of(context)
                            .colorScheme
                            .onBackground
                            .withOpacity(.2),
                        fontSize: 18 * getScaleFactorFromHeight(context),
                        fontFamily: 'SpoqaHanSans',
                        fontWeight: FontWeight.w600,
                      ),
                      hintText: '정확한 경기장소를 입력해주세요',
                    ),
                  ),
                ),
                width: double.maxFinite,
                height: 50,
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.symmetric(horizontal: 5),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: roundedBoxHelper(
                context,
                Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: InputField(
                          controller: contentController,
                          hintText: null,
                          prefixIcon: null,
                          type: 'content',
                          validator: null,
                          textStyle: TextStyle(
                            color: Theme.of(context).colorScheme.onBackground,
                            fontSize: 18 * getScaleFactorFromHeight(context),
                            fontFamily: 'SpoqaHanSans',
                            fontWeight: FontWeight.w700,
                          ),
                          alignVertical: TextAlignVertical.center,
                          align: TextAlign.left,
                          padding: EdgeInsets.zero,
                          customDecoration: InputDecoration(
                            border: InputBorder.none,
                            errorBorder: InputBorder.none,
                            hintStyle: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onBackground
                                  .withOpacity(.2),
                              fontSize: 18 * getScaleFactorFromHeight(context),
                              fontFamily: 'SpoqaHanSans',
                              fontWeight: FontWeight.w600,
                            ),
                            hintText: '내용을 입력해주세요.',
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: SizedBox(
                        height: 30,
                        child: CircleTextButton(
                          text: '등록하기',
                          onPressEvent: () {},
                        ),
                      ),
                    )
                  ],
                ),
                width: double.maxFinite,
                height: 540 * getScaleFactorFromHeight(context),
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.symmetric(horizontal: 5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget roundedBoxHelper(
  BuildContext context,
  Widget child, {
  EdgeInsetsGeometry? padding,
  EdgeInsetsGeometry? margin,
  double? width,
  double? height,
  VoidCallback? onPressEvent,
}) {
  return InkWell(
    onTap: onPressEvent,
    child: Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin ?? const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
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
      child: child,
    ),
  );
}
