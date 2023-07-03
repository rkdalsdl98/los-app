import 'package:cloud_firestore/cloud_firestore.dart';

class UserDataModel {
  String? address, email, phoneNumber, profileImage, teamCode;
  Timestamp? createdAt;

  UserDataModel.fromDoc(DocumentSnapshot<Map<String, dynamic>>? snapshot) {
    if (snapshot != null) {
      address = snapshot['address'];
      createdAt = snapshot['created-at'];
      email = snapshot['email'];
      phoneNumber = snapshot['phone-number'];
      profileImage = snapshot['profile-image'];
      teamCode = snapshot['team-code'];
    }
  }

  UserDataModel.fromJson(Map<String, dynamic> json)
      : address = json['address'],
        createdAt = json['created-at'],
        email = json['email'],
        phoneNumber = json['phone-number'],
        profileImage = json['profile-image'],
        teamCode = json['team-code'];
}
