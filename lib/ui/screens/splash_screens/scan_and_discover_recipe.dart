import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quillo_app/utils/app_images.dart';

class ScanAndDiscoverRecipe extends StatelessWidget {
  const ScanAndDiscoverRecipe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      body: Stack(
        children: [

          // ── Background  blob (bottom right) ──────
          Positioned(
            right: -40,
            top: -60,
            child: Container(
              width: 280,
              height: 260,
              decoration: BoxDecoration(
                color: const Color(0xFF6366F1).withOpacity(0.06),
                borderRadius: BorderRadius.circular(140),
              ),
            ),
          ),
           Positioned(
            right: -2,
            top: 255,
            child: Container(
              width: 140,
              height:140,
              decoration: BoxDecoration(
                color: const Color(0xFF6366F1).withOpacity(0.06),
                borderRadius: BorderRadius.circular(140),
              ),
            ),
          ),

          // ── Main content ──────────────────────────────
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 30),

                // ── Top illustration area ─────────────
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10),
                    child: Container(
                      width: double.infinity,
                      child: const GroceryToRecipeIllustration(),
                    ),
                  ),
                ),

                // ── Bottom content area ───────────────
                Expanded(
                  flex: 6,
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 28, vertical: 28),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          // Step indicator
                          Container(
                            height: 30,
                            width: 99.4,
                            decoration: BoxDecoration(
                              color: const Color(0xFF6366F1).withOpacity(0.20),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: 6,
                                    height: 6,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF6366F1),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    'Step 1 of 5',
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xFF6366F1),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          const SizedBox(height: 16),

                          // Title
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Scan & ',
                                  style: GoogleFonts.poppins(
                                    fontSize: 36,
                                    fontWeight: FontWeight.w800,
                                    color: const Color(0xFF1A1A2E),
                                  ),
                                ),
                                TextSpan(
                                  text: 'Discover',
                                  style: GoogleFonts.poppins(
                                    fontSize: 36,
                                    fontWeight: FontWeight.w800,
                                    color: const Color(0xFF7B75F5),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            'Recipe',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              fontSize: 36,
                              fontWeight: FontWeight.w800,
                              color: const Color(0xFF1A1A2E),
                              height: 1.1,
                            ),
                          ),

                          const SizedBox(height: 12),

                          // Subtitle
                          Text(
                            'We turn your grocery list into\nsmart, delicious meal ideas',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF6B7280),
                              height: 1.9,
                            ),
                          ),

                          const SizedBox(height: 20),

                          // Feature chips
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _FeatureChip(
                                  imagepath: AppImages.scan,
                                  label: 'Instant scan'),
                              const SizedBox(width: 10),
                              _FeatureChip(
                                  imagepath: AppImages.ai,
                                  label: 'AI-powered'),
                            ],
                          ),
                          const SizedBox(height: 10),
                          _FeatureChip(
                              imagepath: AppImages.meals,
                              label: 'Smart meals'),

                          const Spacer(),

                          // Next button
                          SizedBox(
                            width: double.infinity,
                            height: 56,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF6366F1),
                                foregroundColor: Colors.white,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Next',
                                      style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Image(
                                        image: AssetImage(AppImages.arrow)),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 8),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── Feature Chip ────────────────────────────────────────────
class _FeatureChip extends StatelessWidget {
  final String label;
  final String imagepath;

  const _FeatureChip({required this.label, required this.imagepath});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      width: 134,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF000000).withOpacity(0.06),
            offset: const Offset(0, 4),
            blurRadius: 14,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            imagepath.isNotEmpty
                ? Image.asset(imagepath, height: 16, width: 16)
                : const SizedBox(width: 6),
            const SizedBox(width: 6),
            Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF374151),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Illustration ─────────────────────────────────────────────
class GroceryToRecipeIllustration extends StatelessWidget {
  const GroceryToRecipeIllustration({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [

        // Grocery Receipt
        Positioned(
          top: 80,
          left: 60,
          child: Transform.rotate(
            angle: -7 * math.pi / 180,
            child: const _GroceryReceiptCard(),
          ),
        ),

        // AI Magic circle
        Positioned(
          top:109,
          left: 130,
          child: const _AiMagicCircle(),
        ),

        // Green card (back)
        Positioned(
          top: 102,
          right: 50,
          child: Transform.rotate(
            angle: 9 * math.pi / 180,
            child: Container(
              width: 106,
              height: 66,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color(0xFFEDE9FE),
                  Color(0xFFDDD6FE),
                ]),
                border: Border.all(
                  color: Color(0xFFDDD6FE),
                  width: 1.34,
                ),
                borderRadius: BorderRadius.circular(18),
              ),
            ),
          ),
        ),
        // Mint card (middle)
       Positioned(
  top: 115,
  right: 60,
  child: Transform.rotate(
    angle: -4.20 * math.pi / 180, // negative = left side, positive = right side
    child: Container(
      width: 106,
      height: 66,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFFD1FAE5),
            Color(0xFFA7F3D0),
          ],
        ),
        border: Border.all(
          color: const Color(0xFF6EE7B7),
          width: 1.34,
        ),
        borderRadius: BorderRadius.circular(18),
      ),
    ),
  ),
),
        // Yellow recipe card (front)
        Positioned(
          top: 130,
          right: 60,
          child: const _RecipeCard(),
        ),

        // Floating food
        Positioned(
          top: 95,
          right: 96,
          child: Image(image: AssetImage(AppImages.salad)),
        ),
        Positioned(
          top: 113,
          right: 106,
          child: Image(image: AssetImage(AppImages.vermicelli)),
        ),

        // Corner items
        Positioned(
          top: 50,
          left: 24,
          child: _FoodCircle(
             imagepath: AppImages.leaf,
              size: 44,
              bgColor: const Color(0xFFF0FDF4),
              borderColor: const Color(0xFFBBF7D0)),
        ),
        Positioned(
          top: 50,
          right: 40,
          child: _FoodCircle(
              imagepath: AppImages.greenbell,
              size: 44,
              bgColor: const Color(0xFFFFF1F2),
              borderColor: const Color(0xFFFECDD3)),
        ),
        Positioned(
          bottom: 8,
          left: 2,
          child: _FoodSquare(
             imagepath: AppImages.onion,
              size: 44,
              bgColor: const Color(0xFFFEF9C3),
              borderColor: const Color(0xFFFDE68A)),
        ),
        Positioned(
          bottom: 0,
          right: 20,
          child: _FoodCircle(
              imagepath: AppImages.lemon,
              size: 44,
              bgColor: const Color(0xFFFFFADC),
              borderColor: const Color(0xFFFFE870)),
        ),

        // Dots
        Positioned(
            top: 60,
            left: 130,
            child: _Dot(size: 7, color: const Color(0xFFFACC15))),
        Positioned(
            top: 160,
            left: 50,
            child: _Dot(
                size: 7,
                color: const Color(0xFFFACC15))),
        Positioned(
            top: 65,
            right: 175,
            child:
                _Dot(size: 6, color: const Color(0xFF6366F1))),
                 Positioned(
            top: 105,
            right: 80,
            child:
                _Dot(size: 6, color: const Color(0xFF6366F1))),
      ],
    );
  }
}

// ── Grocery Receipt Card ─────────────────────────────────────
class _GroceryReceiptCard extends StatelessWidget {
  const _GroceryReceiptCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 112,
      height: 141,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            blurRadius: 16,
            offset: const Offset(3, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: const BoxDecoration(
              color: Color(0xFF5B52E8),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(13),
                topRight: Radius.circular(13),
              ),
            ),
            child: Text(
              'GROCERY RECEIPT',
              style: GoogleFonts.poppins(
                fontSize: 8,
                fontWeight: FontWeight.w800,
                color: Colors.white,
                letterSpacing: 0.3,
              ),
            ),
          ),
          const SizedBox(height: 8),
          ...List.generate(
              6,
              (i) => Padding(
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, bottom: 5),
                    child: Row(
                      children: [
                        Container(
                          height: 4,
                          width: [
                            65.0,
                            50.0,
                            72.0,
                            45.0,
                            60.0,
                            38.0
                          ][i],
                          decoration: BoxDecoration(
                            color: i == 0
                                ? const Color(0xFF9CA3F5)
                                : const Color(0xFFDDE0F5),
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        const Spacer(),
                        Container(
                          height: 4,
                          width: 18,
                          decoration: BoxDecoration(
                            color: const Color(0xFFDDE0F5),
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ],
                    ),
                  )),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  16,
                  (i) => Container(
                        width: i % 3 == 0 ? 2.5 : 1.5,
                        height: 18,
                        margin:
                            const EdgeInsets.symmetric(horizontal: 0.4),
                        decoration: BoxDecoration(
                          color: const Color(0xFFBBBFE8),
                          borderRadius: BorderRadius.circular(1),
                        ),
                      )),
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: CustomPaint(
              size: const Size(double.infinity, 8),
              painter: _WavyLinePainter(),
            ),
          ),
        ],
      ),
    );
  }
}

// ── AI Magic Circle ──────────────────────────────────────────
class _AiMagicCircle extends StatelessWidget {
  const _AiMagicCircle();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 75,
      height: 75,
      child: Stack(
        children: [
          CustomPaint(
            size: const Size(75, 75),
            painter: _DashedCirclePainter(),
          ),
          Center(
            child: Container(
              width: 58,
              height: 58,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF6366F1),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF5B52E8).withOpacity(0.4),
                    blurRadius: 12,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('AI✨',
                      style: GoogleFonts.poppins(
                          fontSize: 11,
                          fontWeight: FontWeight.w800,
                          color: const Color(0xFFFACC15))),
                  Text('MAGIC',
                      style: GoogleFonts.poppins(
                          fontSize: 7,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          letterSpacing: 1)),
                ],
              ),
            ),
          ),
          Positioned(
              left: -5,
              top: 30,
              child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                      color: Color(0xFFFACC15),
                      shape: BoxShape.circle))),
          Positioned(
              right: -5,
              top: 30,
              child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                      color: Color(0xFFFACC15),
                      shape: BoxShape.circle))),
        ],
      ),
    );
  }
}

// ── Recipe Card ──────────────────────────────────────────────
class _RecipeCard extends StatelessWidget {
  const _RecipeCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 106,
      height: 66,
      decoration: BoxDecoration(
        // color: const Color(0xFFFFF3B0),
        gradient: LinearGradient(colors: [
          Color(0xFFFEF3C7),
          Color(0xFFFDE68A)
        ]),
        borderRadius: BorderRadius.circular(18),
       border:Border.all(
        color: Color(0xFFFDE68A),
        width: 1.79,
       ) 
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 12,
            left: 12,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                  color: const Color(0xFF5B52E8),
                  borderRadius: BorderRadius.circular(16)),
              child: Text('RECIPE',
                  style: GoogleFonts.poppins(
                      fontSize: 7,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      letterSpacing: 0.8)),
            ),
          ),
          Positioned(
            top: 6,
            right: 10,
            child: Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                      ),
              child: const Center(
                  child:Image(image: AssetImage(AppImages.rice))),
            ),
          ),
          Positioned(
            top: 20,
            left: 12,
            right: 12,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    height: 6.53,
                    width: 55,
                    decoration: BoxDecoration(
                        color: const Color(0xFF92400E),
                        borderRadius: BorderRadius.circular(3))),
                const SizedBox(height: 5),
                Container(
                    height: 5,
                    width: 75,
                    decoration: BoxDecoration(
                        color: const Color(0xFFE8D870),
                        borderRadius: BorderRadius.circular(3))),
              ],
            ),
          ),
          Positioned(
            bottom: 12,
            left: 10,
            child: Container(
              width: 45,
              height: 16,
              // padding: const EdgeInsets.symmetric(
              //     horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Color(0xFFfef8de),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 6)
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('⏱',
                      style: TextStyle(fontSize: 10)),
                  const SizedBox(width: 3),
                  Text('25 min',
                      style: GoogleFonts.poppins(
                          fontSize: 7.59,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF92400E))),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Painters & Helpers ───────────────────────────────────────
class _WavyLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFEEF2FF)
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;
    final path = Path();
    path.moveTo(0, 4);
    double x = 0;
    while (x < size.width) {
      path.quadraticBezierTo(x + 4, 0, x + 8, 4);
      path.quadraticBezierTo(x + 12, 8, x + 16, 4);
      x += 16;
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter old) => false;
}

class _DashedCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFC7D2FE).withOpacity(0.6)
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;
    const dashCount = 20;
    const dashAngle = 2 * math.pi / dashCount;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 2;
    for (int i = 0; i < dashCount; i++) {
      final startAngle = i * dashAngle;
      canvas.drawArc(
          Rect.fromCircle(center: center, radius: radius),
          startAngle,
          dashAngle * 0.5,
          false,
          paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter old) => false;
}

class _FoodCircle extends StatelessWidget {
  final String imagepath;
  final double size;
  final Color bgColor;
  final Color? borderColor;

  const _FoodCircle({
    required this.imagepath,
    required this.size,
    required this.bgColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) => Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: bgColor,
          shape: BoxShape.circle,
          border: borderColor != null
              ? Border.all(color: borderColor!, width: 1.5)
              : null,
        ),
        child: Center(
          child: Image.asset(
            imagepath,
            width: size * 0.5,
            height: size * 0.5,
            fit: BoxFit.contain,
          ),
        ),
      );
}

class _FoodSquare extends StatelessWidget {
  final String imagepath;
  final double size;
  final Color bgColor;
  final Color? borderColor;

  const _FoodSquare({
    required this.imagepath,
    required this.size,
    required this.bgColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) => Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12),
          border: borderColor != null
              ? Border.all(color: borderColor!, width: 1.5)
              : null,
        ),
        child: Center(
          child: Image.asset(
            imagepath,
            width: size * 0.5,
            height: size * 0.5,
            fit: BoxFit.contain,
          ),
        ),
      );
}
class _Dot extends StatelessWidget {
  final double size;
  final Color color;

  const _Dot({required this.size, required this.color});

  @override
  Widget build(BuildContext context) => Container(
      width: size,
      height: size,
      decoration:
          BoxDecoration(color: color, shape: BoxShape.circle));
}