class RequesterDto {
  String? email, phoneNumber, profileImageUrl, privateId, nickname;

  RequesterDto(Map<String, dynamic> obj)
      : email = obj['email'],
        phoneNumber = obj['phoneNumber'],
        profileImageUrl = obj['profileImageUrl'],
        privateId = obj['privateId'],
        nickname = obj['nickname'];

  static Map<String, dynamic> toJson(RequesterDto requester) => {
        "email": requester.email,
        "phoneNumber": requester.phoneNumber,
        "profileImageUrl": requester.profileImageUrl,
        "privateId": requester.privateId,
        "nickname": requester.nickname,
      };
}
