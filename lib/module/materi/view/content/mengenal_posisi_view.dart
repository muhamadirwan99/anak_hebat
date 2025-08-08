import 'package:anak_hebat/core.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class MengenalPosisiView extends StatefulWidget {
  final MateriController controller;

  const MengenalPosisiView({
    super.key,
    required this.controller,
  });

  @override
  State<MengenalPosisiView> createState() => MengenalPosisiState();
}

enum SoalType { atasMeja, bawahMeja }

class MengenalPosisiState extends State<MengenalPosisiView> {
  List<bool> applesOnTable = [false, false]; // Track which apples are on table
  int applesDropped = 0; // Count how many apples are dropped
  SoalType currentSoal = SoalType.atasMeja; // Track which question is active

  // Constants
  static const double appleSize = 200.0;
  static const double dropTargetHeight = 215.0;
  static const double dropTargetWidthLarge = 620.0;
  static const double dropTargetWidthSmall = 400.0;

  @override
  void initState() {
    super.initState();
    // widget.controller.playSoundsSequentially([
    //   MediaRes.audio.numerasi.mengenalPosisi.mengenalPosisi,
    //   MediaRes.audio.numerasi.mengenalPosisi.atasMeja,
    // ]);
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  SoundUtils.playSoundWithoutWaiting(MediaRes.audio.click);
                  widget.controller.changePageState(EnumMateriState.ayoBelajar);
                },
                child: SvgPicture.asset(
                  MediaRes.button.back,
                  width: 100,
                  height: 100,
                ),
              ),
              const Spacer(),
              Text(
                "Mengenal Posisi",
                style: GoogleFonts.balsamiqSans(
                  fontSize: 90,
                  fontWeight: FontWeight.bold,
                  color: gray900,
                ),
              ),
              const Spacer(),
            ],
          ),
          const SizedBox(
            height: 17.0,
          ),
          _buildSoalWidget(),
        ],
      ),
    );
  }

  Widget _buildSoalWidget() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 216.0),
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(16.0),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildInstructionText(),
              _buildGameArea(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInstructionText() {
    final soalConfig = _getSoalConfig();
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Container(
        decoration: const BoxDecoration(
          color: green50,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        padding: const EdgeInsets.all(30),
        child: Text(
          soalConfig.instruction,
          textAlign: TextAlign.center,
          style: GoogleFonts.balsamiqSans(
            fontSize: 74,
            fontWeight: FontWeight.bold,
            color: gray900,
          ),
        ),
      ),
    );
  }

  Widget _buildGameArea() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Align(
          alignment: Alignment.bottomRight,
          child: Image.asset(
            MediaRes.images.meja,
            height: 484,
          ),
        ),
        _buildDropTarget(),
        _buildArrow(),
        _buildAppleArea(),
      ],
    );
  }

  Widget _buildDropTarget() {
    final soalConfig = _getSoalConfig();
    return Positioned(
      right: soalConfig.dropTargetRight,
      top: soalConfig.dropTargetTop,
      bottom: soalConfig.dropTargetBottom,
      child: DragTarget<int>(
        onWillAcceptWithDetails: (details) => !applesOnTable[details.data - 1],
        onAcceptWithDetails: (details) {
          setState(() {
            applesOnTable[details.data - 1] = true;
            applesDropped++;
          });

          SoundUtils.playSoundWithoutWaiting(MediaRes.audio.click);

          if (applesDropped == 2) {
            _handleSoalComplete();
          }
        },
        builder: (context, candidateData, rejectedData) {
          return DottedBorder(
            color: candidateData.isNotEmpty ? Colors.green : red900,
            strokeWidth: 10,
            dashPattern: const [20, 20],
            borderType: BorderType.RRect,
            radius: const Radius.circular(12),
            child: Container(
              height: dropTargetHeight,
              width: soalConfig.dropTargetWidth,
              color: candidateData.isNotEmpty ? Colors.green.withOpacity(0.1) : Colors.transparent,
              alignment: Alignment.center,
              child: _buildDroppedApples(),
            ),
          );
        },
      ),
    );
  }

  Widget _buildDroppedApples() {
    if (applesDropped == 0) return const SizedBox.shrink();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (applesOnTable[0])
          Image.asset(
            MediaRes.materi.a,
            width: 150,
            height: 150,
          ),
        if (applesOnTable[0] && applesOnTable[1]) const SizedBox(width: 20),
        if (applesOnTable[1])
          Image.asset(
            MediaRes.materi.a,
            width: 150,
            height: 150,
          ),
      ],
    );
  }

  Widget _buildArrow() {
    final soalConfig = _getSoalConfig();
    Widget arrow = SvgPicture.asset(MediaRes.images.arrow);

    if (soalConfig.flipArrow) {
      arrow = Transform.scale(
        scaleY: -1,
        child: arrow,
      );
    }

    return Positioned(
      left: soalConfig.arrowLeft,
      top: soalConfig.arrowTop,
      bottom: soalConfig.arrowBottom,
      child: arrow,
    );
  }

  Widget _buildAppleArea() {
    return Positioned(
      bottom: 53,
      left: 78,
      child: Row(
        children: [
          _buildDraggableApple(1),
          const SizedBox(width: 50),
          _buildDraggableApple(2),
        ],
      ),
    );
  }

  SoalConfig _getSoalConfig() {
    switch (currentSoal) {
      case SoalType.atasMeja:
        return SoalConfig(
          instruction: "Pindahkan 2 buah\napel ke atas meja",
          dropTargetRight: 60,
          dropTargetTop: -100,
          dropTargetBottom: null,
          dropTargetWidth: dropTargetWidthLarge,
          arrowLeft: 400,
          arrowTop: 0,
          arrowBottom: null,
          flipArrow: false,
          isLast: false,
        );
      case SoalType.bawahMeja:
        return SoalConfig(
          instruction: "Pindahkan 2 buah\napel ke bawah meja",
          dropTargetRight: 150,
          dropTargetTop: null,
          dropTargetBottom: 80,
          dropTargetWidth: dropTargetWidthSmall,
          arrowLeft: 600,
          arrowTop: null,
          arrowBottom: 90,
          flipArrow: true,
          isLast: true,
        );
    }
  }

  void _handleSoalComplete() {
    final soalConfig = _getSoalConfig();
    showDialogBase(
      content: DialogHasilJawaban(
        isCorrect: true,
        isLast: soalConfig.isLast,
        onPressed: () {
          if (soalConfig.isLast) {
            Get.back();
            SoundUtils.playSoundWithoutWaiting(MediaRes.audio.click);
            widget.controller.changePageState(EnumMateriState.ayoBelajar);
          } else {
            _moveToNextSoal();
            Get.back();
          }
        },
      ),
    );
  }

  void _moveToNextSoal() {
    setState(() {
      currentSoal = SoalType.bawahMeja;
      applesOnTable = [false, false];
      applesDropped = 0;
    });
    SoundUtils.playSoundWithoutWaiting(MediaRes.audio.click);
  }

  Widget _buildDraggableApple(int appleIndex) {
    if (applesOnTable[appleIndex - 1]) {
      // If apple is already on table, show empty space
      return Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey.shade100,
        ),
        child: const Icon(
          Icons.check,
          color: Colors.green,
          size: 200,
        ),
      );
    }

    return Draggable<int>(
      data: appleIndex,
      feedback: _buildAppleWidget(appleIndex, isDragging: true),
      childWhenDragging: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey.shade100,
        ),
      ),
      child: _buildAppleWidget(appleIndex),
    );
  }

  Widget _buildAppleWidget(int appleIndex, {bool isDragging = false}) {
    return Center(
      child: Image.asset(
        MediaRes.materi.a, // Assuming you have an apple SVG asset
        width: isDragging ? 200 : 200,
        height: isDragging ? 200 : 200,
      ),
    );
  }
}

class MengenalPosisiModel {
  final int level;
  final String image, sound;

  MengenalPosisiModel({
    required this.level,
    required this.image,
    required this.sound,
  });
}

class SoalConfig {
  final String instruction;
  final double dropTargetRight;
  final double? dropTargetTop;
  final double? dropTargetBottom;
  final double dropTargetWidth;
  final double arrowLeft;
  final double? arrowTop;
  final double? arrowBottom;
  final bool flipArrow;
  final bool isLast;

  SoalConfig({
    required this.instruction,
    required this.dropTargetRight,
    this.dropTargetTop,
    this.dropTargetBottom,
    required this.dropTargetWidth,
    required this.arrowLeft,
    this.arrowTop,
    this.arrowBottom,
    required this.flipArrow,
    required this.isLast,
  });
}
