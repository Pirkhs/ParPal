class ScorecardData {
  final int? id;
  final String date;
  final String players;
  final String scores;
  final int userId;

  ScorecardData({required this.id, required this.date, required this.players, required this.scores, required this.userId});

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'date': date,
      'players': players,
      'scores': scores,
      'user_id': userId
    };
  }
}