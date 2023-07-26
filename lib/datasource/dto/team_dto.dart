import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:los_app/datasource/model/game_detail_model.dart';
import 'package:los_app/datasource/model/join_request_model.dart';
import 'package:los_app/datasource/model/member_model.dart';

class TeamDto {
  String? teamCode,
      teamName,
      tier,
      teamMarkUrl,
      writePostCode,
      linkedChattingCode,
      linkedPostCode,
      linkedGameState,
      gameRecords,
      kindness;

  int? point, todayPlayedCount, todayMaxPlayedCount, createdAt;
  List<JoinRequestModel>? joinRequests;
  List<GameDetailModel>? gameDetails;
  List<MemberModel>? members;

  TeamDto.fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      teamCode = json['teamCode'];
      teamName = json['teamName'];
      tier = json['tier'];
      point = json['point'];
      todayPlayedCount = json['todayPlayedCount'];
      todayMaxPlayedCount = json['todayMaxPlayedCount'];
      kindness = json['kindness'];
      teamMarkUrl = json['teamMarkUrl'];
      createdAt = int.parse(json['createdAt']);
      writePostCode = json['writePostCode'];
      linkedChattingCode = json['linkedChattingCode'];
      linkedPostCode = json['linkedPostCode'];
      linkedGameState = json['linkedGameState'];
      gameRecords = json['gameRecords'];

      if (json['gameDetails'] != null) {
        gameDetails = [];
        json['gameDetails'].forEach((v) {
          gameDetails!.add(GameDetailModel.fromJson(v));
        });
      }

      if (json['members'] != null) {
        members = [];
        json['members'].forEach((v) {
          members!.add(MemberModel.fromJson(v));
        });
      }

      if (json['joinRequests'] != null) {
        joinRequests = [];
        json['joinRequests'].forEach((v) {
          joinRequests!.add(JoinRequestModel.fromJson(v));
        });
      }
    } else {
      throw '유효하지 않은 객체';
    }
  }

  TeamDto.fromDoc(DocumentSnapshot<Map<String, dynamic>>? snapshot) {
    if (snapshot != null) {
      teamCode = snapshot['teamCode'];
      teamName = snapshot['teamName'];
      tier = snapshot['tier'];
      point = snapshot['point'];
      todayPlayedCount = snapshot['todayPlayedCount'];
      todayMaxPlayedCount = snapshot['todayMaxPlayedCount'];
      kindness = snapshot['kindness'];
      teamMarkUrl = snapshot['teamMarkUrl'];
      createdAt = int.parse(snapshot['createdAt']);
      writePostCode = snapshot['writePostCode'];
      linkedChattingCode = snapshot['linkedChattingCode'];
      linkedPostCode = snapshot['linkedPostCode'];
      linkedGameState = snapshot['linkedGameState'];
      gameRecords = snapshot['gameRecords'];

      if (snapshot['gameDetails'] != null) {
        gameDetails = [];
        snapshot['gameDetails'].forEach((v) {
          gameDetails!.add(GameDetailModel.fromJson(v));
        });
      }

      if (snapshot['members'] != null) {
        members = [];
        snapshot['members'].forEach((v) {
          members!.add(MemberModel.fromJson(v));
        });
      }

      if (snapshot['joinRequests'] != null) {
        joinRequests = [];
        snapshot['joinRequests'].forEach((v) {
          joinRequests!.add(JoinRequestModel.fromJson(v));
        });
      }
    } else {
      throw '유효하지 않은 객체';
    }
  }
}
