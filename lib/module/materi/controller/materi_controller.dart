import 'package:flutter/material.dart';
import 'package:anak_hebat/core.dart';

class MateriController extends State<MateriView> {
  static late MateriController instance;
  late MateriView view;

  late EnumPageState pageState;

  //Mengenal Angka
  MengenalAngkaModel modelMengenalAngka = MengenalAngkaModel(
    title: "",
    subtitle: "",
    audio: "",
    onTap: () {},
  );

  List<MengenalAngkaModel> listMengenalAngka() {
    return [
      MengenalAngkaModel(
        title: "0",
        subtitle: "Nol",
        audio: MediaRes.audio.angka.nol,
        onTap: () {
          pageState = EnumPageState.mengenalAngkaContent;
          modelMengenalAngka = listMengenalAngka()[0];
          update();
        },
      ),
      MengenalAngkaModel(
        title: "1",
        subtitle: "Satu",
        audio: MediaRes.audio.angka.satu,
        onTap: () {
          pageState = EnumPageState.mengenalAngkaContent;
          modelMengenalAngka = listMengenalAngka()[1];
          update();
        },
      ),
      MengenalAngkaModel(
        title: "2",
        subtitle: "Dua",
        audio: MediaRes.audio.angka.dua,
        onTap: () {
          pageState = EnumPageState.mengenalAngkaContent;
          modelMengenalAngka = listMengenalAngka()[2];
          update();
        },
      ),
      MengenalAngkaModel(
        title: "3",
        subtitle: "Tiga",
        audio: MediaRes.audio.angka.tiga,
        onTap: () {
          pageState = EnumPageState.mengenalAngkaContent;
          modelMengenalAngka = listMengenalAngka()[3];
          update();
        },
      ),
      MengenalAngkaModel(
        title: "4",
        subtitle: "Empat",
        audio: MediaRes.audio.angka.empat,
        onTap: () {
          pageState = EnumPageState.mengenalAngkaContent;
          modelMengenalAngka = listMengenalAngka()[4];
          update();
        },
      ),
      MengenalAngkaModel(
        title: "5",
        subtitle: "Lima",
        audio: MediaRes.audio.angka.lima,
        onTap: () {
          pageState = EnumPageState.mengenalAngkaContent;
          modelMengenalAngka = listMengenalAngka()[5];
          update();
        },
      ),
      MengenalAngkaModel(
        title: "6",
        subtitle: "Enam",
        audio: MediaRes.audio.angka.enam,
        onTap: () {
          pageState = EnumPageState.mengenalAngkaContent;
          modelMengenalAngka = listMengenalAngka()[6];
          update();
        },
      ),
      MengenalAngkaModel(
        title: "7",
        subtitle: "Tujuh",
        audio: MediaRes.audio.angka.tujuh,
        onTap: () {
          pageState = EnumPageState.mengenalAngkaContent;
          modelMengenalAngka = listMengenalAngka()[7];
          update();
        },
      ),
      MengenalAngkaModel(
        title: "8",
        subtitle: "Delapan",
        audio: MediaRes.audio.angka.delapan,
        onTap: () {
          pageState = EnumPageState.mengenalAngkaContent;
          modelMengenalAngka = listMengenalAngka()[8];
          update();
        },
      ),
      MengenalAngkaModel(
        title: "9",
        subtitle: "Sembilan",
        audio: MediaRes.audio.angka.sembilan,
        onTap: () {
          pageState = EnumPageState.mengenalAngkaContent;
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
          pageState = EnumPageState.menghitung;
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
          pageState = EnumPageState.menghitung;
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
          pageState = EnumPageState.menghitung;
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
          pageState = EnumPageState.menghitung;
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
          pageState = EnumPageState.menghitung;
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
        pageState = EnumPageState.pilihLevel;
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

  changePageState(EnumPageState state) {
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
