import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:los_app/model/notify_model.dart';
import 'package:los_app/model/team_model.dart';
import 'package:los_app/resposistory/user_repo.dart';
import 'package:socket_io_client/socket_io_client.dart';

import '../model/user_data_model.dart';

class UserProvider with ChangeNotifier {
  final UserRepo _userRepo = UserRepo();

  User? get user => _userRepo.user;
  UserDataModel? get userData => _userRepo.userData;
  TeamModel? get team => _userRepo.team;

  Socket? _chattingClient;
  Socket? get chattingClient => _chattingClient;

  FirebaseAuth get authentication => _userRepo.authentication;

  List<String> messages = [];

  void joinChattingRomm() {
    try {
      _chattingClient = io(
          'http://localhost/chat',
          OptionBuilder()
              .setTransports(['websocket'])
              .disableAutoConnect()
              .build());
      if (!_chattingClient!.connected) {
        _chattingClient!.connect();
      }
    } catch (e) {
      rethrow;
    }

    _chattingClient!.on('connect', (_) {
      print('connect');
      _chattingClient!.emit('join-room', team!.linkedChattindCode);
    });
    _chattingClient!.on('notify', (data) {
      try {
        NotifyModel notify = NotifyModel.fromJson(data);
      } catch (e) {
        print(e);
      }
    });
    _chattingClient!.on('message', (msg) => messages.add(msg));
    _chattingClient!.on('disconnect', (_) => print('disconnect room'));

    notifyListeners();
  }

  void disconnectChattingRoom() {
    _chattingClient!.close();
    _chattingClient = null;
    notifyListeners();
  }

  void linkUserData(DocumentSnapshot<Map<String, dynamic>>? snapshot) {
    _userRepo.linkUserData(snapshot);
    notifyListeners();
  }

  void unLinkUserData() {
    _userRepo.unLinkUserData();
    notifyListeners();
  }

  void linkTeam(DocumentSnapshot<Map<String, dynamic>>? snapshot) {
    _userRepo.linkTeam(snapshot);
    notifyListeners();
  }

  void unLinkTeam() {
    _userRepo.unLinkTeam();
    notifyListeners();
  }
}
