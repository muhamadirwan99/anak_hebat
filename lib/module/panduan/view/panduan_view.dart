import 'package:flutter/material.dart';
import 'package:anak_hebat/core.dart';
import '../controller/panduan_controller.dart';

class PanduanView extends StatefulWidget {
  const PanduanView({super.key});

  Widget build(context, PanduanController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Panduan"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: const Column(
            children: [],
          ),
        ),
      ),
    );
  }

  @override
  State<PanduanView> createState() => PanduanController();
}
