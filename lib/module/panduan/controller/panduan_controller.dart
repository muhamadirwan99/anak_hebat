import 'package:flutter/material.dart';
import 'package:anak_hebat/core.dart';
import '../view/panduan_view.dart';

class PanduanController extends State<PanduanView> {
  static late PanduanController instance;
  late PanduanView view;

  // State variables for expandable sections
  bool isHurufExpanded = true;
  bool isNumerasiExpanded = true;
  bool isQuizExpanded = true;
  bool isLeaderboardExpanded = true;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  // Methods to toggle section expansion
  void toggleHurufSection() {
    setState(() {
      isHurufExpanded = !isHurufExpanded;
    });
  }

  void toggleNumerasiSection() {
    setState(() {
      isNumerasiExpanded = !isNumerasiExpanded;
    });
  }

  void toggleQuizSection() {
    setState(() {
      isQuizExpanded = !isQuizExpanded;
    });
  }

  void toggleLeaderboardSection() {
    setState(() {
      isLeaderboardExpanded = !isLeaderboardExpanded;
    });
  }
}
