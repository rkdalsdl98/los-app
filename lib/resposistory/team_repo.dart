import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:los_app/datasource/api_manager.dart';
import 'package:los_app/model/user_data_model.dart';

import '../datasource/dto/register_team_dto.dart';
import '../datasource/dto/requester_dto.dart';
import '../datasource/dto/team_dto.dart';

class TeamRepo {
  late ApiClient _apiClient;

  TeamDto? _team;
  TeamDto? get team => _team;

  TeamRepo(ApiClient client) {
    _apiClient = client;
  }

  Future<Map<String, dynamic>?> registerTeam(String teamName,
      String? teamMarkUrl, UserDataModel? userData, User? user) async {
    try {
      final RegisterTeamDto team = RegisterTeamDto({
        "requester": RequesterDto({
          "email": userData?.email,
          "phoneNumber": userData?.phoneNumber,
          "profileImageUrl": userData?.profileImage,
          "privateId": user?.uid,
          "nickname": userData?.nickname,
        }),
        "teamName": teamName,
        "teamMarkUrl": teamMarkUrl ?? "",
      });
      return await _apiClient.registerTeam(team);
    } catch (e) {
      print('$e Repo');
      rethrow;
    }
  }

  void linkTeamFromJsonData(Map<String, dynamic>? json, String privateId) {
    try {
      _team = TeamDto.fromJson(json);
      linkTeamCode(privateId, _team!.teamCode!);
    } catch (e) {
      rethrow;
    }
  }

  void onlyLinkTeamFromJsonData(Map<String, dynamic>? json) {
    try {
      _team = TeamDto.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }

  void linkTeamDataFromDoc(DocumentSnapshot<Map<String, dynamic>>? snapshot) {
    try {
      _team = TeamDto.fromDoc(snapshot);
    } catch (e) {
      rethrow;
    }
  }

  void unLinkTeamData() {
    _team = null;
  }

  Future<void> linkTeamCode(String privateId, String temaCode) async {
    await _apiClient.updateDoc('user', privateId, {"teamCode": temaCode});
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getTeamDoc(
      String col, String teamCode) async {
    return await _apiClient.getDoc(col, teamCode);
  }

  Future<DocumentReference<Object?>> getDocRef(String col, String docN) async {
    return _apiClient.getDocRef(col, docN);
  }
}
