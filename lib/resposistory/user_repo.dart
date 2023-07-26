import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:los_app/datasource/api_manager.dart';
import 'package:los_app/datasource/local_manager.dart';
import 'package:los_app/model/user_data_model.dart';

class UserRepo {
  late User? _user;
  late ApiClient _apiClient;

  final FirebaseAuth _authentication = FirebaseAuth.instance;
  FirebaseAuth get authentication => _authentication;

  UserDataModel? _userData;
  UserDataModel? get userData => _userData;

  User? get user => _user;

  UserRepo(ApiClient client) {
    _apiClient = client;
    _user = _authentication.currentUser;
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
      LocalMamanger.removeData('user');
    } catch (e) {
      rethrow;
    }
  }

  void linkUser(User? newUser) {
    _user = newUser;
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDoc(String col) async {
    return await _apiClient.getDoc(col, _user!.uid);
  }
}
