import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:los_app/datasource/api_manager.dart';
import 'package:los_app/datasource/dto/simple_team_info_dto.dart';
import 'package:los_app/datasource/local_manager.dart';
import 'package:los_app/datasource/model/alert_model.dart';
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
  List<AlertModel>? get alerts => _userRepo.alerts;

  FirebaseAuth get authentication => _userRepo.authentication;

  CollectionReference? _alertColRef;
  StreamSubscription<QuerySnapshot<Object?>>? _streamSub;

  UserProvider() {
    _userRepo = UserRepo(ApiClient());
    LocalMamanger.getStringData('user').then((value) {
      if (value != null) {
        final toJson = jsonDecode(value);
        _userRepo.linkUserDataFromJson(toJson);
        _userRepo.linkSubcribeTeam().then((_) {
          bindAlertData().then((_) => notifyListeners());
        });
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
      unBindAlertData();
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

  Future<void> bindAlertData() async {
    try {
      _alertColRef = await _userRepo.getSubColRef();
      if (_alertColRef != null) {
        _streamSub = _alertColRef!.snapshots().listen((event) {
          var newAlerts = event.docs;
          _userRepo.linkAlerts(newAlerts);
          notifyListeners();
        });
      }
    } catch (e) {
      rethrow;
    }
  }

  void unBindAlertData() {
    try {
      _streamSub?.cancel().then((_) {
        _alertColRef = null;
        _streamSub = null;
        _userRepo.unLinkAlerts();
        notifyListeners();
      });
    } catch (e) {
      rethrow;
    }
  }

  void deleteAlertDoc(String alertId) {
    try {
      _userRepo.deleteAlertDoc(alertId);
    } catch (e) {
      rethrow;
    }
  }
}
