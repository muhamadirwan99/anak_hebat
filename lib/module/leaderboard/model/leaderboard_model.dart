class LeaderboardModel {
  final String idUser;
  final String name;
  final String literasi;
  final String numerasi;
  final int rataRata;

  LeaderboardModel({
    required this.idUser,
    required this.name,
    required this.literasi,
    required this.numerasi,
    required this.rataRata,
  });

  factory LeaderboardModel.fromJson(Map<String, dynamic> json) {
    return LeaderboardModel(
      idUser: json['id_user'] ?? '',
      name: json['name'] ?? '',
      literasi: json['literasi'] ?? '',
      numerasi: json['numerasi'] ?? '',
      rataRata: _parseInt(json['rata_rata']),
    );
  }

  static int _parseInt(dynamic value) {
    if (value is int) return value;
    if (value is String) return int.tryParse(value) ?? 0;
    return 0;
  }
}
