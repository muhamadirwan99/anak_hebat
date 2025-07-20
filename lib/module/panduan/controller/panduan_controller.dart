import 'package:anak_hebat/module/panduan/widget/panduan_button.dart';
import 'package:flutter/material.dart';
import 'package:anak_hebat/core.dart';

enum PanduanType {
  belajarMengenalHuruf,
  belajarMengenalAngka,
  belajarMencocokanAngka,
  belajarMengenalBentuk,
  belajarMengenalPerbandingan,
  belajarMengenalPosisiUrutan,
  belajarMengenalPosisi,
  belajarBerhitung,
  mengenalAngkaDanBenda,
  mengerjakanKuis,
  melihatPeringkat,
}

class PanduanController extends State<PanduanView> {
  static late PanduanController instance;
  late PanduanView view;

  PanduanType? selectedPanduan;
  int currentIndex = 0;
  List<String> currentPanduanImages = [];
  String currentTitle = "";

  String get title => currentTitle;

  List<String> get currentImagePath {
    if (currentPanduanImages.isEmpty) return [];
    return currentPanduanImages;
  }

  String get currentImage {
    if (currentPanduanImages.isEmpty) return "";
    return currentPanduanImages[currentIndex];
  }

  List<Widget> listPanduan() {
    return [
      PanduanButton(
        title: "Belajar Mengenal Huruf",
        onTap: () {
          _handleOnTapPanduan(PanduanType.belajarMengenalHuruf);
        },
      ),
      PanduanButton(
        title: "Belajar Mengenal Angka",
        onTap: () {
          _handleOnTapPanduan(PanduanType.belajarMengenalAngka);
        },
      ),
      PanduanButton(
        title: "Belajar Mencocokan Angka",
        onTap: () {
          _handleOnTapPanduan(PanduanType.belajarMencocokanAngka);
        },
      ),
      PanduanButton(
        title: "Belajar Mengenal Bentuk",
        onTap: () {
          _handleOnTapPanduan(PanduanType.belajarMengenalBentuk);
        },
      ),
      PanduanButton(
        title: "Belajar Mengenal Perbandingan",
        onTap: () {
          _handleOnTapPanduan(PanduanType.belajarMengenalPerbandingan);
        },
      ),
      PanduanButton(
        title: "Belajar Mengenal Posisi Urutan",
        onTap: () {
          _handleOnTapPanduan(PanduanType.belajarMengenalPosisiUrutan);
        },
      ),
      PanduanButton(
        title: "Belajar Mengenal Posisi",
        onTap: () {
          _handleOnTapPanduan(PanduanType.belajarMengenalPosisi);
        },
      ),
      PanduanButton(
        title: "Belajar Berhitung",
        onTap: () {
          _handleOnTapPanduan(PanduanType.belajarBerhitung);
        },
      ),
      PanduanButton(
        title: "Mengenal Angka dan Benda",
        onTap: () {
          _handleOnTapPanduan(PanduanType.mengenalAngkaDanBenda);
        },
      ),
      PanduanButton(
        title: "Mengerjakan Kuis",
        onTap: () {
          _handleOnTapPanduan(PanduanType.mengerjakanKuis);
        },
      ),
      PanduanButton(
        title: "Melihat Peringkat",
        onTap: () {
          _handleOnTapPanduan(PanduanType.melihatPeringkat);
        },
      ),
    ];
  }

  _handleOnTapPanduan(PanduanType type) {
    selectedPanduan = type;
    currentIndex = 0;
    _loadPanduanData(type);
    update();
  }

  void _loadPanduanData(PanduanType type) {
    switch (type) {
      case PanduanType.belajarMengenalHuruf:
        currentTitle = MediaRes.panduan.materiHuruf.title;
        currentPanduanImages = [
          MediaRes.panduan.materiHuruf.panduan1,
          MediaRes.panduan.materiHuruf.panduan2,
          MediaRes.panduan.materiHuruf.panduan3,
          MediaRes.panduan.materiHuruf.panduan4,
        ];
        break;
      case PanduanType.belajarMengenalAngka:
        currentTitle = MediaRes.panduan.belajarAngka.title;
        currentPanduanImages = [
          MediaRes.panduan.belajarAngka.panduan1,
          MediaRes.panduan.belajarAngka.panduan2,
          MediaRes.panduan.belajarAngka.panduan3,
          MediaRes.panduan.belajarAngka.panduan4,
          MediaRes.panduan.belajarAngka.panduan5,
        ];
        break;
      case PanduanType.belajarMencocokanAngka:
        currentTitle = MediaRes.panduan.belajarMencocokanAngka.title;
        currentPanduanImages = [
          MediaRes.panduan.belajarMencocokanAngka.panduan1,
          MediaRes.panduan.belajarMencocokanAngka.panduan2,
          MediaRes.panduan.belajarMencocokanAngka.panduan3,
          MediaRes.panduan.belajarMencocokanAngka.panduan4,
          MediaRes.panduan.belajarMencocokanAngka.panduan5,
        ];
        break;
      case PanduanType.belajarMengenalBentuk:
        currentTitle = MediaRes.panduan.belajarMengenalBentuk.title;
        currentPanduanImages = [
          MediaRes.panduan.belajarMengenalBentuk.panduan1,
          MediaRes.panduan.belajarMengenalBentuk.panduan2,
          MediaRes.panduan.belajarMengenalBentuk.panduan3,
          MediaRes.panduan.belajarMengenalBentuk.panduan4,
        ];
        break;
      case PanduanType.belajarMengenalPerbandingan:
        currentTitle = MediaRes.panduan.belajarMengenalPerbandingan.title;
        currentPanduanImages = [
          MediaRes.panduan.belajarMengenalPerbandingan.panduan1,
          MediaRes.panduan.belajarMengenalPerbandingan.panduan2,
          MediaRes.panduan.belajarMengenalPerbandingan.panduan3,
          MediaRes.panduan.belajarMengenalPerbandingan.panduan4,
          MediaRes.panduan.belajarMengenalPerbandingan.panduan5,
          MediaRes.panduan.belajarMengenalPerbandingan.panduan6,
        ];
        break;
      case PanduanType.belajarMengenalPosisiUrutan:
        currentTitle = MediaRes.panduan.belajarMengenalPosisiUrutan.title;
        currentPanduanImages = [
          MediaRes.panduan.belajarMengenalPosisiUrutan.panduan1,
          MediaRes.panduan.belajarMengenalPosisiUrutan.panduan2,
          MediaRes.panduan.belajarMengenalPosisiUrutan.panduan3,
          MediaRes.panduan.belajarMengenalPosisiUrutan.panduan4,
          MediaRes.panduan.belajarMengenalPosisiUrutan.panduan5,
          MediaRes.panduan.belajarMengenalPosisiUrutan.panduan6,
          MediaRes.panduan.belajarMengenalPosisiUrutan.panduan7,
          MediaRes.panduan.belajarMengenalPosisiUrutan.panduan8,
          MediaRes.panduan.belajarMengenalPosisiUrutan.panduan9,
        ];
        break;
      case PanduanType.belajarMengenalPosisi:
        currentTitle = MediaRes.panduan.belajarMengenalPosisi.title;
        currentPanduanImages = [
          MediaRes.panduan.belajarMengenalPosisi.panduan1,
          MediaRes.panduan.belajarMengenalPosisi.panduan2,
          MediaRes.panduan.belajarMengenalPosisi.panduan3,
          MediaRes.panduan.belajarMengenalPosisi.panduan4,
          MediaRes.panduan.belajarMengenalPosisi.panduan5,
          MediaRes.panduan.belajarMengenalPosisi.panduan6,
          MediaRes.panduan.belajarMengenalPosisi.panduan7,
        ];
        break;
      case PanduanType.belajarBerhitung:
        currentTitle = MediaRes.panduan.belajarBerhitung.title;
        currentPanduanImages = [
          MediaRes.panduan.belajarBerhitung.panduan1,
          MediaRes.panduan.belajarBerhitung.panduan2,
          MediaRes.panduan.belajarBerhitung.panduan3,
          MediaRes.panduan.belajarBerhitung.panduan4,
          MediaRes.panduan.belajarBerhitung.panduan5,
          MediaRes.panduan.belajarBerhitung.panduan6,
        ];
        break;
      case PanduanType.mengenalAngkaDanBenda:
        currentTitle = MediaRes.panduan.belajarMengenalAngkaDanBenda.title;
        currentPanduanImages = [
          MediaRes.panduan.belajarMengenalAngkaDanBenda.panduan1,
          MediaRes.panduan.belajarMengenalAngkaDanBenda.panduan2,
          MediaRes.panduan.belajarMengenalAngkaDanBenda.panduan3,
          MediaRes.panduan.belajarMengenalAngkaDanBenda.panduan4,
          MediaRes.panduan.belajarMengenalAngkaDanBenda.panduan5,
          MediaRes.panduan.belajarMengenalAngkaDanBenda.panduan6,
          MediaRes.panduan.belajarMengenalAngkaDanBenda.panduan7,
        ];
        break;
      case PanduanType.mengerjakanKuis:
        currentTitle = MediaRes.panduan.kuis.title;
        currentPanduanImages = [
          MediaRes.panduan.kuis.panduan1,
          MediaRes.panduan.kuis.panduan2,
          MediaRes.panduan.kuis.panduan3,
          MediaRes.panduan.kuis.panduan4,
        ];
        break;
      case PanduanType.melihatPeringkat:
        currentTitle = MediaRes.panduan.peringkat.title;
        currentPanduanImages = [
          MediaRes.panduan.peringkat.panduan1,
          MediaRes.panduan.peringkat.panduan2,
        ];
        break;
    }
  }

  void nextPanduan() {
    if (currentIndex < currentPanduanImages.length - 1) {
      currentIndex++;
      update();
    }
  }

  void backPanduan() {
    if (currentIndex > 0) {
      currentIndex--;
      update();
    } else {
      // If at first image, go back to selection
      selectedPanduan = null;
      currentPanduanImages = [];
      currentTitle = "";
      currentIndex = 0;
      update();
    }
  }

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
