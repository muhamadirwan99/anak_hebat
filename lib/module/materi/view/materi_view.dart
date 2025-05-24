import 'package:flutter/material.dart';
import 'package:anak_hebat/core.dart';

class MateriView extends StatefulWidget {
  final EnumMateriState pageState;

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
            image: AssetImage(controller.background),
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
                    case EnumMateriState.ayoBelajar:
                      return AyoBelajarView(
                        controller: controller,
                      );
                    case EnumMateriState.mengenalAngka:
                      return MengenalAngkaView(
                        controller: controller,
                      );
                    case EnumMateriState.mengenalAngkaContent:
                      return MengenalAngkaContentView(
                        controller: controller,
                      );
                    case EnumMateriState.mengenalHuruf:
                      return MengenalHurufView(
                        controller: controller,
                      );
                    case EnumMateriState.mengenalHurufContent:
                      return MengenalHurufContentView(
                        controller: controller,
                      );
                    case EnumMateriState.menghitung:
                      return MenghitungView(
                        controller: controller,
                      );
                    case EnumMateriState.pilihLevel:
                      return PilihLevelView(
                        controller: controller,
                      );
                    case EnumMateriState.levelMencocokanAngka:
                      return LevelMencocokanAngkaView(
                        controller: controller,
                      );
                    case EnumMateriState.mencocokanAngka:
                      return MencocokanAngkaView(
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
