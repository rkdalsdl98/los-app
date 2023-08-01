import 'package:flutter/material.dart';
import 'package:los_app/datasource/local_manager.dart';
import 'package:los_app/system/auth.dart';
import 'package:los_app/system/message.dart';
import 'package:los_app/system/types.dart';
import 'package:los_app/widgets/input_field.dart';

import '../system/func.dart';
import '../widgets/submit_button.dart';

class Sign extends StatefulWidget {
  final Function(int) onChangeView;

  const Sign({
    super.key,
    required this.onChangeView,
  });

  @override
  State<Sign> createState() => _SignState();
}

class _SignState extends State<Sign> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController inputIdController = TextEditingController();
  final TextEditingController inputPassController = TextEditingController();
  final TextEditingController inputPass2Controller = TextEditingController();
  final TextEditingController inputPhoneNumController = TextEditingController();
  final TextEditingController inputAddressController = TextEditingController();
  final TextEditingController inputAgeController = TextEditingController();
  final TextEditingController inputHeightController = TextEditingController();
  final TextEditingController inputWeightController = TextEditingController();
  final TextEditingController inputFavoriteSportsController =
      TextEditingController();
  final TextEditingController inputNameController = TextEditingController();
  final TextEditingController inputNickNameController = TextEditingController();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  Map<String, dynamic> result = {};
  bool isAccept = false;

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

    try {
      if (!isAccept) throw 'AcceptException';
      form.save();
      await losSignUp(context, result);
    } catch (e) {
      if (e.toString() == 'AcceptException') {
        Navigator.pop(context);
        snackBarMessage(
          context,
          "약관에 동의 하지 않을 경우 회원가입 진행이 불가합니다",
          const Icon(
            Icons.warning_rounded,
            color: Colors.red,
          ),
        );
      } else {
        Navigator.pop(context);
        snackBarErrorMessage(context, "예기치 못한 오류가 발생했습니다.", e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/img/los_background_translate.png'),
              fit: BoxFit.contain,
            ),
          ),
          child: Center(
            child: SizedBox(
              width: 600,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () => widget.onChangeView(0),
                      icon: const Icon(
                        Icons.close,
                      ),
                    ),
                    Form(
                      autovalidateMode: autovalidateMode,
                      key: formKey,
                      child: Column(
                        children: [
                          InputField(
                            addData: addData,
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
                            type: 'userId',
                            controller: inputIdController,
                            hintText: '아이디를 이메일 형식으로 입력해주세요.',
                            prefixIcon: Icons.person_2_rounded,
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          InputField(
                            addData: addData,
                            validator: (value) {
                              if (value == null ||
                                  value.length < 8 ||
                                  value.length > 20) {
                                return '비밀번호는 1글자 이상 20글자 이내로 작성해주세요';
                              }
                              return null;
                            },
                            obscureText: true,
                            type: 'userPass',
                            controller: inputPassController,
                            hintText: '비밀번호를 입력해주세요.',
                            prefixIcon: Icons.lock_rounded,
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          InputField(
                            addData: addData,
                            validator: (value) {
                              try {
                                if (value == null ||
                                    !match(value, ValidateType.phoneNumber)) {
                                  return '전화번호 형식에 맞춰 입력해주세요.';
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
                            suffixText: '(ex: 010-1234-5678)',
                            type: 'phoneNumber',
                            controller: inputPhoneNumController,
                            hintText: '전화번호를 입력해주세요.',
                            prefixIcon: Icons.phone,
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          InputField(
                            addData: addData,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '주소를 입력해주세요';
                              }
                              return null;
                            },
                            type: 'address',
                            controller: inputAddressController,
                            hintText: '도로명 주소를 입력해주세요.',
                            prefixIcon: Icons.location_on_sharp,
                            suffixText: '(ex: 서울특별시 마포구 월드컵로5길 11)',
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          InputField(
                            addData: addData,
                            textInputType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '나이를 입력해주세요';
                              } else if (value.trim().length > 2 ||
                                  int.parse(value) < 1) {
                                return '나이는 1세 부터 99세까지 입력 할 수 있습니다.';
                              }
                              return null;
                            },
                            type: 'age',
                            controller: inputAgeController,
                            hintText: '나이를 입력해주세요.',
                            prefixIcon: null,
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          InputField(
                            addData: addData,
                            textInputType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '키를 입력해주세요';
                              } else if (value.trim().length > 3 ||
                                  int.parse(value) > 300) {
                                return '정확한 키를 입력해주세요';
                              }
                              return null;
                            },
                            type: 'height',
                            controller: inputHeightController,
                            hintText: '키를 입력해주세요.',
                            prefixIcon: null,
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          InputField(
                            addData: addData,
                            textInputType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '몸무게를 입력해주세요';
                              } else if (value.trim().length > 3 ||
                                  int.parse(value) > 300) {
                                return '정확한 몸무게를 입력해주세요';
                              }
                              return null;
                            },
                            type: 'weight',
                            controller: inputWeightController,
                            hintText: '몸무게를 입력해주세요.',
                            prefixIcon: null,
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          InputField(
                            addData: addData,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '자신이 가장 좋아하는 운동종목을 입력해주세요';
                              } else if (value.trim().length > 10) {
                                return '운동종목은 10자 이내로 작성해주세요';
                              }
                              return null;
                            },
                            type: 'favoriteSports',
                            controller: inputFavoriteSportsController,
                            hintText: '자신이 가장좋아하는 운동종목을 입력해주세요.',
                            prefixIcon: null,
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          InputField(
                            addData: addData,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '이름을 입력해주세요';
                              }
                              return null;
                            },
                            type: 'name',
                            controller: inputNameController,
                            hintText: '이름을 입력해주세요.',
                            prefixIcon: null,
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          InputField(
                            addData: addData,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '닉네임를 입력해주세요';
                              } else if (value.trim().length > 10) {
                                return '닉네임은 10글자 이내로 작성해주세요';
                              }
                              return null;
                            },
                            type: 'nickname',
                            controller: inputNickNameController,
                            hintText: '닉네임을 입력해주세요.',
                            prefixIcon: null,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        agreementCollectedPersonalInformationText,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondaryContainer,
                          fontSize: 10,
                          fontFamily: 'SpoqaHanSans',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                          value: isAccept,
                          onChanged: (value) => setState(
                            () {
                              isAccept = value!;
                            },
                          ),
                        ),
                        Text(
                          '상기 내용을 모두 확인, 숙지 했으며 이에 모두 동의 합니다.',
                          style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer,
                            fontSize: 12,
                            fontFamily: 'SpoqaHanSans',
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SubmitButton(
                      onTapEvent: () => onSubmit(context),
                      text: '회원가입',
                      buttonColor: Theme.of(context).colorScheme.secondary,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
