import 'package:flutter/material.dart';
import 'package:anak_hebat/core.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                          children: controller.listPanduan,
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
