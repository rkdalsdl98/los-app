import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:los_app/system/auth.dart';
import 'package:los_app/system/types.dart';

import '../system/func.dart';
import '../system/message.dart';
import '../widgets/helper_text.dart';
import '../widgets/input_field.dart';
import '../widgets/sign_button.dart';
import '../widgets/submit_button.dart';

class Login extends StatefulWidget {
  final Function(int) onChangeView;

  const Login({
    super.key,
    required this.onChangeView,
  });

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController inputIdController = TextEditingController();
  final TextEditingController inputPassController = TextEditingController();
  Map<String, dynamic> result = {};

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  void addData(String type, dynamic data) {
    result.update(
      type,
      (_) => data,
      ifAbsent: () => data,
    );
  }

  Future<void> onSubmit(BuildContext context) async {
    setState(() {
      autovalidateMode = AutovalidateMode.always;
    });

    final form = formKey.currentState;
    if (form == null || !form.validate()) return;
    form.save();

    try {
      await losSignIn(context, result);
    } catch (e) {
      if (e.toString().contains('not-found')) {
        snackBarMessage(
          context,
          "존재 하지 않는 아이디 입니다",
          const Icon(
            Icons.warning_rounded,
            color: Colors.red,
          ),
        );
      } else if (e.toString().contains('wrong-password')) {
        snackBarMessage(
          context,
          "비밀번호가 일치하지 않습니다",
          const Icon(
            Icons.warning_rounded,
            color: Colors.red,
          ),
        );
      } else {
        snackBarErrorMessage(context, "예기치 못한 오류가 발생했습니다.", e.toString());
      }
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        body: Container(
          width: double.maxFinite,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/img/los_background_translate.png'),
              fit: BoxFit.contain,
            ),
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints.tight(const Size.fromWidth(600)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      autovalidateMode: autovalidateMode,
                      child: Column(
                        children: [
                          InputField(
                            validator: (value) {
                              try {
                                if (value == null ||
                                    !match(value, ValidateType.id)) {
                                  return '이메일 형식에 맞춰 작성해주세요';
                                }
                                return null;
                              } catch (e) {
                                if (e.toString() == 'RegTypeException') {
                                  snackBarErrorMessage(context,
                                      "예기치 못한 오류가 발생했습니다.", e.toString());
                                }
                                return null;
                              }
                            },
                            addData: addData,
                            type: 'userId',
                            controller: inputIdController,
                            hintText: '아이디를 입력해주세요.',
                            prefixIcon: Icons.person_2_rounded,
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          InputField(
                            validator: (value) {
                              if (value == null ||
                                  value.length < 8 ||
                                  value.length > 20) {
                                return '비밀번호는 1글자 이상 20글자 이내로 작성해주세요';
                              }
                              return null;
                            },
                            obscureText: true,
                            addData: addData,
                            type: 'userPass',
                            controller: inputPassController,
                            hintText: '비밀번호를 입력해주세요.',
                            prefixIcon: Icons.lock_rounded,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  HelperText(
                    firstText: '혹시 비밀번호를 잃어 버리셨나요?',
                    secondText: '를 눌러 비밀번호를 찾아보세요.',
                    eventText: ' 여기',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => print('Tap Event'),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SubmitButton(
                    onTapEvent: () => onSubmit(context),
                    text: '로그인',
                    buttonColor: Theme.of(context).colorScheme.secondary,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SignButton(
                    onTapEvent: () => widget.onChangeView(1),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
