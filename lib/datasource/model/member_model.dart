class MemberModel {
  String? email, phoneNumber, profileImageUrl, privateId, nickname;

  MemberModel.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        phoneNumber = json['phoneNumber'],
        profileImageUrl = json['profileImageUrl'],
        privateId = json['privateId'],
        nickname = json['nickname'];
}
