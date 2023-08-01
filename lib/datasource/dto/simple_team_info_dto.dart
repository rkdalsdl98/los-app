class SimpleTeamInfoDto {
  String? teamName, teamCode, tier, score, kindness;
  int? memberCount, point;

  SimpleTeamInfoDto.fromJson(Map<String, dynamic> json)
      : teamCode = json['teamCode'],
        teamName = json['teamName'],
        tier = json['tier'],
        score = json['score'],
        kindness = json['kindness'],
        memberCount = json['memberCount'],
        point = json['point'];
}
