import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:los_app/datasource/api_manager.dart';
import 'package:los_app/model/user_data_model.dart';
import 'package:los_app/resposistory/team_repo.dart';

import '../datasource/dto/team_dto.dart';

class TeamProvider with ChangeNotifier {
  late TeamRepo _teamRepo;

  TeamDto? get team => _teamRepo.team;
  DocumentReference? _teamDocRef;
  StreamSubscription<DocumentSnapshot<Object?>>? _streamSub;

  TeamProvider() {
    _teamRepo = TeamRepo(ApiClient());
  }

  Future<void> registerTeam(String teamName, String? teamMarkUrl,
      UserDataModel? userData, User? user) async {
    try {
      final team = await _teamRepo.registerTeam(
        teamName,
        teamMarkUrl,
        userData,
        user,
      );
      print(team);
      if (team == null) throw "NullTeamData";
      _teamRepo.linkTeamFromJsonData(team, user!.uid);
      notifyListeners();
    } catch (e) {
      print('$e Provider');
      rethrow;
    }
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getTeamDoc(
      String teamCode) async {
    return await _teamRepo.getTeamDoc('team', teamCode);
  }

  void linkTeamDataFromDoc(DocumentSnapshot<Map<String, dynamic>>? snapshot) {
    try {
      _teamRepo.linkTeamDataFromDoc(snapshot);
      bindTeamData();
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  void unLinkTeamData() {
    try {
      _teamRepo.unLinkTeamData();
      _streamSub?.cancel().then((_) {
        _teamDocRef = null;
        _streamSub = null;
      });
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> bindTeamData() async {
    try {
      _teamDocRef = await _teamRepo.getDocRef('team', team!.teamCode!);
      if (_teamDocRef != null) {
        _streamSub = _teamDocRef!.snapshots().listen((document) {
          var teamData = document.data();
          _teamRepo.onlyLinkTeamFromJsonData(teamData as Map<String, dynamic>);
          notifyListeners();
        });
      }
    } catch (e) {
      rethrow;
    }
  }
}
