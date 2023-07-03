import 'package:flutter/material.dart';
import 'package:los_app/view/login.dart';
import 'package:los_app/view/sign.dart';

class MainLoginView extends StatefulWidget {
  const MainLoginView({super.key});

  @override
  State<MainLoginView> createState() => _MainLoginViewState();
}

class _MainLoginViewState extends State<MainLoginView> {
  int currIndex = 0;

  void onChangeView(int index) {
    setState(() {
      currIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      alignment: Alignment.center,
      index: currIndex,
      children: [
        Login(
          onChangeView: onChangeView,
        ),
        Sign(
          onChangeView: onChangeView,
        ),
      ],
    );
  }
}
