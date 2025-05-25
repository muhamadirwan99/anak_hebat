import 'package:flutter/material.dart';
import 'package:anak_hebat/core.dart';

class MateriController extends State<MateriView> {
  static late MateriController instance;
  late MateriView view;

  late EnumMateriState pageState;
  String background = MediaRes.background.leaderboard;

  // Mengenal Angka
  MengenalModel modelMengenalAngka = MengenalModel(
    title: "",
    subtitle: "",
    audio: "",
    onTap: () {},
  );

  final List<MengenalModel> _mengenalAngkaList = List.generate(10, (i) {
    final angka = [
      ["0", "Nol", MediaRes.audio.angka.nol],
      ["1", "Satu", MediaRes.audio.angka.satu],
      ["2", "Dua", MediaRes.audio.angka.dua],
      ["3", "Tiga", MediaRes.audio.angka.tiga],
      ["4", "Empat", MediaRes.audio.angka.empat],
      ["5", "Lima", MediaRes.audio.angka.lima],
      ["6", "Enam", MediaRes.audio.angka.enam],
      ["7", "Tujuh", MediaRes.audio.angka.tujuh],
      ["8", "Delapan", MediaRes.audio.angka.delapan],
      ["9", "Sembilan", MediaRes.audio.angka.sembilan],
    ];
    return MengenalModel(
      title: angka[i][0],
      subtitle: angka[i][1],
      audio: angka[i][2],
      onTap: () {
        MateriController.instance._setMengenalAngka(i);
      },
    );
  });

  List<MengenalModel> listMengenalAngka() => _mengenalAngkaList;

  void _setMengenalAngka(int index) {
    pageState = EnumMateriState.mengenalAngkaContent;
    modelMengenalAngka = _mengenalAngkaList[index];
    update();
  }

  void nextMengenalAngka() {
    int currentIndex = _mengenalAngkaList.indexWhere((e) => e.title == modelMengenalAngka.title);
    if (currentIndex != -1 && currentIndex < _mengenalAngkaList.length - 1) {
      _setMengenalAngka(currentIndex + 1);
    }
  }

  void backMengenalAngka() {
    int currentIndex = _mengenalAngkaList.indexWhere((e) => e.title == modelMengenalAngka.title);
    if (currentIndex > 0) {
      _setMengenalAngka(currentIndex - 1);
    }
  }

  // Menghitung Angka
  MenghitungAngkaModel modelMenghitungAngka = MenghitungAngkaModel(
    level: "",
    gambar: "",
    jawaban: 0,
    pilihan: [],
    onTap: () {},
  );
  bool isAnswerCorrect = false;

  final List<MenghitungAngkaModel> _menghitungAngkaList = [
    MenghitungAngkaModel(
      level: "1",
      gambar: MediaRes.materi.a,
      jawaban: 3,
      pilihan: [3, 2],
      onTap: () => MateriController.instance._setMenghitungAngka(0),
    ),
    MenghitungAngkaModel(
      level: "2",
      gambar: MediaRes.materi.o,
      jawaban: 2,
      pilihan: [3, 2],
      onTap: () => MateriController.instance._setMenghitungAngka(1),
    ),
    MenghitungAngkaModel(
      level: "3",
      gambar: MediaRes.materi.y,
      jawaban: 4,
      pilihan: [3, 4],
      onTap: () => MateriController.instance._setMenghitungAngka(2),
    ),
    MenghitungAngkaModel(
      level: "4",
      gambar: MediaRes.materi.w,
      jawaban: 5,
      pilihan: [5, 4],
      onTap: () => MateriController.instance._setMenghitungAngka(3),
    ),
    MenghitungAngkaModel(
      level: "5",
      gambar: MediaRes.materi.n,
      jawaban: 6,
      pilihan: [5, 6],
      onTap: () => MateriController.instance._setMenghitungAngka(4),
    ),
  ];

  List<MenghitungAngkaModel> listMenghitungAngka() => _menghitungAngkaList;

  void _setMenghitungAngka(int index) {
    pageState = EnumMateriState.menghitung;
    modelMenghitungAngka = _menghitungAngkaList[index];
    isAnswerCorrect = false;
    update();
  }

  void checkAnswerMenghitungAngka(String answer) {
    if (answer == modelMenghitungAngka.jawaban.toString()) {
      int currentIndex =
          _menghitungAngkaList.indexWhere((e) => e.level == modelMenghitungAngka.level);

      if (currentIndex != -1 && currentIndex < _menghitungAngkaList.length - 1) {
        isAnswerCorrect = !isAnswerCorrect;
        update();
        showDialogBase(
          content: DialogHasilJawaban(
            isCorrect: true,
            isLast: false,
            onPressed: () {
              _setMenghitungAngka(currentIndex + 1);
              Get.back();
            },
          ),
        );
      } else {
        showDialogBase(
          content: DialogHasilJawaban(
            isCorrect: true,
            isLast: true,
            onPressed: () {
              pageState = EnumMateriState.pilihLevel;
              update();
              Get.back();
            },
          ),
        );
      }
    } else {
      showDialogBase(
        content: DialogHasilJawaban(
          isCorrect: false,
          isLast: false,
          onPressed: () {
            Get.back();
          },
        ),
      );
    }
    // if (answer == modelMenghitungAngka.jawaban.toString()) {
    //   int currentIndex =
    //       _menghitungAngkaList.indexWhere((e) => e.level == modelMenghitungAngka.level);
    //   if (currentIndex != -1 && currentIndex < _menghitungAngkaList.length - 1) {
    //     _setMenghitungAngka(currentIndex + 1);
    //   } else {
    //     pageState = EnumMateriState.pilihLevel;
    //     update();
    //   }
    // } else {
    //   ScaffoldMessenger.of(globalContext).showSnackBar(
    //     const SnackBar(content: Text("Jawaban Salah")),
    //   );
    // }
  }

  // Mengenal Huruf
  MengenalModel modelMengenalHuruf = MengenalModel(
    title: "",
    subtitle: "",
    audio: "",
    onTap: () {},
  );

  final List<MengenalModel> _mengenalHurufList = [
    ["A", "Apel", MediaRes.audio.huruf.a, MediaRes.materi.a],
    ["B", "Bola", MediaRes.audio.huruf.b, MediaRes.materi.b],
    ["C", "Ceri", MediaRes.audio.huruf.c, MediaRes.materi.c],
    ["D", "Domba", MediaRes.audio.huruf.d, MediaRes.materi.d],
    ["E", "Elang", MediaRes.audio.huruf.e, MediaRes.materi.e],
    ["F", "Foto", MediaRes.audio.huruf.f, MediaRes.materi.f],
    ["G", "Gajah", MediaRes.audio.huruf.g, MediaRes.materi.g],
    ["H", "Harimau", MediaRes.audio.huruf.h, MediaRes.materi.h],
    ["I", "Ikan", MediaRes.audio.huruf.i, MediaRes.materi.i],
    ["J", "Jagung", MediaRes.audio.huruf.j, MediaRes.materi.j],
    ["K", "Kelinci", MediaRes.audio.huruf.k, MediaRes.materi.k],
    ["L", "Lampu", MediaRes.audio.huruf.l, MediaRes.materi.l],
    ["M", "Motor", MediaRes.audio.huruf.m, MediaRes.materi.m],
    ["N", "Nanas", MediaRes.audio.huruf.n, MediaRes.materi.n],
    ["O", "Obat", MediaRes.audio.huruf.o, MediaRes.materi.o],
    ["P", "Payung", MediaRes.audio.huruf.p, MediaRes.materi.p],
    ["Q", "Qur'an", MediaRes.audio.huruf.q, MediaRes.materi.q],
    ["R", "Rusa", MediaRes.audio.huruf.r, MediaRes.materi.r],
    ["S", "Sapi", MediaRes.audio.huruf.s, MediaRes.materi.s],
    ["T", "Telur", MediaRes.audio.huruf.t, MediaRes.materi.t],
    ["U", "Ular", MediaRes.audio.huruf.u, MediaRes.materi.u],
    ["V", "Vas", MediaRes.audio.huruf.v, MediaRes.materi.v],
    ["W", "Wortel", MediaRes.audio.huruf.w, MediaRes.materi.w],
    ["X", "Xilofon", MediaRes.audio.huruf.x, MediaRes.materi.x],
    ["Y", "Yoyo", MediaRes.audio.huruf.y, MediaRes.materi.y],
    ["Z", "Zebra", MediaRes.audio.huruf.z, MediaRes.materi.z],
  ].asMap().entries.map((entry) {
    int i = entry.key;
    var huruf = entry.value;
    return MengenalModel(
      title: huruf[0],
      subtitle: huruf[1],
      audio: huruf[2],
      image: huruf[3],
      onTap: () => MateriController.instance._setMengenalHuruf(i),
    );
  }).toList();

  List<MengenalModel> listMengenalHuruf() => _mengenalHurufList;

  void _setMengenalHuruf(int index) {
    pageState = EnumMateriState.mengenalHurufContent;
    modelMengenalHuruf = _mengenalHurufList[index];
    update();
  }

  void nextMengenalHuruf() {
    int currentIndex = _mengenalHurufList.indexWhere((e) => e.title == modelMengenalHuruf.title);
    if (currentIndex != -1 && currentIndex < _mengenalHurufList.length - 1) {
      _setMengenalHuruf(currentIndex + 1);
    }
  }

  void backMengenalHuruf() {
    int currentIndex = _mengenalHurufList.indexWhere((e) => e.title == modelMengenalHuruf.title);
    if (currentIndex > 0) {
      _setMengenalHuruf(currentIndex - 1);
    }
  }

  // Mencocokan Angka
  MencocokanAngkaModel modelMencocokanAngka = MencocokanAngkaModel(
    value: "",
    textValue: "",
    image: "",
    colorBorder: Colors.transparent,
    onTap: () {},
  );

  final List<MencocokanAngkaModel> _mencocokanAngkaList = [
    MencocokanAngkaModel(
      value: "1",
      colorBorder: green800,
      textValue: "SATU",
      image: MediaRes.materi.a,
      onTap: () => MateriController.instance._setMencocokanAngka(0),
    ),
    MencocokanAngkaModel(
      value: "2",
      colorBorder: blueGray800,
      textValue: "DUA",
      image: MediaRes.materi.n,
      onTap: () => MateriController.instance._setMencocokanAngka(1),
    ),
    MencocokanAngkaModel(
      value: "3",
      colorBorder: blue800,
      textValue: "TIGA",
      image: MediaRes.materi.t,
      onTap: () => MateriController.instance._setMencocokanAngka(2),
    ),
    MencocokanAngkaModel(
      value: "4",
      colorBorder: pink800,
      textValue: "EMPAT",
      image: MediaRes.materi.a,
      onTap: () => MateriController.instance._setMencocokanAngka(3),
    ),
    MencocokanAngkaModel(
      value: "5",
      colorBorder: purple800,
      textValue: "LIMA",
      image: MediaRes.materi.a,
      onTap: () => MateriController.instance._setMencocokanAngka(4),
    ),
    MencocokanAngkaModel(
      value: "6",
      colorBorder: red800,
      textValue: "ENAM",
      image: MediaRes.materi.t,
      onTap: () => MateriController.instance._setMencocokanAngka(5),
    ),
    MencocokanAngkaModel(
      value: "7",
      colorBorder: gray800,
      textValue: "TUJUH",
      image: MediaRes.materi.s,
      onTap: () => MateriController.instance._setMencocokanAngka(6),
    ),
    MencocokanAngkaModel(
      value: "8",
      colorBorder: purple800,
      textValue: "DELAPAN",
      image: MediaRes.materi.p,
      onTap: () => MateriController.instance._setMencocokanAngka(7),
    ),
    MencocokanAngkaModel(
      value: "9",
      colorBorder: const Color(0xff20A95A),
      textValue: "SEMBILAN",
      image: MediaRes.materi.u,
      onTap: () => MateriController.instance._setMencocokanAngka(8),
    ),
    MencocokanAngkaModel(
      value: "10",
      colorBorder: yellow900,
      textValue: "SEPULUH",
      image: MediaRes.materi.w,
      onTap: () => MateriController.instance._setMencocokanAngka(9),
    ),
  ];

  List<MencocokanAngkaModel> listMencocokanAngka() => _mencocokanAngkaList;

  void _setMencocokanAngka(int index) {
    pageState = EnumMateriState.mencocokanAngka;
    modelMencocokanAngka = _mencocokanAngkaList[index];
    update();
  }

  void nextMencocokanAngka() {
    int currentIndex =
        _mencocokanAngkaList.indexWhere((e) => e.value == modelMencocokanAngka.value);
    if (currentIndex != -1 && currentIndex < _mencocokanAngkaList.length - 1) {
      _setMencocokanAngka(currentIndex + 1);
    }
  }

  void backMencocokanAngka() {
    int currentIndex =
        _mencocokanAngkaList.indexWhere((e) => e.value == modelMencocokanAngka.value);
    if (currentIndex > 0) {
      _setMencocokanAngka(currentIndex - 1);
    }
  }

  // Mengenal Bentuk
  MengenalBentukModel modelMengenalBentuk = MengenalBentukModel(
    listBentuk: [
      MediaRes.images.persegi,
      MediaRes.images.persegiPanjang,
      MediaRes.images.segitiga,
      MediaRes.images.lingkaran,
    ],
    soal: 1,
    title: "Mengenal Bentuk",
  );

  final List<MengenalBentukModel> _mengenalBentukList = [
    MengenalBentukModel(
      listBentuk: [
        MediaRes.images.persegi,
        MediaRes.images.persegiPanjang,
        MediaRes.images.segitiga,
        MediaRes.images.lingkaran,
      ],
      soal: 1,
      title: "Mengenal Bentuk",
    ),
    MengenalBentukModel(
      listBentuk: [
        MediaRes.images.persegi,
        MediaRes.images.lingkaran,
        MediaRes.images.persegi,
        MediaRes.images.lingkaran,
      ],
      soal: 2,
      title: "Mengenal Pola",
    ),
    MengenalBentukModel(
      listBentuk: [
        MediaRes.images.lingkaran,
        MediaRes.images.segitiga,
        MediaRes.images.lingkaran,
        MediaRes.images.segitiga,
      ],
      soal: 3,
      title: "Mengenal Pola",
    ),
  ];

  List<MengenalBentukModel> listMengenalBentuk() => _mengenalBentukList;

  void _setMengenalBentuk(int index) {
    modelMengenalBentuk = _mengenalBentukList[index];
    update();
  }

  void nextMengenalBentuk() {
    int currentIndex = _mengenalBentukList.indexWhere((e) => e.soal == modelMengenalBentuk.soal);
    if (currentIndex != -1 && currentIndex < _mengenalBentukList.length - 1) {
      _setMengenalBentuk(currentIndex + 1);
    }
  }

  void backMengenalBentuk() {
    int currentIndex = _mengenalBentukList.indexWhere((e) => e.soal == modelMengenalBentuk.soal);
    if (currentIndex > 0) {
      _setMengenalBentuk(currentIndex - 1);
    }
  }

  // Menghitung Angka
  MengenalPerbandinganModel modelMengenalPerbandingan = MengenalPerbandinganModel(
    soal: "Ayo kita bandingkan, yang manakah yang lebih banyak !",
    imageA: MediaRes.materi.a,
    imageB: MediaRes.materi.n,
    jawaban: 6,
    pilA: 3,
    pilB: 6,
  );

  final List<MengenalPerbandinganModel> _mengenalPerbandinganList = [
    MengenalPerbandinganModel(
      soal: "Ayo kita bandingkan, yang manakah yang lebih banyak !",
      imageA: MediaRes.materi.a,
      imageB: MediaRes.materi.n,
      jawaban: 6,
      pilA: 3,
      pilB: 6,
    ),
    MengenalPerbandinganModel(
      soal: "Ayo kita bandingkan, yang manakah yang lebih sedikit !",
      imageA: MediaRes.materi.h,
      imageB: MediaRes.materi.s,
      jawaban: 4,
      pilA: 5,
      pilB: 4,
    ),
  ];

  List<MengenalPerbandinganModel> listMengenalPerbandingan() => _mengenalPerbandinganList;

  void _setMengenalPerbandingan(int index) {
    // pageState = EnumMateriState.mengenalPerbandingan;
    modelMengenalPerbandingan = _mengenalPerbandinganList[index];
    update();
  }

  void checkAnswerMengenalPerbandingan(int answer) {
    if (answer == modelMengenalPerbandingan.jawaban) {
      int currentIndex =
          _mengenalPerbandinganList.indexWhere((e) => e.soal == modelMengenalPerbandingan.soal);

      if (currentIndex != -1 && currentIndex < _mengenalPerbandinganList.length - 1) {
        showDialogBase(
          content: DialogHasilJawaban(
            isCorrect: true,
            isLast: false,
            onPressed: () {
              _setMengenalPerbandingan(currentIndex + 1);
              Get.back();
            },
          ),
        );
      } else {
        showDialogBase(
          content: DialogHasilJawaban(
            isCorrect: true,
            isLast: true,
            onPressed: () {
              pageState = EnumMateriState.ayoBelajar;
              update();
              Get.back();
            },
          ),
        );
      }
    } else {
      showDialogBase(
        content: DialogHasilJawaban(
          isCorrect: false,
          isLast: false,
          onPressed: () {
            Get.back();
          },
        ),
      );
    }
  }

  // Mengenal Posisi Urutan
  MengenalPosisiUrutanModel modelMengenalPosisiUrutan = MengenalPosisiUrutanModel(
    soal: "1",
    background: MediaRes.background.perbandingan1,
    image: [],
    jawaban: 0,
    pilA: 0,
    pilB: 0,
    pilC: 0,
  );

  final List<MengenalPosisiUrutanModel> _mengenalPosisiUrutanList = [
    MengenalPosisiUrutanModel(
      soal: "1",
      background: MediaRes.background.perbandingan1,
      image: [],
      jawaban: 0,
      pilA: 0,
      pilB: 0,
      pilC: 0,
    ),
    MengenalPosisiUrutanModel(
      soal: "2",
      background: MediaRes.background.perbandingan2,
      image: [],
      jawaban: 0,
      pilA: 0,
      pilB: 0,
      pilC: 0,
    ),
    MengenalPosisiUrutanModel(
      soal: "Segitiga Kuning berada pada urutan ke berapa?",
      background: MediaRes.background.perbandingan3,
      image: [
        MediaRes.images.persegi,
        MediaRes.images.persegiPanjang,
        MediaRes.images.segitiga,
        MediaRes.images.lingkaran,
      ],
      jawaban: 3,
      pilA: 1,
      pilB: 2,
      pilC: 3,
    ),
  ];

  List<MengenalPosisiUrutanModel> listMengenalPosisiUrutan() => _mengenalPosisiUrutanList;

  void _setMengenalPosisiUrutan(int index) {
    // pageState = EnumMateriState.MengenalPosisiUrutan;
    changeBackground(_mengenalPosisiUrutanList[index].background);
    modelMengenalPosisiUrutan = _mengenalPosisiUrutanList[index];
    update();
  }

  void nextMengenalPosisiUrutan() {
    int currentIndex =
        _mengenalPosisiUrutanList.indexWhere((e) => e.soal == modelMengenalPosisiUrutan.soal);

    if (currentIndex != -1 && currentIndex < _mengenalPosisiUrutanList.length - 1) {
      _setMengenalPosisiUrutan(currentIndex + 1);
    }
  }

  void backMengenalPosisiUrutan() {
    int currentIndex =
        _mengenalPosisiUrutanList.indexWhere((e) => e.soal == modelMengenalPosisiUrutan.soal);
    if (currentIndex > 0) {
      _setMengenalPosisiUrutan(currentIndex - 1);
    }
  }

  void checkAnswerMengenalPosisiUrutan(int answer) {
    if (answer == modelMengenalPosisiUrutan.jawaban) {
      int currentIndex =
          _mengenalPosisiUrutanList.indexWhere((e) => e.soal == modelMengenalPosisiUrutan.soal);

      if (currentIndex != -1 && currentIndex < _mengenalPosisiUrutanList.length - 1) {
        showDialogBase(
          content: DialogHasilJawaban(
            isCorrect: true,
            isLast: false,
            onPressed: () {
              _setMengenalPosisiUrutan(currentIndex + 1);
              Get.back();
            },
          ),
        );
      } else {
        showDialogBase(
          content: DialogHasilJawaban(
            isCorrect: true,
            isLast: true,
            onPressed: () {
              pageState = EnumMateriState.ayoBelajar;
              update();
              Get.back();
            },
          ),
        );
      }
    } else {
      showDialogBase(
        content: DialogHasilJawaban(
          isCorrect: false,
          isLast: false,
          onPressed: () {
            Get.back();
          },
        ),
      );
    }
  }

  void changePageState(EnumMateriState state) {
    pageState = state;
    update();
  }

  void changeBackground(String image) {
    background = image;
    update();
  }

  @override
  void initState() {
    instance = this;
    pageState = widget.pageState;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
