import 'package:flame_audio/flame_audio.dart';
import 'package:google_fonts/google_fonts.dart';
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
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(50),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          16,
                        ),
                      ),
                    ),
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            SoundUtils.playSoundWithoutWaiting(MediaRes.audio.click);
                          },
                          child: Text(
                            "Beranda",
                            style: GoogleFonts.roboto(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: yellow900,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 24.0,
                        ),
                        InkWell(
                          onTap: () async {
                            await SoundUtils.playSoundWithoutWaiting(MediaRes.audio.click);
                            await SoundUtils.stopSound();
                            await FlameAudio.bgm.pause();

                            newRouter.go(RouterUtils.panduan);
                          },
                          child: Text(
                            "Panduan",
                            style: GoogleFonts.roboto(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: yellow900,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 24.0,
                        ),
                        InkWell(
                          onTap: () async {
                            await SoundUtils.playSoundWithoutWaiting(MediaRes.audio.click);
                            await SoundUtils.stopSound();
                            await FlameAudio.bgm.pause();

                            newRouter.go(RouterUtils.credit);
                          },
                          child: Text(
                            "Kreator",
                            style: GoogleFonts.roboto(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: yellow900,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 24.0,
                        ),
                        InkWell(
                          onTap: () async {
                            await SoundUtils.playSoundWithoutWaiting(MediaRes.audio.click);
                            await SoundUtils.stopSound();
                            await FlameAudio.bgm.pause();

                            newRouter.go(RouterUtils.leaderboard);
                          },
                          child: Text(
                            "Peringkat",
                            style: GoogleFonts.roboto(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: yellow900,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    Image.asset(
                      MediaRes.logo.logo,
                      height: 200,
                      width: 200,
                    ),
                    const SizedBox(
                      height: 108,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            SoundUtils.playSoundWithoutWaiting(MediaRes.audio.click);
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
                            SoundUtils.playSoundWithoutWaiting(MediaRes.audio.click);
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
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          SoundUtils.playSoundWithoutWaiting(MediaRes.audio.click);
                          controller.toggleMute();
                        },
                        child: SvgPicture.asset(
                          controller.isSoundPlay
                              ? MediaRes.button.speakerOff
                              : MediaRes.button.speakerOn,
                          width: 50,
                        ),
                      ),
                      const SizedBox(
                        width: 16.0,
                      ),
                      InkWell(
                        onTap: () {
                          SoundUtils.playSoundWithoutWaiting(MediaRes.audio.click);
                          controller.logout();
                        },
                        child: SvgPicture.asset(
                          MediaRes.button.keluar,
                          width: 50,
                        ),
                      ),
                    ],
                  ),
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
