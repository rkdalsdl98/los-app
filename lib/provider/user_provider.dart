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

  void linkUserData(DocumentSnapshot<Map<String, dynamic>>? snapshot) {
    _userRepo.linkUserData(snapshot);
  }

  void unLinkUserData() {
    _userRepo.unLinkUserData();
  }
}
