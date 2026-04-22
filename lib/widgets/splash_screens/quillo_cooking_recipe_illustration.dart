import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quillo_app/utils/app_colors.dart';
import 'package:quillo_app/utils/app_images.dart';

class QuilloCookingIllustration extends StatelessWidget {
  const QuilloCookingIllustration({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 340,
        height: 340,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [

            // ── White rounded platform (toaster body) ──────
            Positioned(
              top: 133,
              left: 75,
              child: Container(
                width: 190,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFFFFFFFF),
                      Color(0xFFEEF0FF),
                    ],
                  ),
                  border: Border.all(
                    color: const Color(0xFFE0E3FF),
                    width: 1.39,
                  ),
                ),
              ),
            ),

            // ── Left side handle widget ─────────────────────
            Positioned(
              top: 177.61,
              left: 75.82,
              child: Container(
                width: 18.59,
                height: 55.77,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const RadialGradient(
                    colors: [
                      Color(0xFFFFFFFF),
                      Color(0xFFEEF0FF),
                    ],
                    center: Alignment.center,
                    radius: 1.0,
                  ),
                  border: Border.all(
                    color: const Color(0xFFE0E3FF),
                    width: 1.39,
                  ),
                ),
              ),
            ),

            // ── Right side handle widget ────────────────────
            Positioned(
              top: 177.61,
              left: 245.84,
              child: Container(
                width: 18.59,
                height: 55.77,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const RadialGradient(
                    colors: [
                      Color(0xFFFFFFFF),
                      Color(0xFFEEF0FF),
                    ],
                    center: Alignment.center,
                    radius: 1.0,
                  ),
                  border: Border.all(
                    color: const Color(0xFFE0E3FF),
                    width: 1.39,
                  ),
                ),
              ),
            ),

            // ── Layer 1: Sabse neeche (wide) ────────────────
            Positioned(
              top: 135,
              left: 106,
              child: Container(
                width: 115,
                height: 26.03,
                decoration: const BoxDecoration(
                  color: Color(0xFF5B52E8),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
              ),
            ),

            // ── Layer 2: Beech mein ─────────────────────────
            Positioned(
              top: 135,
              left: 115,
              child: Container(
                width: 102,
                height: 18.59,
                decoration: const BoxDecoration(
                  color: Color(0xFF818CF8),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),

            // ── Layer 3: Sabse upar ─────────────────────────
            Positioned(
              top: 126,
              left: 130,
              child: Container(
                width: 70,
                height: 26.03,
                decoration: const BoxDecoration(
                  color: Color(0xFF6366F1),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),

            // ── Character face (circle head) ───────────────
            Positioned(
              top: 75,
              left: 134,
              child: Container(
                width: 72,
                height: 72,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFFDDCB0),
                      Color(0xFFF5C48A),
                    ],
                  ),
                  shape: BoxShape.circle,
                ),
                child: Stack(
                  children: [
                    // Left Eyebrow
                    Positioned(
                      top: 18,
                      left: 18,
                      child: Transform.rotate(
                        angle: -0.2,
                        child: Image(image: AssetImage(AppImages.eyebro)),
                      ),
                    ),
                    // Right Eyebrow
                    Positioned(
                      top: 18,
                      right: 18,
                      child: Transform.rotate(
                        angle: 0.2,
                        child: Image(image: AssetImage(AppImages.eyebro)),
                      ),
                    ),
                    // Left Eye
                    Positioned(
                      top: 22,
                      left: 20,
                      child: _buildEye(),
                    ),
                    // Right Eye
                    Positioned(
                      top: 22,
                      right: 20,
                      child: _buildEye(),
                    ),
                    // Smile
                    Positioned(
                      top: 40,
                      left: 27,
                      child: Container(
                        width: 18,
                        height: 8,
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color(0xFFC07840),
                              width: 3,
                            ),
                          ),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ── AI MAGIC card (face ke upar, main Stack mein) ──
            Positioned(
              top: 58,
              left: 134,
              right: 134,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                  decoration: BoxDecoration(
                    color: const Color(0xFF5B52E8),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "AI MAGIC",
                        style: GoogleFonts.poppins(
                          fontSize: 6.51,
                          color: AppColors.splashscreenfirsttext,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -1.2,
                          height: 1,
                        ),
                      ),
                      Image(image: AssetImage(AppImages.stars)),
                    ],
                  ),
                ),
              ),
            ),

            // ── Screen area (carrot + tomato) ───────────────
            Positioned(
              top: 190,
              left: 110,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        // Carrot circle
                        Container(
                          width: 52.05,
                          height: 52.05,
                          decoration: BoxDecoration(
                            color: const Color(0xFFD1FAE5),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: const Color(0xFFEEF0FF),
                              width: 1.39,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Image.asset(
                              AppImages.carrot,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        // Tomato card (overlapping)
                        Positioned(
                          top: 17,
                          left: 35,
                          child: Container(
                            width: 40.9,
                            height: 40.9,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: const Color(0xFFEEF0FF),
                                width: 1.39,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(6),
                              child: Image.asset(
                                AppImages.tomato,
                                fit: BoxFit.contain,
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

            // ── Floating food cards (left side) ────────────
            Positioned(
              top: 110,
              left: 30,
              child: Transform.rotate(
                angle: 0.19,
                child: _FloatingFoodCard(
                  imagepath: AppImages.tree,
                  bgColor: const Color(0xFFF0FDF4),
                  borderColor: const Color(0xFFBBF7D0),
                  height: 37.18,
                  width: 37.18,
                  borderRadius: 10,
                ),
              ),
            ),
            Positioned(
              top: 150,
              left: 20,
              child: _FloatingFoodCard(
                imagepath: AppImages.leaf,
                bgColor: const Color(0xFFEEF2FF),
                height: 40.9,
                width: 40.9,
                borderRadius: 70,
              ),
            ),
            Positioned(
              top: 196,
              left: 10,
              child: _FloatingFoodCard(
                imagepath: AppImages.lemon,
                bgColor: const Color(0xFFEEF2FF),
                borderColor: null,
                height: 33.46,
                width: 33.46,
                borderRadius: 60,
              ),
            ),

            // ── Floating food cards (right side) ───────────
            Positioned(
              top: 96,
              right: 40,
              child: _FloatingFoodCard(
                imagepath: AppImages.garlic,
                bgColor: const Color(0xFFFEE2E2),
                height: 37.18,
                width: 37.18,
                borderRadius: 10,
              ),
            ),
            Positioned(
              top: 155,
              right: 50,
              child: _FloatingFoodCard(
                angle: -0.4,
                imagepath: AppImages.onion,
                bgColor: const Color(0xFFFEF9C3),
                borderColor: const Color(0xFFFDE68A),
                height: 37.18,
                width: 37.18,
                borderRadius: 10,
              ),
            ),
            Positioned(
              top: 172.53,
              left: 300.51,
              child: Transform.rotate(
                angle: 6 * math.pi / 180,
                child: Container(
                  width: 33.46,
                  height: 33.46,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF7ED),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      width: 1.39,
                      color: const Color(0xFFFED7AA),
                    ),
                  ),
                  child: Image.asset(AppImages.grapes),
                ),
              ),
            ),
            Positioned(
              top: 245.22,
              left: 280.92,
              child: Transform.rotate(
                angle: 12 * (math.pi / 180),
                child: Container(
                  width: 33.46,
                  height: 33.46,
                  color: const Color(0xFFFDF4FF),
                  child: Image(image: AssetImage(AppImages.ginger)),
                ),
              ),
            ),

            // ── Decorative dots ─────────────────────────────
            Positioned(
              top: 60,
              left: 100,
              child: Container(
                width: 14,
                height: 14,
                decoration: const BoxDecoration(
                  color: Color(0xFFFACC15),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              top: 150,
              left: 58,
              child: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: const Color(0xFFFACC15).withOpacity(0.7),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              top: 260,
              left: 30,
              child: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: const Color(0xFFC4B5FD).withOpacity(0.7),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              top: 50,
              right: 110,
              child: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: const Color(0xFFC4B5FD).withOpacity(0.8),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              top: 140,
              right: 65,
              child: Container(
                width: 5.58,
                height: 5.58,
                decoration: BoxDecoration(
                  color: const Color(0xFFC4B5FD).withOpacity(0.8),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              top: 223,
              right: 20,
              child: Container(
                width: 7.44,
                height: 7.44,
                decoration: const BoxDecoration(
                  color: Color(0xFFFACC15),
                  shape: BoxShape.circle,
                ),
              ),
            ),

            // ── Yellow egg circle (right side) ──────────
            Positioned(
              bottom: 92,
              left: 175,
              right: 0,
              child: Center(
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFDE68A),
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 1.88,
                      color: const Color(0xFFFACC15),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(11),
                    child: Image.asset(
                      AppImages.egg,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),

            // ── Yellow egg circle (left side mirror) ───────
            Positioned(
              bottom: 92,
              left: 3,
              right: 175,
              child: Center(
                child: Container(
                  width: 26.03,
                  height: 26.03,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFFF5C48A),
                        Color(0xFFFDDCB0),
                      ],
                    ),
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 0.93,
                      color: const Color(0xFFE8C898),
                    ),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        top: -3,
                        child: Transform.rotate(
                          angle: -0.3,
                          child: Container(
                            width: 11,
                            height: 26.03,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xFFF5C48A),
                                  Color(0xFFFDDCB0),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                width: 0.93,
                                color: const Color(0xFFE8C898),
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

            // ── Receipt card (bottom left) ──────────────────
            Positioned(
              bottom: 20,
              left: 38,
              child: Transform.rotate(
                angle: -6 * (math.pi / 180),
                child: _ReceiptCard(),
              ),
            ),

            // ── Receipt card (bottom right) ─────────────────
            Positioned(
              bottom: 10,
              right: 24,
              child: Transform.rotate(
                angle: 8 * (math.pi / 180),
                child: _ReceiptCard(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Floating Food Card Widget ───────────────────────────────
class _FloatingFoodCard extends StatelessWidget {
  final String imagepath;
  final Color? bgColor;
  final Color? borderColor;
  final double height;
  final double width;
  final double borderRadius;
  final double angle;

  const _FloatingFoodCard({
    required this.imagepath,
    this.bgColor,
    this.borderColor,
    required this.height,
    required this.width,
    required this.borderRadius,
    this.angle = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(
            color: borderColor ?? Colors.transparent,
            width: 1.5,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: Image.asset(
              imagepath,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}

// ── Receipt Card Widget ─────────────────────────────────────
class _ReceiptCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 34.89,
          width: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: const Color(0xFFE0E7FF),
              width: 0.93,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Container(
                  height: 2,
                  width: 29.74,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8E8F4),
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Container(
                  width: 26.03,
                  height: 2,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8E8F4),
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Container(
                  width: 22.3,
                  height: 2,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8E8F4),
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              ),
              const SizedBox(height: 3),
              Transform.rotate(
                angle: 2 * (math.pi / 180),
                child: Center(
                  child: Container(
                    width: 26.03,
                    height: 3.72,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Color(0xFFFACC15),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // FLOATING TEXT (TOP OUTSIDE)
        Positioned(
          top: -5,
          left: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            child: const Text(
              'RECEIPT',
              style: TextStyle(
                fontSize: 7,
                fontWeight: FontWeight.w700,
                color: Color(0xFF5B52E8),
                letterSpacing: 1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// ── Overlay Container Widget ────────────────────────────────
class OverlayContainerWidget extends StatelessWidget {
  const OverlayContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 100,
      child: Stack(
        children: [
          const Positioned(
            top: 80,
            left: 50,
            child: _BlueBox(),
          ),
          const Positioned(
            top: 10,
            left: 10,
            child: _OrangeBox(),
          ),
        ],
      ),
    );
  }
}

class _BlueBox extends StatelessWidget {
  const _BlueBox();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 26.03,
      height: 26.03,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [
            Color(0xFFFDDCB0),
            Color(0xFFF5C48A),
          ],
        ),
      ),
    );
  }
}

class _OrangeBox extends StatelessWidget {
  const _OrangeBox();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 11,
      height: 26.03,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [
            Color(0xFFF5C48A),
            Color(0xFFFDDCB0),
          ],
        ),
      ),
    );
  }
}

// ── Eye Widget ──────────────────────────────────────────────
Widget _buildEye() {
  return Stack(
    children: [
      Image.asset(
        AppImages.whiteeye,
        width: 9.3,
        height: 11.15,
        fit: BoxFit.cover,
      ),
      Positioned(
        top: 3,
        left: 2,
        child: Container(
          width: 5.58,
          height: 5.58,
          decoration: const BoxDecoration(
            color: Color(0xFF3D2D1A),
            shape: BoxShape.circle,
          ),
        ),
      ),
      Positioned(
        top: 4,
        right: 3,
        child: Container(
          width: 2,
          height: 2,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
        ),
      ),
    ],
  );
}