import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:los_app/datasource/api_manager.dart';
import 'package:los_app/datasource/local_manager.dart';
import 'package:los_app/model/notify_model.dart';
import 'package:los_app/model/team_model.dart';
import 'package:los_app/resposistory/user_repo.dart';
import 'package:socket_io_client/socket_io_client.dart';

import '../model/user_data_model.dart';

class UserProvider with ChangeNotifier {
  late UserRepo _userRepo;

  User? get user => _userRepo.user;
  UserDataModel? get userData => _userRepo.userData;
  TeamModel? get team => _userRepo.team;

  Socket? _chattingClient;
  Socket? get chattingClient => _chattingClient;

  FirebaseAuth get authentication => _userRepo.authentication;

  List<String> messages = [];

  UserProvider() {
    _userRepo = UserRepo(ApiClient());
    LocalMamanger.getStringData('user').then((value) {
      if (value != null) {
        final toJson = jsonDecode(value);
        _userRepo.linkUserDataFromJson(toJson);
      }
      notifyListeners();
    });
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

    void joinChattingRomm() {
      try {
        _chattingClient = io(
          'http://localhost/chat',
          OptionBuilder()
              .setTransports(['websocket'])
              .disableAutoConnect()
              .build(),
        );
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
  }
}
