import 'package:flutter/material.dart';
import 'package:anak_hebat/core.dart';
import '../view/materi_view.dart';

class MateriController extends State<MateriView> {
  static late MateriController instance;
  late MateriView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
