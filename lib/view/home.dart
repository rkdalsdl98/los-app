import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:los_app/provider/user_provider.dart';
import 'package:provider/provider.dart';

import '../system/message.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<void> initialize(UserProvider userProvider) async {
    await FirebaseFirestore.instance
        .collection('user')
        .doc(userProvider.user!.uid)
        .get()
        .then((value) => userProvider.linkUserData(value));
  }

  @override
  void initState() {
    super.initState();
    final userProvider = context.read<UserProvider>();
    if (userProvider.user != null) {
      try {
        initialize(userProvider);
      } catch (e) {
        snackBarErrorMessage(context, "유저 정보를 불러오는데 실패했습니다", e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/los_background_image.png'),
            fit: BoxFit.contain,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  var userProvider = context.read<UserProvider>();
                  userProvider.unLinkUserData();
                  userProvider.authentication.signOut();
                },
                child: const Text('sign out'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
