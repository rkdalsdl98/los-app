import 'package:flutter/material.dart';
import 'package:los_app/design/dimensions.dart';
import 'package:los_app/provider/user_provider.dart';
import 'package:los_app/system/auth.dart';
import 'package:los_app/system/message.dart';
import 'package:los_app/widgets/global/custom_slider_box.dart';
import 'package:los_app/widgets/global/default_user_profile_icon.dart';
import 'package:provider/provider.dart';

class HomeMyPage extends StatefulWidget {
  const HomeMyPage({super.key});

  @override
  State<HomeMyPage> createState() => _HomeMyPageState();
}

class _HomeMyPageState extends State<HomeMyPage> {
  double sliderValue = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Consumer<UserProvider>(builder: (_, provider, __) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      const DefaultUserProfileIcon(),
                      Positioned(
                        left: 65,
                        top: 65,
                        child: IconButton(
                          onPressed: () {},
                          iconSize: 20,
                          icon: const Icon(
                            Icons.image_rounded,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${provider.userData?.nickName}",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onBackground,
                        fontSize: 16,
                        fontFamily: 'SpoqaHanSans',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Icon(
                      Icons.edit_square,
                      size: 12,
                      color: Theme.of(context)
                          .colorScheme
                          .onPrimaryContainer
                          .withOpacity(.6),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    '생성일: ${provider.userData?.createdAt?.toDate().toString().substring(0, 11)}\n이메일: ${provider.userData?.email}\n소속: 움직이면던짐',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Theme.of(context)
                          .colorScheme
                          .onBackground
                          .withOpacity(.5),
                      fontSize: 14,
                      fontFamily: 'SpoqaHanSans',
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    roundedEditBoxHelper(
                      context,
                      title: '이름',
                      true,
                      content: '${provider.userData?.name}',
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 25,
                      ),
                      height: 50,
                    ),
                    roundedEditBoxHelper(
                      context,
                      true,
                      title: '주소',
                      content: '${provider.userData?.address}',
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 25,
                      ),
                      height: 50,
                    ),
                    roundedEditBoxHelper(
                      context,
                      title: '전화번호',
                      true,
                      content: '${provider.userData?.phoneNumber}',
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 20),
                      width: 160 * getScaleFactorFromWidth(context),
                      height: 50,
                    ),
                    Row(
                      children: [
                        roundedEditBoxHelper(
                          context,
                          title: '이름',
                          true,
                          content: '${provider.userData?.nickName}',
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 20),
                          width: 140 * getScaleFactorFromWidth(context),
                          height: 50,
                        ),
                        const SizedBox(width: 5),
                        roundedEditBoxHelper(
                          context,
                          title: '키',
                          true,
                          content: '${provider.userData?.height}cm',
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 25,
                          ),
                          height: 50,
                        ),
                        const SizedBox(width: 5),
                        roundedEditBoxHelper(
                          context,
                          title: '몸무게',
                          true,
                          content: '${provider.userData?.weight}kg',
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 25,
                          ),
                          height: 50,
                        ),
                      ],
                    ),
                    roundedEditBoxHelper(
                      context,
                      title: '좋아하는 운동',
                      true,
                      content: '${provider.userData?.favoriteSports}',
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 20),
                      width: 160 * getScaleFactorFromWidth(context),
                      height: 50,
                    ),
                  ],
                ),
                const Row(
                  children: [
                    CustomSliderBox(title: '게시글 알림'),
                    CustomSliderBox(title: '채팅방 알림'),
                  ],
                ),
              ],
            ),
            Align(
              alignment: Alignment.centerRight,
              child: roundedEditBoxHelper(
                context,
                false,
                content: '로그아웃',
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                contentColor: Theme.of(context).colorScheme.error,
                onPressEvent: () => showDialogMessage(
                  context,
                  '계정을 로그아웃 하시겠습니까?',
                  [
                    TextButton(
                      child: const Text('예'),
                      onPressed: () => losSignOut(context),
                    ),
                    TextButton(
                      child: const Text('아니오'),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
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

Widget roundedEditBoxHelper(
  BuildContext context,
  bool showEditButton, {
  String? title,
  String? content,
  double? width,
  double? height,
  VoidCallback? onPressEvent,
  EdgeInsetsGeometry? padding,
  Color? contentColor,
  Color? titleColor,
}) {
  return InkWell(
    onTap: onPressEvent,
    child: Stack(
      children: [
        Container(
          width: width,
          height: height,
          padding: padding,
          margin: const EdgeInsets.symmetric(vertical: 5),
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
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: title != null ? '$title\n' : null,
              style: TextStyle(
                color: titleColor ??
                    Theme.of(context).colorScheme.onBackground.withOpacity(.5),
                fontSize: 8,
                fontFamily: 'SpoqaHanSans',
                fontWeight: FontWeight.w400,
                height: 1.5,
              ),
              children: [
                TextSpan(
                  text: content != null
                      ? content.length > 20
                          ? '${content.substring(0, 20)}...'
                          : content
                      : '',
                  style: TextStyle(
                    color: contentColor ??
                        Theme.of(context).colorScheme.onBackground,
                    fontSize: 16,
                    fontFamily: 'SpoqaHanSans',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
        if (showEditButton)
          Positioned(
            top: 0,
            right: -10,
            bottom: 20,
            child: IconButton(
              onPressed: onPressEvent,
              iconSize: 20,
              icon: Icon(
                Icons.edit_square,
                size: 12,
                color: Theme.of(context)
                    .colorScheme
                    .onPrimaryContainer
                    .withOpacity(.6),
              ),
            ),
          ),
      ],
    ),
  );
}
