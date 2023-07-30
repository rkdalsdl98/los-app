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
  Map<String, Stream<QuerySnapshot<Map<String, dynamic>>>?>? get streamList =>
      _userRepo.streamList;

  FirebaseAuth get authentication => _userRepo.authentication;

  UserProvider() {
    _userRepo = UserRepo(ApiClient());
    LocalMamanger.getStringData('user').then((value) {
      if (value != null) {
        final toJson = jsonDecode(value);
        _userRepo.linkUserDataFromJson(toJson);
        _userRepo.linkSubcribeTeam().then((_) {
          notifyListeners();
        });
        bindStreamDataByDoc('alert');
      }
    });
  }

  Future<String> setSubcribeTeam(String teamCode) async {
    try {
      return await _userRepo
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
          .then((res) {
        notifyListeners();
        return res;
      });
    } catch (e) {
      rethrow;
    }
  }

  void removeSubcribeTeam() {
    try {
      _userRepo
          .removeSubcribeTeam(
            JoinRequestModel.fromJson(_userRepo.subcribeTeamInfo!['info']),
            _userRepo.subcribeTeamInfo!['teamCode'],
          )
          .then((_) => notifyListeners());
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

  void bindStreamDataByDoc(String docN) {
    try {
      _userRepo.bindStreamDataByDoc(docN);
    } catch (e) {
      rethrow;
    }
  }

  void unBindStreamDataByDoc(String docN) {
    try {
      _userRepo.unBindStreamDataByDoc(docN);
    } catch (e) {
      rethrow;
    }
  }
}
