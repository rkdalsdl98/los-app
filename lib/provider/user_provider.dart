import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:los_app/resposistory/user_repo.dart';

import '../model/user_data_model.dart';

class UserProvider with ChangeNotifier {
  final UserRepo _userRepo = UserRepo();

  User? get user => _userRepo.user;
  UserDataModel? get userData => _userRepo.userData;

  FirebaseAuth get authentication => _userRepo.authentication;

  UserProvider() {
    if (_userRepo.user != null) {
      _getUserDoc().then((value) => linkUserFromDoc(value));
    }
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> _getUserDoc() async {
    return await FirebaseFirestore.instance
        .collection('user')
        .doc(user!.uid)
        .get();
  }

  void linkUserFromDoc(DocumentSnapshot<Map<String, dynamic>>? snapshot) {
    _userRepo.linkUserDataFromDoc(snapshot);
    notifyListeners();
  }

  void linkUserFromJson(Map<String, dynamic> json) {
    _userRepo.linkUserDataFromJson(json);
    notifyListeners();
  }

  void unLinkUserData() {
    _userRepo.unLinkUserData();
    notifyListeners();
  }
}
