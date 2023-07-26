class GameDetailModel {
  String? writerTeamMark,
      requesterTeamMark,
      score,
      writerTeamName,
      requesterTeamName,
      sports;

  GameDetailModel.fromJson(Map<String, dynamic> json)
      : writerTeamMark = json['writerTeamMark'],
        requesterTeamMark = json['requesterTeamMark'],
        score = json['score'],
        writerTeamName = json['writerTeamName'],
        requesterTeamName = json['requesterTeamName'],
        sports = json['sports'];
}
