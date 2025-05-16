import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:anak_hebat/core.dart';

class LeaderboardController extends State<LeaderboardView> {
  static late LeaderboardController instance;
  late LeaderboardView view;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<LeaderboardModel> leaderboardList = [];

  getDataLeaderboard() async {
    try {
      final snapshot = await _firestore.collection('leaderboards').get();

      // Pemetaan berdasarkan id_user
      final Map<String, Map<String, dynamic>> userMap = {};

      for (var doc in snapshot.docs) {
        final data = doc.data();
        final idUser = data['id_user'];
        final name = data['name'];
        final quiz = data['quiz'];
        final pointRaw = data['point'];
        final point = pointRaw is int ? pointRaw : int.tryParse(pointRaw.toString()) ?? 0;

        if (!userMap.containsKey(idUser)) {
          userMap[idUser] = {
            'id_user': idUser,
            'name': name,
            'literasi': '',
            'numerasi': '',
          };
        }

        // Masukkan skor ke literasi/numerasi sesuai quiz
        if (quiz == 'literasi') {
          userMap[idUser]!['literasi'] = point.toString();
        } else if (quiz == 'numerasi') {
          userMap[idUser]!['numerasi'] = point.toString();
        }
      }

      final List<LeaderboardModel> list = [];

      userMap.forEach((key, value) {
        final literasi = value['literasi'] ?? '';
        final numerasi = value['numerasi'] ?? '';

        final litInt = int.tryParse(literasi) ?? 0;
        final numInt = int.tryParse(numerasi) ?? 0;

        final rataRata =
            (litInt + numInt) ~/ ((literasi != '' ? 1 : 0) + (numerasi != '' ? 1 : 0)).clamp(1, 2);

        list.add(LeaderboardModel(
          idUser: value['id_user'],
          name: value['name'],
          literasi: literasi,
          numerasi: numerasi,
          rataRata: rataRata,
        ));
      });

      // Urutkan berdasarkan rata-rata
      list.sort((a, b) => b.rataRata.compareTo(a.rataRata));

      setState(() {
        leaderboardList = list;
      });
    } catch (e) {
      print("Error fetching leaderboard data: $e");
    }
  }

  @override
  void initState() {
    instance = this;
    getDataLeaderboard();
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
