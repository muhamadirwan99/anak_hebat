import 'package:flutter/material.dart';
import 'package:anak_hebat/core.dart';
import '../view/panduan_view.dart';

class PanduanController extends State<PanduanView> {
  static late PanduanController instance;
  late PanduanView view;

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
