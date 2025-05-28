import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:anak_hebat/core.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

class LeaderboardView extends StatefulWidget {
  const LeaderboardView({super.key});

  Widget build(context, LeaderboardController controller) {
    controller.view = this;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(MediaRes.background.leaderboard),
            fit: BoxFit.fill,
          ),
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
            minWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 85, vertical: 40),
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () async {
                        await SoundUtils.stopSound();
                        SoundUtils.playSoundWithoutWaiting(MediaRes.audio.click);
                        newRouter.go(RouterUtils.home);
                      },
                      child: SvgPicture.asset(
                        MediaRes.button.back,
                        height: 100,
                        width: 100,
                      ),
                    ),
                    const Spacer(),
                    SvgPicture.asset(
                      MediaRes.images.leaderboard,
                      height: 100,
                    ),
                    const Spacer(),
                  ],
                ),
                const SizedBox(
                  height: 32.0,
                ),
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: const Color(0xffFCEED7),
                      border: Border.all(
                        color: const Color(0xff924B25),
                        width: 16,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          46,
                        ),
                      ),
                    ),
                    child: Column(
                      children: [
                        _header(),
                        Expanded(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                            ),
                            child: ListView.builder(
                                itemCount: controller.leaderboardList.length,
                                itemBuilder: (context, index) {
                                  final item = controller.leaderboardList[index];
                                  final currentUserId = FirebaseAuth.instance.currentUser?.uid;
                                  final isSelectedUser = item.idUser == currentUserId;

                                  return _content(
                                    index: index,
                                    name: item.name,
                                    literasi: item.literasi.isEmpty ? "0" : item.literasi,
                                    numerasi: item.numerasi.isEmpty ? "0" : item.numerasi,
                                    rataRata: item.rataRata.toString(),
                                    isSelectedUser: isSelectedUser,
                                  );
                                }),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _header() {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        border: Border(
          bottom: BorderSide(
            color: Color(0xff924B25),
            width: 16,
          ),
        ),
        color: Color(0xffE9D3A4),
      ),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: Row(
        children: [
          const SizedBox(
            width: 50,
            height: 50,
          ),
          const SizedBox(
            width: 40.0,
          ),
          SizedBox(
            width: 70,
            child: Text(
              "No.",
              style: GoogleFonts.inter(
                fontSize: 32,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(
            width: 40.0,
          ),
          Expanded(
            child: Text(
              "Nama",
              style: GoogleFonts.inter(
                fontSize: 32,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(
            width: 40.0,
          ),
          SizedBox(
            width: 250,
            child: Text(
              "Literasi",
              style: GoogleFonts.inter(
                fontSize: 32,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            width: 40.0,
          ),
          SizedBox(
            width: 250,
            child: Text(
              "Numerasi",
              style: GoogleFonts.inter(
                fontSize: 32,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            width: 40.0,
          ),
          SizedBox(
            width: 250,
            child: Text(
              "Rata-rata",
              style: GoogleFonts.inter(
                fontSize: 32,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _content({
    required int index,
    required String name,
    required String literasi,
    required String numerasi,
    required String rataRata,
    bool isSelectedUser = false,
  }) {
    Color color = index % 2 == 0 ? const Color(0xffF9E7CA) : const Color(0xffFCEED7);
    Color textColor = const Color(0xff000000);
    Widget image = Container(
      width: 50,
    );
    if (index == 0) {
      image = SvgPicture.asset(MediaRes.images.gold, height: 50, width: 50);
    } else if (index == 1) {
      image = SvgPicture.asset(MediaRes.images.silver, height: 50, width: 50);
    } else if (index == 2) {
      image = SvgPicture.asset(MediaRes.images.bronze, height: 50, width: 50);
    }

    Gradient? gradient;

    if (isSelectedUser) {
      gradient = const LinearGradient(
        colors: [
          Color(0xFFD66B11),
          Color(0xFF932C11),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );
      textColor = const Color(0xffF8E7CA);
    }

    return Container(
      decoration: BoxDecoration(
          gradient: gradient,
          color: color,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          )),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      child: Row(
        children: [
          image,
          const SizedBox(
            width: 40.0,
          ),
          SizedBox(
            width: 70,
            child: Text(
              "${index + 1}",
              style: GoogleFonts.inter(
                fontSize: 32,
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(
            width: 40.0,
          ),
          Expanded(
            child: Text(
              name,
              style: GoogleFonts.inter(
                fontSize: 32,
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(
            width: 40.0,
          ),
          SizedBox(
            width: 250,
            child: Text(
              literasi,
              style: GoogleFonts.inter(
                fontSize: 32,
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            width: 40.0,
          ),
          SizedBox(
            width: 250,
            child: Text(
              numerasi,
              style: GoogleFonts.inter(
                fontSize: 32,
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            width: 40.0,
          ),
          SizedBox(
            width: 250,
            child: Text(
              rataRata,
              style: GoogleFonts.inter(
                fontSize: 32,
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  @override
  State<LeaderboardView> createState() => LeaderboardController();
}
