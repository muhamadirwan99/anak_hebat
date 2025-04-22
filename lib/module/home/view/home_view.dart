import 'package:flutter/material.dart';
import 'package:anak_hebat/core.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  Widget build(context, HomeController controller) {
    controller.view = this;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(MediaRes.background.outside),
            fit: BoxFit.fill,
          ),
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
            minWidth: MediaQuery.of(context).size.width,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(left: 110),
                      child: Image.asset(
                        MediaRes.logo.logo,
                        height: 200,
                        width: 200,
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: InkWell(
                        onTap: () {
                          controller.isSoundPlay = !controller.isSoundPlay;
                          controller.update();
                        },
                        child: SvgPicture.asset(
                          controller.isSoundPlay
                              ? MediaRes.button.speakerOff
                              : MediaRes.button.speakerOn,
                          width: 50,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 108,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        showDialogBase(
                          maxWidth: 700,
                          barrierDismissible: true,
                          content: const DialogPilihBelajar(),
                        );
                      },
                      child: Image.asset(
                        MediaRes.button.belajar,
                      ),
                    ),
                    const SizedBox(
                      width: 100,
                    ),
                    InkWell(
                      onTap: () {
                        showDialogBase(
                          maxWidth: 700,
                          barrierDismissible: true,
                          content: const DialogPilihQuiz(),
                        );
                      },
                      child: Image.asset(
                        MediaRes.button.quiz,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  State<HomeView> createState() => HomeController();
}
