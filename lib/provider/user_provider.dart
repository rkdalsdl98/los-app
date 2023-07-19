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
      _getUserDoc().then((value) => linkUserFromDoc(value, _userRepo.user));
    }
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> _getUserDoc() async {
    return await _userRepo.getUserDoc();
  }

  void linkUserFromDoc(
      DocumentSnapshot<Map<String, dynamic>>? snapshot, User? newUser) {
    _userRepo.linkUserDataFromDoc(snapshot);
    _userRepo.linkUser(newUser);
    notifyListeners();
  }

  void linkUserFromJson(Map<String, dynamic> json, User? newUser) {
    _userRepo.linkUserDataFromJson(json);
    _userRepo.linkUser(newUser);
    notifyListeners();
  }

  void unLinkUserData() {
    _userRepo.unLinkUserData();
    notifyListeners();
  }
}
