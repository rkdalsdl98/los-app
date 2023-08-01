import 'package:cloud_firestore/cloud_firestore.dart';

class UserDataModel {
  String? address,
      email,
      phoneNumber,
      profileImage,
      teamCode,
      nickname,
      age,
      height,
      weight,
      favoriteSports,
      name,
      permission;

  int? createdAt;
  UserDataModel.fromDoc(DocumentSnapshot<Map<String, dynamic>>? snapshot) {
    if (snapshot != null) {
      address = snapshot['address'];
      createdAt = int.parse(snapshot['createdAt']);
      email = snapshot['email'];
      phoneNumber = snapshot['phoneNumber'];
      profileImage = snapshot['profileImage'];
      teamCode = snapshot['teamCode'];
      age = snapshot['age'];
      height = snapshot['height'];
      weight = snapshot['weight'];
      favoriteSports = snapshot['favoriteSports'];
      name = snapshot['name'];
      nickname = snapshot['nickname'];
      permission = snapshot['permission'];
    }
  }

  UserDataModel.fromJson(Map<String, dynamic> json)
      : address = json['address'],
        createdAt = json['createdAt'],
        email = json['email'],
        phoneNumber = json['phoneNumber'],
        profileImage = json['profileImage'],
        teamCode = json['teamCode'],
        nickname = json['nickname'],
        age = json['age'],
        height = json['height'],
        weight = json['weight'],
        favoriteSports = json['favoriteSports'],
        name = json['name'],
        permission = json['permission'];

  Map<String, dynamic> toJson() => {
        "address": address,
        "createdAt": createdAt,
        "email": email,
        "phoneNumber": phoneNumber,
        "profileImage": profileImage,
        "teamCode": teamCode,
        "nickname": nickname,
        "age": age,
        "height": height,
        "weight": weight,
        "favoriteSports": favoriteSports,
        "name": name,
        "permission": permission,
      };
}
