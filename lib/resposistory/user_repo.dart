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

  void linkUserDataFromDoc(DocumentSnapshot<Map<String, dynamic>>? snapshot) {
    _userData = UserDataModel.fromDoc(snapshot);
  }

  void linkUserDataFromJson(Map<String, dynamic> json) {
    _userData = UserDataModel.fromJson(json);
  }

  void unLinkUserData() {
    _userData = null;
    user = null;
  }

  void linkUser(User? newUser) {
    user = newUser;
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDoc() async {
    return await FirebaseFirestore.instance
        .collection('user')
        .doc(user!.uid)
        .get();
  }
}
