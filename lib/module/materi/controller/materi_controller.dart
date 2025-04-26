import 'package:flutter/material.dart';
import 'package:anak_hebat/core.dart';

class MateriController extends State<MateriView> {
  static late MateriController instance;
  late MateriView view;

  late EnumPageState pageState;

  @override
  void initState() {
    instance = this;
    pageState = EnumPageState.mengenalAngka;
    // pageState = widget.pageState;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
