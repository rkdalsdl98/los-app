import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:los_app/datasource/api_manager.dart';
import 'package:los_app/datasource/local_manager.dart';
import 'package:los_app/model/team_model.dart';
import 'package:los_app/datasource/model/alert_model.dart';
import 'package:los_app/model/user_data_model.dart';

import '../datasource/dto/simple_team_info_dto.dart';
import '../datasource/model/join_request_model.dart';

class UserRepo {
  late User? _user;
  late ApiClient _apiClient;

  final FirebaseAuth _authentication = FirebaseAuth.instance;
  FirebaseAuth get authentication => _authentication;

  UserDataModel? _userData;
  UserDataModel? get userData => _userData;

  User? get user => _user;
  List<SimpleTeamInfoDto>? _teamList;
  List<SimpleTeamInfoDto>? get teamList => _teamList;

  Map<String, dynamic>? _subcribeTeamInfo;
  Map<String, dynamic>? get subcribeTeamInfo => _subcribeTeamInfo;

  Map<String, Stream<QuerySnapshot<Map<String, dynamic>>>?>? _streamList;
  Map<String, Stream<QuerySnapshot<Map<String, dynamic>>>?>? get streamList =>
      _streamList;

  List<AlertModel>? _alerts;
  List<AlertModel>? get alerts => _alerts;

  TeamModel? _team;
  TeamModel? get team => _team;

  UserRepo(ApiClient client) {
    _apiClient = client;
    _user = _authentication.currentUser;
    refreshTeamList();
    _streamList = {};
    _alerts = [];
  }

  void linkAlerts(List<QueryDocumentSnapshot<Object?>>? newAlerts) {
    var toAlertModels = newAlerts!
        .map((e) => AlertModel.fromJson(e.data() as Map<String, dynamic>));
    _alerts = toAlertModels.toList();
  }

  void unLinkAlerts() {
    _alerts = null;
  }

  void linkUserDataFromDoc(DocumentSnapshot<Map<String, dynamic>>? snapshot) {
    try {
      _userData = UserDataModel.fromDoc(snapshot);
      LocalMamanger.saveStringData('user', jsonEncode(_userData!.toJson()));
    } catch (e) {
      rethrow;
    }
  }

  void linkUserDataFromJson(Map<String, dynamic> json) {
    try {
      _userData = UserDataModel.fromJson(json);
      LocalMamanger.saveStringData('user', jsonEncode(_userData!.toJson()));
    } catch (e) {
      rethrow;
    }
  }

  void unLinkUserData() {
    try {
      _userData = null;
      _user = null;
      _streamList = null;
      _subcribeTeamInfo = null;
      LocalMamanger.removeData('user');
    } catch (e) {
      rethrow;
    }
  }

  void linkUser(User? newUser) {
    _user = newUser;
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDoc(String col) async {
    try {
      return await _apiClient.getDoc(col, _user!.uid);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<SimpleTeamInfoDto>> refreshTeamList() async {
    try {
      return await _apiClient.getTeamList().then((value) => _teamList = value);
    } catch (e) {
      rethrow;
    }
  }

  Future<String> setSubcribeTeam(JoinRequestModel req, String teamCode) async {
    try {
      final res =
          await _apiClient.subcribeTeam(userData!.permission!, req, teamCode);
      if (res['result']) {
        var saveData = {"info": req.toJson(), "teamCode": teamCode};
        LocalMamanger.saveStringData('subcribe-team', jsonEncode(saveData))
            .then((_) => _subcribeTeamInfo = saveData);
      }
      return res['message'];
    } catch (e) {
      rethrow;
    }
  }

  Future<void> removeSubcribeTeam(JoinRequestModel req, String teamCode) async {
    try {
      await _apiClient
          .removeSubcribeTeam(userData!.permission!, req, teamCode)
          .then((_) => LocalMamanger.removeData('subcribe-team')
              .then((_) => _subcribeTeamInfo = null));
    } catch (e) {
      rethrow;
    }
  }

  Future<void> linkSubcribeTeam() async {
    await LocalMamanger.getStringData('subcribe-team').then((value) {
      if (value == null) return;
      final json = jsonDecode(value);
      _subcribeTeamInfo = {
        "info": json['info'],
        "teamCode": json['teamCode'],
      };
    });
  }

  Future<void> deleteAlertDoc(String alertId) async {
    try {
      await _apiClient.deleteAlertDoc(user!.uid, alertId);
    } catch (e) {
      rethrow;
    }
  }

  Future<CollectionReference> getSubColRef() async {
    try {
      return await _apiClient.getSubColRef('user', 'alert', user!.uid);
    } catch (e) {
      rethrow;
    }
  }

  void linkTeam(DocumentSnapshot<Map<String, dynamic>>? snapshot) {
    _team = TeamModel.fromDoc(snapshot);
  }

  void unLinkTeam() {
    _team = null;
  }
}
