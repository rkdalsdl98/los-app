class RequesterDto {
  String? email, phoneNumber, profileImageUrl, privateId, nickname;

  RequesterDto(Map<String, dynamic> obj)
      : email = obj['email'],
        phoneNumber = obj['phoneNumber'],
        profileImageUrl = obj['profileImageUrl'],
        privateId = obj['privateId'],
        nickname = obj['nickname'];

  Map<String, dynamic> toJson() => {
        "email": email,
        "phoneNumber": phoneNumber,
        "profileImageUrl": profileImageUrl,
        "privateId": privateId,
        "nickname": nickname,
      };
}
