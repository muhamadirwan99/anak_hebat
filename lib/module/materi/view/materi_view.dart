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
            fit: BoxFit.fill,
          ),
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
            minWidth: MediaQuery.of(context).size.width,
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Builder(
                builder: (context) {
                  switch (controller.pageState) {
                    case EnumPageState.ayoBelajar:
                      return AyoBelajarView(
                        controller: controller,
                      );
                    case EnumPageState.mengenalAngka:
                      return MengenalAngkaView(
                        controller: controller,
                      );
                    case EnumPageState.mengenalAngkaContent:
                      return MengenalAngkaContentView(
                        controller: controller,
                      );
                    case EnumPageState.mengenalHuruf:
                      return MengenalHurufView(
                        controller: controller,
                      );
                    case EnumPageState.mengenalHurufContent:
                      return MengenalHurufContentView(
                        controller: controller,
                      );
                    case EnumPageState.menghitung:
                      return MenghitungView(
                        controller: controller,
                      );
                    case EnumPageState.pilihLevel:
                      return PilihLevelView(
                        controller: controller,
                      );
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
