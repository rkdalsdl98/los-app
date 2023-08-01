import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:los_app/provider/team_provider.dart';
import 'package:provider/provider.dart';

import '../provider/user_provider.dart';
import 'loading.dart';

void losSignOut(BuildContext context) {
  final userProvider = context.read<UserProvider>();
  final teamProvider = context.read<TeamProvider>();

  Navigator.pop(context);
  userProvider.unLinkUserData();
  teamProvider.unLinkTeamData();
  userProvider.authentication.signOut();
  Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
}

Future<void> losSignIn(BuildContext context, Map<String, dynamic> data) async {
  try {
    showLoadingIndicator(context);

    final userProvider = context.read<UserProvider>();
    await userProvider.authentication
        .signInWithEmailAndPassword(
      email: data['userId'],
      password: data['userPass'],
    )
        .then((_) async {
      final user = FirebaseAuth.instance.currentUser;
      await FirebaseFirestore.instance
          .collection('user')
          .doc(user!.uid)
          .get()
          .then((value) {
        userProvider.linkUserFromDoc(value, user);
        Navigator.pop(context);
        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
      });
    });
  } catch (e) {
    rethrow;
  }
}

Future<void> losSignUp(BuildContext context, Map<String, dynamic> data) async {
  try {
    showLoadingIndicator(context);

    final userProvider = context.read<UserProvider>();
    final userCredential =
        await userProvider.authentication.createUserWithEmailAndPassword(
      email: data['userId'],
      password: data['userPass'],
    );
    if (userCredential.user != null) {
      await FirebaseFirestore.instance
          .collection('user')
          .doc(userCredential.user!.uid)
          .set(
        {
          'email': data['userId'],
          'phoneNumber': data['phoneNumber'],
          'profileImage': '',
          'teamCode': '',
          'address': data['address'],
          'age': data['age'],
          'height': data['height'],
          'weight': data['weight'],
          'favoriteSports': data['favoriteSports'],
          'name': data['name'],
          'nickname': data['nickname'],
          'createdAt':
              '${(DateTime.timestamp().millisecondsSinceEpoch / 1000).floor()}',
          'permission': 'default',
        },
      ).then((_) {
        userProvider.linkUserFromJson(data, userCredential.user);
        Navigator.pop(context);
        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
      });
    } else {
      Navigator.pop(context);
    }
  } catch (e) {
    rethrow;
  }
}
