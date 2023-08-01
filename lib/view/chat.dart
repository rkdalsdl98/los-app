import 'package:flutter/material.dart';
import 'package:los_app/design/dimensions.dart';
import 'package:los_app/widgets/input_field.dart';

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          margin: const EdgeInsets.only(top: 30, bottom: 15),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/img/LOS.png'),
              fit: BoxFit.contain,
              opacity: .1,
            ),
          ),
          child: Column(
            children: [
              Container(
                width: 200 * getScaleFactorFromWidth(context),
                padding: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  color: Theme.of(context)
                      .colorScheme
                      .onPrimaryContainer
                      .withOpacity(.3),
                  borderRadius: const BorderRadius.all(Radius.circular(45)),
                ),
                child: Center(
                  child: Text(
                    '연결된 상대가 없습니다.',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.background,
                      fontSize: 8,
                      fontFamily: 'SpoqaHanSans',
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const Expanded(
                child: SingleChildScrollView(
                  reverse: false,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      children: [],
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                width: double.maxFinite,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.background,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(100),
                        ),
                      ),
                      child: Icon(
                        Icons.image,
                        size: 16 * getScaleFactorFromWidth(context),
                      ),
                    ),
                    Container(
                      width: 290 * getScaleFactorFromWidth(context),
                      height: 50,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.background,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: InputField(
                        controller: controller,
                        hintText: '채팅을 입력하세요',
                        prefixIcon: null,
                        type: 'chat',
                        validator: null,
                        padding: const EdgeInsets.all(0),
                        alignVertical: TextAlignVertical.bottom,
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.tag_faces_rounded,
                            size: 18,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          onPressed: () {
                            print('아잇!');
                          },
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.background,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(100),
                        ),
                      ),
                      child: Icon(
                        Icons.send,
                        size: 16 * getScaleFactorFromWidth(context),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget leftChatBubbleHelper(
  BuildContext context,
  String text,
  String teamName,
  String teamMark,
) {
  return Container(
    margin: const EdgeInsets.only(top: 5, bottom: 5),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              teamMark,
              width: 30,
              height: 30,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 2),
            Text(
              teamName,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                fontSize: 10,
                fontFamily: 'SpoqaHanSans',
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
        Container(
          margin: const EdgeInsets.only(left: 10),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15),
              )),
          child: Text(
            text,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
              fontSize: 10,
              fontFamily: 'SpoqaHanSans',
              fontWeight: FontWeight.w400,
            ),
          ),
        )
      ],
    ),
  );
}

Widget rightChatBubbleHelper(
  BuildContext context,
  String text,
  String teamName,
  String teamMark,
) {
  return Container(
    margin: const EdgeInsets.only(top: 5, bottom: 5),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                teamMark,
                width: 30,
                height: 30,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 2),
              Text(
                teamName,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  fontSize: 10,
                  fontFamily: 'SpoqaHanSans',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: 10),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              )),
          child: Text(
            text,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
              fontSize: 10,
              fontFamily: 'SpoqaHanSans',
              fontWeight: FontWeight.w400,
            ),
          ),
        )
      ],
    ),
  );
}
