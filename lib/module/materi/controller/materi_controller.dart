import 'package:flutter/material.dart';
import 'package:anak_hebat/core.dart';

class MateriController extends State<MateriView> {
  static late MateriController instance;
  late MateriView view;

  late EnumMateriState pageState;

  //Mengenal Angka
  MengenalModel modelMengenalAngka = MengenalModel(
    title: "",
    subtitle: "",
    audio: "",
    onTap: () {},
  );

  List<MengenalModel> listMengenalAngka() {
    return [
      MengenalModel(
        title: "0",
        subtitle: "Nol",
        audio: MediaRes.audio.angka.nol,
        onTap: () {
          pageState = EnumMateriState.mengenalAngkaContent;
          modelMengenalAngka = listMengenalAngka()[0];
          update();
        },
      ),
      MengenalModel(
        title: "1",
        subtitle: "Satu",
        audio: MediaRes.audio.angka.satu,
        onTap: () {
          pageState = EnumMateriState.mengenalAngkaContent;
          modelMengenalAngka = listMengenalAngka()[1];
          update();
        },
      ),
      MengenalModel(
        title: "2",
        subtitle: "Dua",
        audio: MediaRes.audio.angka.dua,
        onTap: () {
          pageState = EnumMateriState.mengenalAngkaContent;
          modelMengenalAngka = listMengenalAngka()[2];
          update();
        },
      ),
      MengenalModel(
        title: "3",
        subtitle: "Tiga",
        audio: MediaRes.audio.angka.tiga,
        onTap: () {
          pageState = EnumMateriState.mengenalAngkaContent;
          modelMengenalAngka = listMengenalAngka()[3];
          update();
        },
      ),
      MengenalModel(
        title: "4",
        subtitle: "Empat",
        audio: MediaRes.audio.angka.empat,
        onTap: () {
          pageState = EnumMateriState.mengenalAngkaContent;
          modelMengenalAngka = listMengenalAngka()[4];
          update();
        },
      ),
      MengenalModel(
        title: "5",
        subtitle: "Lima",
        audio: MediaRes.audio.angka.lima,
        onTap: () {
          pageState = EnumMateriState.mengenalAngkaContent;
          modelMengenalAngka = listMengenalAngka()[5];
          update();
        },
      ),
      MengenalModel(
        title: "6",
        subtitle: "Enam",
        audio: MediaRes.audio.angka.enam,
        onTap: () {
          pageState = EnumMateriState.mengenalAngkaContent;
          modelMengenalAngka = listMengenalAngka()[6];
          update();
        },
      ),
      MengenalModel(
        title: "7",
        subtitle: "Tujuh",
        audio: MediaRes.audio.angka.tujuh,
        onTap: () {
          pageState = EnumMateriState.mengenalAngkaContent;
          modelMengenalAngka = listMengenalAngka()[7];
          update();
        },
      ),
      MengenalModel(
        title: "8",
        subtitle: "Delapan",
        audio: MediaRes.audio.angka.delapan,
        onTap: () {
          pageState = EnumMateriState.mengenalAngkaContent;
          modelMengenalAngka = listMengenalAngka()[8];
          update();
        },
      ),
      MengenalModel(
        title: "9",
        subtitle: "Sembilan",
        audio: MediaRes.audio.angka.sembilan,
        onTap: () {
          pageState = EnumMateriState.mengenalAngkaContent;
          modelMengenalAngka = listMengenalAngka()[9];
          update();
        },
      ),
    ];
  }

  void nextMengenalAngka() {
    int currentIndex =
        listMengenalAngka().indexWhere((element) => element.title == modelMengenalAngka.title);

    if (currentIndex != -1 && currentIndex < listMengenalAngka().length - 1) {
      modelMengenalAngka = listMengenalAngka()[currentIndex + 1];
      update();
    }
  }

  void backMengenalAngka() {
    int currentIndex =
        listMengenalAngka().indexWhere((element) => element.title == modelMengenalAngka.title);
    if (currentIndex > 0) {
      modelMengenalAngka = listMengenalAngka()[currentIndex - 1];
      update();
    }
  }
  //End Mengenal Angka

  //Menghitung Angka
  MenghitungAngkaModel modelMenghitungAngka = MenghitungAngkaModel(
    level: "",
    gambar: "",
    jawaban: 0,
    pilihan: [],
    onTap: () {},
  );
  bool isAnswerCorrect = false;

  List<MenghitungAngkaModel> listMenghitungAngka() {
    return [
      MenghitungAngkaModel(
        level: "1",
        gambar: MediaRes.materi.a,
        jawaban: 3,
        pilihan: [3, 2],
        onTap: () {
          pageState = EnumMateriState.menghitung;
          modelMenghitungAngka = listMenghitungAngka()[0];
          isAnswerCorrect = false;
          update();
        },
      ),
      MenghitungAngkaModel(
        level: "2",
        gambar: MediaRes.materi.o,
        jawaban: 2,
        pilihan: [3, 2],
        onTap: () {
          pageState = EnumMateriState.menghitung;
          modelMenghitungAngka = listMenghitungAngka()[1];
          isAnswerCorrect = false;
          update();
        },
      ),
      MenghitungAngkaModel(
        level: "3",
        gambar: MediaRes.materi.y,
        jawaban: 4,
        pilihan: [3, 4],
        onTap: () {
          pageState = EnumMateriState.menghitung;
          modelMenghitungAngka = listMenghitungAngka()[2];
          isAnswerCorrect = false;
          update();
        },
      ),
      MenghitungAngkaModel(
        level: "4",
        gambar: MediaRes.materi.w,
        jawaban: 5,
        pilihan: [5, 4],
        onTap: () {
          pageState = EnumMateriState.menghitung;
          modelMenghitungAngka = listMenghitungAngka()[3];
          isAnswerCorrect = false;
          update();
        },
      ),
      MenghitungAngkaModel(
        level: "5",
        gambar: MediaRes.materi.n,
        jawaban: 6,
        pilihan: [5, 6],
        onTap: () {
          pageState = EnumMateriState.menghitung;
          modelMenghitungAngka = listMenghitungAngka()[4];
          isAnswerCorrect = false;
          update();
        },
      ),
    ];
  }

  void checkAnswerMenghitungAngka(String answer) {
    if (answer == modelMenghitungAngka.jawaban.toString()) {
      int currentIndex = listMenghitungAngka()
          .indexWhere((element) => element.level == modelMenghitungAngka.level);

      if (currentIndex != -1 && currentIndex < listMenghitungAngka().length - 1) {
        modelMenghitungAngka = listMenghitungAngka()[currentIndex + 1];
        update();
      } else {
        pageState = EnumMateriState.pilihLevel;
        update();
      }
    } else {
      //If answer is wrong show message
      ScaffoldMessenger.of(globalContext).showSnackBar(
        const SnackBar(
          content: Text("Jawaban Salah"),
        ),
      );
    }
  }
  //End Menghitung Angka

  //Mengenal Huruf
  MengenalModel modelMengenalHuruf = MengenalModel(
    title: "",
    subtitle: "",
    audio: "",
    onTap: () {},
  );

  List<MengenalModel> listMengenalHuruf() {
    return [
      MengenalModel(
        title: "A",
        subtitle: "Apel",
        audio: MediaRes.audio.huruf.a,
        image: MediaRes.materi.a,
        onTap: () {
          pageState = EnumMateriState.mengenalHurufContent;
          modelMengenalHuruf = listMengenalHuruf()[0];
          update();
        },
      ),
      MengenalModel(
        title: "B",
        subtitle: "Bola",
        audio: MediaRes.audio.huruf.b,
        image: MediaRes.materi.b,
        onTap: () {
          pageState = EnumMateriState.mengenalHurufContent;
          modelMengenalHuruf = listMengenalHuruf()[1];
          update();
        },
      ),
      MengenalModel(
        title: "C",
        subtitle: "Ceri",
        audio: MediaRes.audio.huruf.c,
        image: MediaRes.materi.c,
        onTap: () {
          pageState = EnumMateriState.mengenalHurufContent;
          modelMengenalHuruf = listMengenalHuruf()[2];
          update();
        },
      ),
      MengenalModel(
        title: "D",
        subtitle: "Domba",
        audio: MediaRes.audio.huruf.d,
        image: MediaRes.materi.d,
        onTap: () {
          pageState = EnumMateriState.mengenalHurufContent;
          modelMengenalHuruf = listMengenalHuruf()[3];
          update();
        },
      ),
      MengenalModel(
        title: "E",
        subtitle: "Elang",
        audio: MediaRes.audio.huruf.e,
        image: MediaRes.materi.e,
        onTap: () {
          pageState = EnumMateriState.mengenalHurufContent;
          modelMengenalHuruf = listMengenalHuruf()[4];
          update();
        },
      ),
      MengenalModel(
        title: "F",
        subtitle: "Foto",
        audio: MediaRes.audio.huruf.f,
        image: MediaRes.materi.f,
        onTap: () {
          pageState = EnumMateriState.mengenalHurufContent;
          modelMengenalHuruf = listMengenalHuruf()[5];
          update();
        },
      ),
      MengenalModel(
        title: "G",
        subtitle: "Gajah",
        audio: MediaRes.audio.huruf.g,
        image: MediaRes.materi.g,
        onTap: () {
          pageState = EnumMateriState.mengenalHurufContent;
          modelMengenalHuruf = listMengenalHuruf()[6];
          update();
        },
      ),
      MengenalModel(
        title: "H",
        subtitle: "Harimau",
        audio: MediaRes.audio.huruf.h,
        image: MediaRes.materi.h,
        onTap: () {
          pageState = EnumMateriState.mengenalHurufContent;
          modelMengenalHuruf = listMengenalHuruf()[7];
          update();
        },
      ),
      MengenalModel(
        title: "I",
        subtitle: "Ikan",
        audio: MediaRes.audio.huruf.i,
        image: MediaRes.materi.i,
        onTap: () {
          pageState = EnumMateriState.mengenalHurufContent;
          modelMengenalHuruf = listMengenalHuruf()[8];
          update();
        },
      ),
      MengenalModel(
        title: "J",
        subtitle: "Jagung",
        audio: MediaRes.audio.huruf.j,
        image: MediaRes.materi.j,
        onTap: () {
          pageState = EnumMateriState.mengenalHurufContent;
          modelMengenalHuruf = listMengenalHuruf()[9];
          update();
        },
      ),
      MengenalModel(
        title: "K",
        subtitle: "Kelinci",
        audio: MediaRes.audio.huruf.k,
        image: MediaRes.materi.k,
        onTap: () {
          pageState = EnumMateriState.mengenalHurufContent;
          modelMengenalHuruf = listMengenalHuruf()[10];
          update();
        },
      ),
      MengenalModel(
        title: "L",
        subtitle: "Lampu",
        audio: MediaRes.audio.huruf.l,
        image: MediaRes.materi.l,
        onTap: () {
          pageState = EnumMateriState.mengenalHurufContent;
          modelMengenalHuruf = listMengenalHuruf()[11];
          update();
        },
      ),
      MengenalModel(
        title: "M",
        subtitle: "Motor",
        audio: MediaRes.audio.huruf.m,
        image: MediaRes.materi.m,
        onTap: () {
          pageState = EnumMateriState.mengenalHurufContent;
          modelMengenalHuruf = listMengenalHuruf()[12];
          update();
        },
      ),
      MengenalModel(
        title: "N",
        subtitle: "Nanas",
        audio: MediaRes.audio.huruf.n,
        image: MediaRes.materi.n,
        onTap: () {
          pageState = EnumMateriState.mengenalHurufContent;
          modelMengenalHuruf = listMengenalHuruf()[13];
          update();
        },
      ),
      MengenalModel(
        title: "O",
        subtitle: "Obat",
        audio: MediaRes.audio.huruf.o,
        image: MediaRes.materi.o,
        onTap: () {
          pageState = EnumMateriState.mengenalHurufContent;
          modelMengenalHuruf = listMengenalHuruf()[14];
          update();
        },
      ),
      MengenalModel(
        title: "P",
        subtitle: "Payung",
        audio: MediaRes.audio.huruf.p,
        image: MediaRes.materi.p,
        onTap: () {
          pageState = EnumMateriState.mengenalHurufContent;
          modelMengenalHuruf = listMengenalHuruf()[15];
          update();
        },
      ),
      MengenalModel(
        title: "Q",
        subtitle: "Qur'an",
        audio: MediaRes.audio.huruf.q,
        image: MediaRes.materi.q,
        onTap: () {
          pageState = EnumMateriState.mengenalHurufContent;
          modelMengenalHuruf = listMengenalHuruf()[16];
          update();
        },
      ),
      MengenalModel(
        title: "R",
        subtitle: "Rusa",
        audio: MediaRes.audio.huruf.r,
        image: MediaRes.materi.r,
        onTap: () {
          pageState = EnumMateriState.mengenalHurufContent;
          modelMengenalHuruf = listMengenalHuruf()[17];
          update();
        },
      ),
      MengenalModel(
        title: "S",
        subtitle: "Sapi",
        audio: MediaRes.audio.huruf.s,
        image: MediaRes.materi.s,
        onTap: () {
          pageState = EnumMateriState.mengenalHurufContent;
          modelMengenalHuruf = listMengenalHuruf()[18];
          update();
        },
      ),
      MengenalModel(
        title: "T",
        subtitle: "Telur",
        audio: MediaRes.audio.huruf.t,
        image: MediaRes.materi.t,
        onTap: () {
          pageState = EnumMateriState.mengenalHurufContent;
          modelMengenalHuruf = listMengenalHuruf()[19];
          update();
        },
      ),
      MengenalModel(
        title: "U",
        subtitle: "Ular",
        audio: MediaRes.audio.huruf.u,
        image: MediaRes.materi.u,
        onTap: () {
          pageState = EnumMateriState.mengenalHurufContent;
          modelMengenalHuruf = listMengenalHuruf()[20];
          update();
        },
      ),
      MengenalModel(
        title: "V",
        subtitle: "Vas",
        audio: MediaRes.audio.huruf.v,
        image: MediaRes.materi.v,
        onTap: () {
          pageState = EnumMateriState.mengenalHurufContent;
          modelMengenalHuruf = listMengenalHuruf()[21];
          update();
        },
      ),
      MengenalModel(
        title: "W",
        subtitle: "Wortel",
        audio: MediaRes.audio.huruf.w,
        image: MediaRes.materi.w,
        onTap: () {
          pageState = EnumMateriState.mengenalHurufContent;
          modelMengenalHuruf = listMengenalHuruf()[22];
          update();
        },
      ),
      MengenalModel(
        title: "X",
        subtitle: "Xilofon",
        audio: MediaRes.audio.huruf.x,
        image: MediaRes.materi.x,
        onTap: () {
          pageState = EnumMateriState.mengenalHurufContent;
          modelMengenalHuruf = listMengenalHuruf()[23];
          update();
        },
      ),
      MengenalModel(
        title: "Y",
        subtitle: "Yoyo",
        audio: MediaRes.audio.huruf.y,
        image: MediaRes.materi.y,
        onTap: () {
          pageState = EnumMateriState.mengenalHurufContent;
          modelMengenalHuruf = listMengenalHuruf()[24];
          update();
        },
      ),
      MengenalModel(
        title: "Z",
        subtitle: "Zebra",
        audio: MediaRes.audio.huruf.z,
        image: MediaRes.materi.z,
        onTap: () {
          pageState = EnumMateriState.mengenalHurufContent;
          modelMengenalHuruf = listMengenalHuruf()[25];
          update();
        },
      ),
    ];
  }

  void nextMengenalHuruf() {
    int currentIndex =
        listMengenalHuruf().indexWhere((element) => element.title == modelMengenalHuruf.title);

    if (currentIndex != -1 && currentIndex < listMengenalHuruf().length - 1) {
      modelMengenalHuruf = listMengenalHuruf()[currentIndex + 1];
      update();
    }
  }

  void backMengenalHuruf() {
    int currentIndex =
        listMengenalHuruf().indexWhere((element) => element.title == modelMengenalHuruf.title);
    if (currentIndex > 0) {
      modelMengenalHuruf = listMengenalHuruf()[currentIndex - 1];
      update();
    }
  }
  //End Mengenal Huruf

  changePageState(EnumMateriState state) {
    pageState = state;
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
