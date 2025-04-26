import 'package:flutter/material.dart';
import 'package:anak_hebat/core.dart';

class MateriController extends State<MateriView> {
  static late MateriController instance;
  late MateriView view;

  late EnumPageState pageState;
  ContainerDataModel model = ContainerDataModel(
    title: "",
    subtitle: "",
    audio: "",
    onTap: () {},
  );

  //Mengenal Angka
  List<ContainerDataModel> listAngka() {
    return [
      ContainerDataModel(
        title: "0",
        subtitle: "Nol",
        audio: MediaRes.music.angka.nol,
        onTap: () {
          pageState = EnumPageState.mengenalAngkaContent;
          model = listAngka()[0];
          update();
        },
      ),
      ContainerDataModel(
        title: "1",
        subtitle: "Satu",
        audio: MediaRes.music.angka.satu,
        onTap: () {
          pageState = EnumPageState.mengenalAngkaContent;
          model = listAngka()[1];
          update();
        },
      ),
      ContainerDataModel(
        title: "2",
        subtitle: "Dua",
        audio: MediaRes.music.angka.dua,
        onTap: () {
          pageState = EnumPageState.mengenalAngkaContent;
          model = listAngka()[2];
          update();
        },
      ),
      ContainerDataModel(
        title: "3",
        subtitle: "Tiga",
        audio: MediaRes.music.angka.tiga,
        onTap: () {
          pageState = EnumPageState.mengenalAngkaContent;
          model = listAngka()[3];
          update();
        },
      ),
      ContainerDataModel(
        title: "4",
        subtitle: "Empat",
        audio: MediaRes.music.angka.empat,
        onTap: () {
          pageState = EnumPageState.mengenalAngkaContent;
          model = listAngka()[4];
          update();
        },
      ),
      ContainerDataModel(
        title: "5",
        subtitle: "Lima",
        audio: MediaRes.music.angka.lima,
        onTap: () {
          pageState = EnumPageState.mengenalAngkaContent;
          model = listAngka()[5];
          update();
        },
      ),
      ContainerDataModel(
        title: "6",
        subtitle: "Enam",
        audio: MediaRes.music.angka.enam,
        onTap: () {
          pageState = EnumPageState.mengenalAngkaContent;
          model = listAngka()[6];
          update();
        },
      ),
      ContainerDataModel(
        title: "7",
        subtitle: "Tujuh",
        audio: MediaRes.music.angka.tujuh,
        onTap: () {
          pageState = EnumPageState.mengenalAngkaContent;
          model = listAngka()[7];
          update();
        },
      ),
      ContainerDataModel(
        title: "8",
        subtitle: "Delapan",
        audio: MediaRes.music.angka.delapan,
        onTap: () {
          pageState = EnumPageState.mengenalAngkaContent;
          model = listAngka()[8];
          update();
        },
      ),
      ContainerDataModel(
        title: "9",
        subtitle: "Sembilan",
        audio: MediaRes.music.angka.sembilan,
        onTap: () {
          pageState = EnumPageState.mengenalAngkaContent;
          model = listAngka()[9];
          update();
        },
      ),
    ];
  }

  void nextAngka() {
    int currentIndex = listAngka().indexWhere((element) => element.title == model.title);

    if (currentIndex != -1 && currentIndex < listAngka().length - 1) {
      model = listAngka()[currentIndex + 1];
      update();
    }
  }

  void backAngka() {
    int currentIndex = listAngka().indexWhere((element) => element.title == model.title);
    if (currentIndex > 0) {
      model = listAngka()[currentIndex - 1];
      update();
    }
  }
  //End Mengenal Angka

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
