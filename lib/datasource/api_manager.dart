import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:los_app/datasource/dto/regist_res_dto.dart';
import 'package:los_app/datasource/dto/register_team_dto.dart';
import 'package:los_app/datasource/dto/simple_team_info_dto.dart';
import 'package:los_app/datasource/model/join_request_model.dart';

class ApiClient {
  late FirebaseFirestore _firestore;

  ApiClient() {
    _firestore = FirebaseFirestore.instance;
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getDoc(
      String col, String doc) async {
    try {
      return await _firestore.collection(col).doc(doc).get();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateDoc(String col, String doc, dynamic data) async {
    try {
      await _firestore.collection(col).doc(doc).update(data);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteDoc(String col, String doc) async {
    try {
      await _firestore.collection(col).doc(doc).delete();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteAlertDoc(String privateId, String alertId) async {
    try {
      await _firestore
          .collection('user')
          .doc(privateId)
          .collection('alert')
          .doc(alertId)
          .delete();
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>?> registerTeam(RegisterTeamDto teamInfo) async {
    try {
      final serverUrl = dotenv.env['BASEURL'];
      final parseUri = Uri.parse('$serverUrl/team/regist');

      final body = jsonEncode(teamInfo.toJson());
      final res = await http.post(
        parseUri,
        body: body,
        headers: {
          "content-type": "application/json",
        },
      );

      if (res.statusCode == 201) {
        if (res.body.isNotEmpty) {
          var registRes = RegistResDto.fromJson(jsonDecode(res.body));
          if (registRes.exception != null) {
            throw <String, dynamic>{
              "message": registRes.message,
              "exception": registRes.exception
            };
          }
          return registRes.team;
        }
        return null;
      }
      return null;
    } catch (e) {
      print('$e Client');
      rethrow;
    }
  }

  Future<DocumentReference> getDocRef(String col, String docN) async {
    return _firestore.collection(col).doc(docN);
  }

  Future<CollectionReference> getSubColRef(
      String mCol, String sCol, String doc) async {
    return _firestore.collection(mCol).doc(doc).collection(sCol);
  }

  Future<List<SimpleTeamInfoDto>> getTeamList() async {
    try {
      final serverUrl = dotenv.env['BASEURL'];
      final parseUri = Uri.parse('$serverUrl/team/list');
      final res = await http.get(parseUri);

      final List<SimpleTeamInfoDto> teams = [];
      if (res.statusCode == 200) {
        final jsons = jsonDecode(res.body);
        for (var json in jsons as List<dynamic>) {
          teams.add(SimpleTeamInfoDto.fromJson(json));
        }
      }
      return teams;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> subcribeTeam(
      String permission, JoinRequestModel body, String teamCode) async {
    try {
      final serverUrl = dotenv.env['BASEURL'];
      final parseUri = Uri.parse('$serverUrl/team/join/$teamCode');
      final res = await http.post(
        parseUri,
        body: jsonEncode(
          {
            "permission": permission,
            "body": body,
          },
        ),
        headers: {
          "content-type": "application/json",
        },
      );

      return jsonDecode(res.body);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> removeSubcribeTeam(
      String permission, JoinRequestModel body, String teamCode) async {
    try {
      final serverUrl = dotenv.env['BASEURL'];
      final parseUri = Uri.parse('$serverUrl/team/remove/$teamCode');
      final res = await http.delete(
        parseUri,
        body: jsonEncode(
          {
            "permission": permission,
            "body": body,
          },
        ),
        headers: {
          "content-type": "application/json",
        },
      );
      if (res.statusCode != 200) {
        throw res.statusCode;
      }
    } catch (e) {
      rethrow;
    }
  }
}
