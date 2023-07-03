import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:los_app/model/user_data_model.dart';

class UserRepo {
  late User? user;

  final FirebaseAuth _authentication = FirebaseAuth.instance;
  FirebaseAuth get authentication => _authentication;

  UserDataModel? _userData;
  UserDataModel? get userData => _userData;

  UserRepo() {
    user = _authentication.currentUser;
  }

  void linkUserData(DocumentSnapshot<Map<String, dynamic>>? snapshot) {
    _userData = UserDataModel.fromDoc(snapshot);
  }

  void unLinkUserData() {
    _userData = null;
  }
}
