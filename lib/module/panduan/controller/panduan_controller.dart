import 'package:anak_hebat/module/panduan/widget/panduan_button.dart';
import 'package:flutter/material.dart';
import 'package:anak_hebat/core.dart';
import '../view/panduan_view.dart';

class PanduanController extends State<PanduanView> {
  static late PanduanController instance;
  late PanduanView view;

  List<Widget> listPanduan = [
    PanduanButton(
      title: "Belajar Mengenal Huruf",
      onTap: () {},
    ),
    PanduanButton(
      title: "Belajar Mengenal Angka",
      onTap: () {},
    ),
    PanduanButton(
      title: "Belajar Mencocokan Angka",
      onTap: () {},
    ),
    PanduanButton(
      title: "Belajar Mengenal Bentuk",
      onTap: () {},
    ),
    PanduanButton(
      title: "Belajar Mengenal Perbandingan",
      onTap: () {},
    ),
    PanduanButton(
      title: "Belajar Mengenal Posisi Urutan",
      onTap: () {},
    ),
    PanduanButton(
      title: "Belajar Mengenal Posisi",
      onTap: () {},
    ),
    PanduanButton(
      title: "Belajar Berhitung",
      onTap: () {},
    ),
    PanduanButton(
      title: "mengenal Angka dan Benda",
      onTap: () {},
    ),
    PanduanButton(
      title: "Mengerjakan Kuis",
      onTap: () {},
    ),
    PanduanButton(
      title: "Melihat Peringkat",
      onTap: () {},
    ),
  ];

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
