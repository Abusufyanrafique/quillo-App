import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quillo_app/ui/screens/splash_screens/recipe_in_seconds_screen.dart';
import 'package:quillo_app/utils/app_images.dart';

class ScanAndDiscoverRecipe extends StatelessWidget {
  const ScanAndDiscoverRecipe({super.key});

  @override
  Widget build(BuildContext context) {
    // ── Screen size lena taake blobs bhi responsive hon ──
    final size = MediaQuery.of(context).size;
    final sw = size.width;
    final sh = size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      body: Stack(
        children: [
          // ── Background blob 1 (top right, bada) ──────────────
          Positioned(
            right: -sw * 0.10,
            top: -sh * 0.07,
            child: Container(
              width: sw * 0.72,
              height: sh * 0.32,
              decoration: BoxDecoration(
                color: const Color(0xFF6366F1).withOpacity(0.06),
                borderRadius: BorderRadius.circular(sw * 0.36),
              ),
            ),
          ),

          // ── Background blob 2 (right side, chota) ────────────
          Positioned(
            right: -sw * 0.01,
            top: sh * 0.34,
            child: Container(
              width: sw * 0.36,
              height: sw * 0.36,
              decoration: BoxDecoration(
                color: const Color(0xFF6366F1).withOpacity(0.06),
                borderRadius: BorderRadius.circular(sw * 0.18),
              ),
            ),
          ),

          // ── Main content ──────────────────────────────────────
          SafeArea(
            child: Column(
              children: [
                SizedBox(height: sh * 0.035),

                // ── Top illustration area ─────────────────────
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: sw * 0.04),
                    child: const SizedBox(
                      width: double.infinity,
                      child: GroceryToRecipeIllustration(),
                    ),
                  ),
                ),

                // ── Bottom content area ───────────────────────
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
                      padding: EdgeInsets.symmetric(
                        horizontal: sw * 0.072,
                        vertical: sh * 0.033,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Step indicator
                          Container(
                            height: 30,
                            width: 99.4,
                            decoration: BoxDecoration(
                              color:
                                  const Color(0xFF6366F1).withOpacity(0.20),
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

                          SizedBox(height: sh * 0.019),

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

                          SizedBox(height: sh * 0.014),

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

                          SizedBox(height: sh * 0.024),

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
                              onPressed: () {
                                 Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                  builder: (context) => RecipeInSecondsScreen(),
                                  ),
                                  );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF6366F1),
                                foregroundColor: Colors.white,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
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

                          SizedBox(height: sh * 0.010),
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

// ── Feature Chip ─────────────────────────────────────────────
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
    return LayoutBuilder(
      builder: (context, constraints) {
        final w = constraints.maxWidth;
        final h = constraints.maxHeight;

        // ── Card sizes bhi responsive ──
        final cardW = w * 0.30;
        final cardH = h * 0.30;
        final circleSize = w * 0.21; // AI circle
        final foodIconSize = w * 0.125;

        return Stack(
          clipBehavior: Clip.none,
          children: [
            // ── Grocery Receipt ───────────────────────────────
            Positioned(
              top: h * 0.32,
              left: w * 0.10,
              child: Transform.rotate(
                angle: -7 * math.pi / 180,
                child: _GroceryReceiptCard(
                  cardWidth: w * 0.32,
                  cardHeight: h * 0.55,
                ),
              ),
            ),

            // ── AI Magic Circle ───────────────────────────────
            Positioned(
              top: h * 0.44,
              left: w * 0.37,
              child: _AiMagicCircle(size: circleSize),
            ),

            // ── Purple card (back) ────────────────────────────
            Positioned(
              top: h * 0.43,
              right: w * 0.14,
              child: Transform.rotate(
                angle: 9 * math.pi / 180,
                child: Container(
                  width: cardW,
                  height: cardH,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [
                      Color(0xFFEDE9FE),
                      Color(0xFFDDD6FE),
                    ]),
                    border: Border.all(
                        color: const Color(0xFFDDD6FE), width: 1.34),
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
              ),
            ),

            // ── Mint card (middle) ────────────────────────────
            Positioned(
              top: h * 0.50,
              right: w * 0.16,
              child: Transform.rotate(
                angle: -4.20 * math.pi / 180,
                child: Container(
                  width: 104,
                  height: cardH,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [
                      Color(0xFFD1FAE5),
                      Color(0xFFA7F3D0),
                    ]),
                    border: Border.all(
                        color: const Color(0xFF6EE7B7), 
                        width: 1.34
                        ),
                    borderRadius: BorderRadius.circular(18
                    ),
                  ),
                ),
              ),
            ),

            // ── Yellow Recipe Card (front) ────────────────────
            Positioned(
              top: h * 0.56,
              right: w * 0.15,
              child: SizedBox(
                width: 108,
                height: cardH,
                child: const _RecipeCard(),
              ),
            ),

            // ── Floating food images ──────────────────────────
            Positioned(
              top: h * 0.38,
              right: w * 0.25,
              child: Image(
                image: AssetImage(AppImages.salad),
                width: w * 0.12,
                height: w * 0.12,
              ),
            ),
            Positioned(
              top: h * 0.47,
              right: w * 0.28,
              child: Image(
                image: AssetImage(AppImages.vermicelli),
                width: w * 0.12,
                height: w * 0.12,
              ),
            ),

            // ── Corner food icons ─────────────────────────────
            Positioned(
              top: h * 0.18,
              left: w * 0.0,
              child: _FoodCircle(
                imagepath: AppImages.leaf,
                size: foodIconSize,
                bgColor: const Color(0xFFF0FDF4),
                borderColor: const Color(0xFFBBF7D0),
              ),
            ),
            Positioned(
              top: h * 0.05,
              right: w * 0.08,
              child: _FoodCircle(
                imagepath: AppImages.greenbell,
                size: foodIconSize,
                bgColor: const Color(0xFFFFF1F2),
                borderColor: const Color(0xFFFECDD3),
              ),
            ),
            Positioned(
              bottom: -30,
              left: w * 0.0,
              child: _FoodSquare(
                imagepath: AppImages.onion,
                size: foodIconSize,
                bgColor: const Color(0xFFFEF9C3),
                borderColor: const Color(0xFFFDE68A),
              ),
            ),
            Positioned(
              bottom: h * 0.01,
              right: w * 0.05,
              child: _FoodCircle(
                imagepath: AppImages.lemon,
                size: foodIconSize,
                bgColor: const Color(0xFFFFFADC),
                borderColor: const Color(0xFFFFE870),
              ),
            ),

            // ── Decorative dots ───────────────────────────────
            Positioned(
              top: h * 0.18,
              left: w * 0.36,
              child: _Dot(size: 7, color: const Color(0xFFFACC15)),
            ),
            Positioned(
              top: h * 0.68,
              left: w * 0.14,
              child: _Dot(size: 7, color: const Color(0xFFFACC15)),
            ),
            Positioned(
              top: h * 0.20,
              right: w * 0.48,
              child: _Dot(size: 6, color: const Color(0xFF6366F1)),
            ),
            Positioned(
              top: h * 0.44,
              right: w * 0.22,
              child: _Dot(size: 6, color: const Color(0xFF6366F1)),
            ),
          ],
        );
      },
    );
  }
}

// ── Grocery Receipt Card ──────────────────────────────────────
// Ab cardWidth aur cardHeight bahar se aati hain — responsive hai
class _GroceryReceiptCard extends StatelessWidget {
  final double cardWidth;
  final double cardHeight;

  const _GroceryReceiptCard({
    this.cardWidth = 112,
    this.cardHeight = 141,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: cardWidth,
      height: cardHeight,
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
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: const BoxDecoration(
              color: Color(0xFF5B52E8),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(13),
                topRight: Radius.circular(13),
              ),
            ),
            child: Center(
              child: Text(
                'GROCERY RECEIPT',
                style: GoogleFonts.poppins(
                  fontSize: 8.04,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          ...List.generate(
            6,
            (i) => Padding(
              padding:
                  const EdgeInsets.only(left: 10, right: 10, bottom: 5),
              child: Row(
                children: [
                  Container(
                    height: 4,
                    width: [65.0, 50.0, 72.0, 45.0, 60.0, 38.0][i],
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
                    width: 13,
                    decoration: BoxDecoration(
                      color: const Color(0xFFDDE0F5),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ],
              ),
            ),
          ),
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
                  margin: const EdgeInsets.symmetric(horizontal: 0.4),
                  decoration: BoxDecoration(
                    color: const Color(0xFFBBBFE8),
                    borderRadius: BorderRadius.circular(1),
                  ),
                ),
              ),
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

// ── AI Magic Circle ───────────────────────────────────────────
class _AiMagicCircle extends StatelessWidget {
  final double size;

  const _AiMagicCircle({this.size = 75});

  @override
  Widget build(BuildContext context) {
    final innerSize = size * 0.77;
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        children: [
          CustomPaint(
            size: Size(size, size),
            painter: _DashedCirclePainter(),
          ),
          Center(
            child: Container(
              width: innerSize,
              height: innerSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF6366F1),
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
                  Text(
                    'AI✨',
                    style: GoogleFonts.poppins(
                      fontSize: size * 0.147,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xFFFACC15),
                    ),
                  ),
                  Text(
                    'MAGIC',
                    style: GoogleFonts.poppins(
                      fontSize: size * 0.093,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: -size * 0.067,
            top: size * 0.4,
            child: Container(
              width: size * 0.107,
              height: size * 0.107,
              decoration: const BoxDecoration(
                color: Color(0xFFFACC15),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            right: -size * 0.067,
            top: size * 0.4,
            child: Container(
              width: size * 0.107,
              height: size * 0.107,
              decoration: const BoxDecoration(
                color: Color(0xFFFACC15),
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Recipe Card ───────────────────────────────────────────────
class _RecipeCard extends StatelessWidget {
  const _RecipeCard();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final w = constraints.maxWidth;
        final h = constraints.maxHeight;

        return Container(
          width: w,
          height: h,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFFFEF3C7), Color(0xFFFDE68A)],
            ),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: const Color(0xFFFDE68A), width: 1.79),
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: h * 0.05,
                left: w * 0.11,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: const Color(0xFF5B52E8),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    'RECIPE',
                    style: GoogleFonts.poppins(
                      fontSize: 7,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      letterSpacing: 0.8,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: h * 0.02,
                right: w * 0.44,
                child: SizedBox(
                  width: w * 0.40,
                  height: h * 0.64,
                  child: const Center(
                    child: Image(image: AssetImage(AppImages.rice)),
                  ),
                ),
              ),
              Positioned(
                top: h * 0.25,
                left: w * 0.45,
                right: w * 0.11,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 6.53,
                     width: w * 0.50,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE8D870),
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                    const SizedBox(height: 3),
                    Container(
                      height: 5,
                      width: w * 0.30,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE8D870),
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: h * 0.18,
                left: w * 0.25,
                child: Container(
                  width: w * 0.49,
                  height: 16,
                  decoration: BoxDecoration(
                    color: const Color(0xFFfef8de),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('⏱', style: TextStyle(fontSize: 10)),
                      const SizedBox(width: 3),
                      Text(
                        '25 min',
                        style: GoogleFonts.poppins(
                          fontSize: 7.59,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF92400E),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// ── Painters & Helpers ────────────────────────────────────────
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
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        i * dashAngle,
        dashAngle * 0.5,
        false,
        paint,
      );
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
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      );
}