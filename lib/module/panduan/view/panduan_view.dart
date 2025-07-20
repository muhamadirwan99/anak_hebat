import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:anak_hebat/core.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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
            image: AssetImage(MediaRes.background.creditPolos),
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
                      MediaRes.images.panduan,
                      height: 100,
                    ),
                    const Spacer(),
                  ],
                ),
                const SizedBox(height: 30),

                // Content area with guide sections
                Expanded(
                  child: controller.selectedPanduan == null
                      ? _buildSelectPanduan(context, controller)
                      : _buildPanduanContent(context, controller),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPanduanContent(BuildContext context, PanduanController controller) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(24.0),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 25.0, sigmaY: 25.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.5),
            borderRadius: const BorderRadius.all(
              Radius.circular(24.0),
            ),
          ),
          padding: const EdgeInsets.all(24.0),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const Spacer(),
                    Text(
                      controller.title,
                      style: GoogleFonts.balsamiqSans(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '${controller.currentIndex + 1} / ${controller.currentPanduanImages.length}',
                      style: GoogleFonts.balsamiqSans(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                if (controller.currentImage.isNotEmpty)
                  Image.asset(
                    controller.currentImage,
                    height: 400,
                    fit: BoxFit.contain,
                  ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        SoundUtils.playSoundWithoutWaiting(MediaRes.audio.click);
                        controller.backPanduan();
                      },
                      child: SvgPicture.asset(
                        MediaRes.button.kembali,
                        width: 100,
                        height: 100,
                      ),
                    ),
                    const SizedBox(width: 100),
                    InkWell(
                      onTap: controller.currentIndex < controller.currentPanduanImages.length - 1
                          ? () {
                              SoundUtils.playSoundWithoutWaiting(MediaRes.audio.click);
                              controller.nextPanduan();
                            }
                          : null,
                      child: Opacity(
                        opacity:
                            controller.currentIndex < controller.currentPanduanImages.length - 1
                                ? 1.0
                                : 0.5,
                        child: Transform.rotate(
                          angle: 3.14159, // 180 degrees in radians
                          child: SvgPicture.asset(
                            MediaRes.button.kembali,
                            width: 100,
                            height: 100,
                          ),
                        ),
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

  _buildSelectPanduan(
    BuildContext context,
    PanduanController controller,
  ) {
    return Container(
      width: 1820,
      height: 830,
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
          padding: const EdgeInsets.all(40),
          child: StaggeredGrid.count(
            crossAxisCount: 2,
            mainAxisSpacing: 40,
            crossAxisSpacing: 40,
            children: controller.listPanduan(),
          ),
        ),
      ),
    );
  }

  @override
  State<PanduanView> createState() => PanduanController();
}
