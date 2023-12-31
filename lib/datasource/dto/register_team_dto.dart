import 'package:los_app/datasource/dto/requester_dto.dart';

class RegisterTeamDto {
  final RequesterDto requester;
  String teamName;
  String? teamMarkUrl;

  RegisterTeamDto(Map<String, dynamic> obj)
      : requester = obj['requester'],
        teamMarkUrl = obj['teamMarkUrl'],
        teamName = obj['teamName'];

  Map<String, dynamic> toJson() => {
        "requester": requester.toJson(),
        "teamMarkUrl": teamMarkUrl,
        "teamName": teamName,
      };
}
