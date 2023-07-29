import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:los_app/datasource/api_manager.dart';
import 'package:los_app/datasource/dto/simple_team_info_dto.dart';
import 'package:los_app/datasource/local_manager.dart';
import 'package:los_app/datasource/model/join_request_model.dart';
import 'package:los_app/resposistory/user_repo.dart';

import '../model/user_data_model.dart';

class UserProvider with ChangeNotifier {
  late UserRepo _userRepo;

  User? get user => _userRepo.user;
  UserDataModel? get userData => _userRepo.userData;
  List<SimpleTeamInfoDto>? get teamList => _userRepo.teamList;
  Map<String, dynamic>? get subcribeTeamInfo => _userRepo.subcribeTeamInfo;

  FirebaseAuth get authentication => _userRepo.authentication;

  UserProvider() {
    _userRepo = UserRepo(ApiClient());
    LocalMamanger.getStringData('user').then((value) {
      if (value != null) {
        final toJson = jsonDecode(value);
        _userRepo.linkUserDataFromJson(toJson);
      }
      notifyListeners();
    });
    _userRepo.linkSubcribeTeam().then((_) => notifyListeners());
  }

  void setSubcribeTeam(String teamCode) {
    try {
      _userRepo
          .setSubcribeTeam(
              JoinRequestModel.fromJson({
                "privateId": user!.uid,
                "nickName": userData!.nickname,
                "age": userData!.age,
                "height": userData!.height,
                "weight": userData!.weight,
                "profileImageUrl": userData!.profileImage,
                "detailInfo": null,
              }),
              teamCode)
          .then((value) => notifyListeners());
    } catch (e) {
      rethrow;
    }
  }

  void removeSubcribeTeam() {
    try {
      _userRepo.removeSubcribeTeam().then((_) => notifyListeners());
    } catch (e) {
      rethrow;
    }
  }

  void linkUserFromDoc(
      DocumentSnapshot<Map<String, dynamic>>? snapshot, User? newUser) {
    try {
      _userRepo.linkUserDataFromDoc(snapshot);
      _userRepo.linkUser(newUser);
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  void linkUserFromJson(Map<String, dynamic> json, User? newUser) {
    try {
      _userRepo.linkUserDataFromJson(json);
      _userRepo.linkUser(newUser);
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  void unLinkUserData() {
    try {
      _userRepo.unLinkUserData();
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  void refreshTeamList() {
    try {
      _userRepo.refreshTeamList().then((_) => notifyListeners());
    } catch (e) {
      rethrow;
    }
  }
}
