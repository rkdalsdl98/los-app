class NotifyModel {
  final String type;
  dynamic data;

  NotifyModel.fromJson(Map<String, dynamic> json)
      : type = json['type'],
        data = json['data'];
}
