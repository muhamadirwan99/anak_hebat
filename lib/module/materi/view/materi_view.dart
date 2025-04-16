import 'package:flutter/material.dart';
import 'package:anak_hebat/core.dart';
import '../controller/materi_controller.dart';

class MateriView extends StatefulWidget {
  const MateriView({super.key});

  Widget build(context, MateriController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Materi"),
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
  State<MateriView> createState() => MateriController();
}
