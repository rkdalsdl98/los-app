import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:los_app/provider/user_provider.dart';
import 'package:los_app/system/func.dart';
import 'package:los_app/system/message.dart';
import 'package:los_app/system/types.dart';
import 'package:los_app/widgets/global/circle_text_button.dart';
import 'package:los_app/widgets/global/circle_text_small.dart';
import 'package:los_app/widgets/global/user_profile_icon.dart';
import 'package:los_app/widgets/submit_button.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../widgets/global/default_user_profile_icon.dart';
import '../widgets/input_field.dart';

class RegisterTeam extends StatefulWidget {
  const RegisterTeam({super.key});

  @override
  State<RegisterTeam> createState() => _RegisterTeamState();
}

class _RegisterTeamState extends State<RegisterTeam>
    with SingleTickerProviderStateMixin {
  TextEditingController teamNameController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  XFile? selImageFile;

  late AnimationController lottieController;

  String helpText = '';
  bool showHelpText = false;

  @override
  void initState() {
    super.initState();
    lottieController = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    lottieController.dispose();
  }

  Future<void> uploadImage() async {
    final refImg = FirebaseStorage.instance
        .ref()
        .child('profile')
        .child(context.read<UserProvider>().user!.uid);
    await refImg.putFile(File(selImageFile!.path));

    final imgUrl = await refImg.getDownloadURL();
  }

  Future<void> registTeam() async {
    showHelpText = false;
    final String teamName = teamNameController.text;
    try {
      if (teamName.isNotEmpty &&
          (match(teamName, ValidateType.teamName) &&
              !match(teamName, ValidateType.specialChar))) {
      } else {
        helpText = '팀명은 특수문자를 제외한 2글자 이상 10글자 이내로 작성해주세요.';
        showHelpText = true;
      }
    } catch (e) {
      if (e.toString().contains('NullRegTypeException')) {
        print('존재 하지 않는 검증타입');
      } else {
        print(e);
      }
      snackBarMessage(
        context,
        '예기치 못한 오류가 발생했습니다.',
        const Icon(
          Icons.warning_rounded,
          color: Colors.red,
        ),
      );
    }
    setState(() {});
  }

  Future<void> resgisterSuccess(String teamName) async {
    return await showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          content: Center(
            child: SizedBox(
              height: 300,
              child: Stack(children: [
                Positioned(
                  child: Lottie.asset(
                    'lottie/congrats_anim.json',
                    fit: BoxFit.fitWidth,
                    controller: lottieController,
                    onLoaded: (composition) {
                      lottieController.duration = composition.duration;
                      lottieController.animateTo(.9);
                    },
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const DefaultUserProfileIcon(),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [CircleTextSmall(text: teamName)],
                    ),
                    const SizedBox(height: 5),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: '축하합니다!\n',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          fontSize: 12,
                          fontFamily: 'SpoqaHanSans',
                          fontWeight: FontWeight.w600,
                          height: 1.5,
                        ),
                        children: const [
                          TextSpan(text: '성공적으로 팀을 생성했습니다!\n'),
                          TextSpan(text: '눈부신 활약을 기대할게요!'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    CircleTextButton(
                      text: '확인',
                      onPressEvent: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ]),
            ),
          ),
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          backgroundColor: Colors.transparent,
        );
      },
    );
  }

  Future<void> getImageFile() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    selImageFile = image;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.topCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 400,
                height: 350,
                margin: const EdgeInsets.symmetric(vertical: 20),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/img/los_background_translate.png',
                    ),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(
                          Icons.close,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Stack(
                      children: [
                        UserProfileIcon(profileImage: selImageFile),
                        Positioned(
                          left: 65,
                          top: 65,
                          child: IconButton(
                            onPressed: () async {
                              await getImageFile();
                            },
                            iconSize: 20,
                            icon: const Icon(
                              Icons.image_rounded,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '팀 이미지를 등록 하지 않을 경우 기본이미지로 대체됩니다.',
                      style: TextStyle(
                        color: Theme.of(context)
                            .colorScheme
                            .onPrimaryContainer
                            .withOpacity(.2),
                        fontSize: 10,
                        fontFamily: 'SpoqaHanSans',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(flex: 2),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 20,
                      ),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: showHelpText
                                ? const Color(0xFFE94251)
                                : Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer
                                    .withOpacity(.5),
                          ),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '팀명',
                            style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                              fontSize: 8,
                              fontFamily: 'SpoqaHanSans',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          InputField(
                            controller: teamNameController,
                            hintText: null,
                            prefixIcon: null,
                            type: 'team-name',
                            validator: null,
                            maxLength: 10,
                            customDecoration: InputDecoration(
                              border: InputBorder.none,
                              errorBorder: InputBorder.none,
                              hintStyle: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onBackground
                                    .withOpacity(.2),
                                fontSize: 14,
                                fontFamily: 'SpoqaHanSans',
                                fontWeight: FontWeight.w600,
                              ),
                              hintText: '팀명을 입력해주세요.',
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (showHelpText)
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            helpText,
                            style: const TextStyle(
                              color: Color(0xFFE94251),
                              fontSize: 10,
                              fontFamily: 'SpoqaHanSans',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    const Spacer(flex: 2),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      fontSize: 10,
                      fontFamily: 'SpoqaHanSans',
                      fontWeight: FontWeight.w300,
                    ),
                    text:
                        '팀 생성시 최대 구성원은 20명 까지 가능하며, 추후에 팀의 등급이 올라가면서 제한이 풀리게 됩니다.\n\n',
                    children: const [
                      TextSpan(
                          text:
                              '팀을 사고파는 행위는 금지하고 있으며 적발시 해당 팀은 강제로 해체 조치가 되며 거래에 연관된 인원들에게는 적당한 조치가 취해집니다.')
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 100),
              SubmitButton(
                onTapEvent: registTeam,
                text: '팀 만들기',
                buttonColor: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
