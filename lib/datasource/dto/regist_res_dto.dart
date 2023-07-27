class RegistResDto {
  Map<String, dynamic>? team;
  String? message, exception;

  RegistResDto.fromJson(Map<String, dynamic> json)
      : team = json['team'],
        message = json['message'],
        exception = json['exception'];
}
