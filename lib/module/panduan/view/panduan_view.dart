import 'package:flutter/material.dart';
import 'package:anak_hebat/core.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class PanduanView extends StatefulWidget {
  const PanduanView({super.key});

  Widget build(context, PanduanController controller) {
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
                // Header with back button and title
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
                      MediaRes.images.panduan,
                      height: 100,
                    ),
                    const Spacer(),
                  ],
                ),
                const SizedBox(height: 30),

                // Content area with guide sections
                Expanded(
                  child: Container(
                    width: 1454,
                    height: 760,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFECB2),
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(
                        color: yellow800,
                        width: 16,
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(32),
                        child: Column(
                          children: [
                            // Belajar Huruf Section
                            PanduanSection(
                              title: 'Belajar Huruf',
                              isExpanded: controller.isHurufExpanded,
                              onTap: () => controller.toggleHurufSection(),
                              content: const [
                                '1. Klik tombol "Ayo Belajar!"',
                                '2. Pilih Materi Literasi',
                                '3. Klik huruf dari A–Z.',
                                '4. Setiap huruf dilengkapi gambar dan suara.',
                                '5. Gunakan tombol "Panah" untuk berpindah huruf.',
                              ],
                            ),
                            const SizedBox(height: 20),

                            // Belajar Numerasi Section
                            PanduanSection(
                              title: 'Belajar Numerasi',
                              isExpanded: controller.isNumerasiExpanded,
                              onTap: () => controller.toggleNumerasiSection(),
                              content: const [
                                '1. Klik tombol "Ayo Belajar!"',
                                '2. Pilih Materi Numerasi',
                                '3. Klik angka dari 0–10.',
                                '4. Lihat animasi dan jumlah benda sesuai angka.',
                                '5. Pelajari juga:',
                                '   a. Bentuk (lingkaran, segitiga, dll)',
                                '   b. Pola',
                                '   c. Posisi (di atas, di bawah, dsb)',
                              ],
                            ),
                            const SizedBox(height: 20),

                            // Ikuti Quiz Section
                            PanduanSection(
                              title: 'Ikuti Quiz',
                              isExpanded: controller.isQuizExpanded,
                              onTap: () => controller.toggleQuizSection(),
                              content: const [
                                '1. Klik tombol "Ayo Quiz!"',
                                '2. Jawab pertanyaan tentang angka, bentuk, dan huruf.',
                                '3. Pilih jawaban yang benar.',
                                '4. Hasil akan langsung muncul setelah selesai.',
                              ],
                            ),
                            const SizedBox(height: 20),

                            // Lihat Peringkat Section
                            PanduanSection(
                              title: 'Lihat Peringkat',
                              isExpanded: controller.isLeaderboardExpanded,
                              onTap: () => controller.toggleLeaderboardSection(),
                              content: const [
                                '1. Klik menu Leaderboard.',
                                '2. Lihat nilai kamu dan teman-teman lainnya.',
                                '3. Semangat tingkatkan skor!',
                              ],
                            ),
                          ],
                        ),
                      ),
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

  @override
  State<PanduanView> createState() => PanduanController();
}

class PanduanSection extends StatelessWidget {
  final String title;
  final bool isExpanded;
  final VoidCallback onTap;
  final List<String> content;

  const PanduanSection({
    super.key,
    required this.title,
    required this.isExpanded,
    required this.onTap,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        color: yellow50,
        borderRadius: BorderRadius.circular(16),
        boxShadow: isExpanded
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ]
            : [],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              SoundUtils.playSoundWithoutWaiting(MediaRes.audio.click);
              onTap();
            },
            borderRadius: BorderRadius.circular(16),
            child: Container(
              padding: const EdgeInsets.all(24),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: GoogleFonts.balsamiqSans(
                        fontSize: 24,
                        color: gray900,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  AnimatedRotation(
                    duration: const Duration(milliseconds: 300),
                    turns: isExpanded ? 0.5 : 0,
                    child: const Icon(
                      Icons.keyboard_arrow_down,
                      size: 32,
                      color: Color(0xFF1C1B1F),
                    ),
                  ),
                ],
              ),
            ),
          ),
          AnimatedSize(
            duration: const Duration(milliseconds: 300),
            alignment: Alignment.centerLeft,
            curve: Curves.easeInOut,
            child: isExpanded
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: content.map((item) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              item,
                              style: GoogleFonts.balsamiqSans(
                                fontSize: 20,
                                color: gray900,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
