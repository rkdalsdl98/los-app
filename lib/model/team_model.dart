import 'package:cloud_firestore/cloud_firestore.dart';

class TeamModel {
  String? teamCode,
      name,
      tier,
      teamMark,
      writePostCode,
      linkedChattingCode,
      linkedPostCode,
      weeklyGameRecord;

  int? todayPlayedCount, todayMaxPlayedCount, point;
  double? kindness;
  DateTime? createdAt;
  //List<GameDetail>
  //enum LinkedGameState

  TeamModel.fromDoc(DocumentSnapshot<Map<String, dynamic>>? snapshot) {
    if (snapshot != null) {
      teamCode = snapshot['team-code'];
      name = snapshot['name'];
      tier = snapshot['tier'];
      teamMark = snapshot['team-mark-url'];
      writePostCode = snapshot['write-post-code'];
      linkedChattingCode = snapshot['linked-chatting-code'];
      linkedPostCode = snapshot['linked-post-code'];
      weeklyGameRecord = snapshot['weekly-game-record'];
      todayPlayedCount = snapshot['today-played-count'];
      todayMaxPlayedCount = snapshot['today-max-played-count'];
      point = snapshot['point'];
      kindness = snapshot['kindness'];
      createdAt = snapshot['created-at'];
    }
  }

  TeamModel.fromJson(Map<String, dynamic> json)
      : teamCode = json['team-code'],
        name = json['name'],
        tier = json['tier'],
        teamMark = json['team-mark-url'],
        writePostCode = json['write-post-code'],
        linkedChattingCode = json['linked-chatting-code'],
        linkedPostCode = json['linked-post-code'],
        weeklyGameRecord = json['weekly-game-record'],
        todayPlayedCount = json['today-played-count'],
        todayMaxPlayedCount = json['today-max-played-count'],
        point = json['point'],
        kindness = json['kindness'],
        createdAt = json['created-at'];
}
