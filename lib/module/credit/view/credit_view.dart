import 'package:flutter/material.dart';
import 'package:anak_hebat/core.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CreditView extends StatefulWidget {
  const CreditView({super.key});

  Widget build(context, CreditController controller) {
    controller.view = this;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(MediaRes.background.credit),
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
                Align(
                  alignment: Alignment.topLeft,
                  child: InkWell(
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  State<CreditView> createState() => CreditController();
}
