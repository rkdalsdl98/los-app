class JoinRequestModel {
  String? privateId, nickName, age, height, weight, profileImageUrl;
  DetailInfoModel? detail;

  JoinRequestModel.fromJson(Map<String, dynamic> json) {
    privateId = json['privateId'];
    nickName = json['nickname'];
    age = json['age'];
    height = json['height'];
    weight = json['weight'];
    profileImageUrl = json['profileImageUrl'];
    if (json['detailInfo'] != null) {
      var detailData = json['detailInfo'];
      detail = DetailInfoModel.fromJson(detailData);
    }
  }
}

class DetailInfoModel {
  String? name, phoneNumber, address, favoriteSports;

  DetailInfoModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        phoneNumber = json['phoneNumber'],
        address = json['address'],
        favoriteSports = json['favoriteSports'];
}
