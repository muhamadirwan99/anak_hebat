import 'package:flutter/material.dart';
import 'package:anak_hebat/core.dart';

class MateriView extends StatefulWidget {
  final EnumPageState pageState;

  const MateriView({
    super.key,
    required this.pageState,
  });

  Widget build(context, MateriController controller) {
    controller.view = this;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(MediaRes.background.kelas),
            fit: BoxFit.fitHeight,
          ),
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
            minWidth: MediaQuery.of(context).size.width,
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 40,
                horizontal: 30,
              ),
              child: Builder(
                builder: (context) {
                  switch (controller.pageState) {
                    case EnumPageState.ayoBelajar:
                      return const AyoBelajarView();
                    case EnumPageState.mengenalAngka:
                      return const MengenalAngkaView();
                    case EnumPageState.mengenalAngkaContent:
                      return const MengenalAngkaContentView();
                    case EnumPageState.mengenalHuruf:
                      return const MengenalHurufView();
                    case EnumPageState.mengenalHurufContent:
                      return const MengenalHurufContentView();
                    case EnumPageState.menghitung:
                      return const MenghitungView();
                    case EnumPageState.pilihLevel:
                      return const PilihLevelView();
                    default:
                      return Container();
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  State<MateriView> createState() => MateriController();
}
