import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quillo_app/utils/app_images.dart';
import 'package:quillo_app/widgets/splash_screens/recipe_in_seconds_illustration.dart';

class RecipeInSecondsScreen extends StatelessWidget {
  const RecipeInSecondsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sw = size.width;
    final sh = size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      body: Stack(
        children: [
          // ── Background blob top-right ───────────────────────
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
          // ── Background blob right-middle ──────────────────────
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
                SizedBox(height: sh * 0.02),

                // ── Top illustration area with phone mockup ───
                Expanded(
                  flex: 5,
                  child: _PhoneMockupArea(sw: sw, sh: sh),
                ),

                // ── Bottom text content ───────────────────────
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: sw * 0.072,
                      vertical: sh * 0.02,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Step indicator
                        Container(
                          height: 30,
                          width: 105,
                          decoration: BoxDecoration(
                            color: const Color(0xFF6366F1).withOpacity(0.15),
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
                                  'Step 2 of 5',
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

                        SizedBox(height: sh * 0.018),

                        // Title
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Recipes in\n',
                                style: GoogleFonts.poppins(
                                  fontSize: 34,
                                  fontWeight: FontWeight.w800,
                                  color: const Color(0xFF1A1A2E),
                                  height: 1.15,
                                ),
                              ),
                              TextSpan(
                                text: 'Seconds ',
                                style: GoogleFonts.poppins(
                                  fontSize: 34,
                                  fontWeight: FontWeight.w800,
                                  color: const Color(0xFF6366F1),
                                  height: 1.15,
                                ),
                              ),
                              TextSpan(
                                text: '✦',
                                style: TextStyle(
                                  fontSize: 28,
                                  color: const Color(0xFF1A1A2E),
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: sh * 0.014),

                        // Subtitle
                        Text(
                          'Point your camera at any receipt.\nOur AI does the rest instantly',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF6B7280),
                            height: 1.6,
                          ),
                        ),

                        SizedBox(height: sh * 0.022),

                        // Feature chips
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _FeatureChip(
                              imagepath: AppImages.scan,
                              label: 'Instant scan',
                            ),
                            const SizedBox(width: 10),
                            _FeatureChip(
                              imagepath: AppImages.ai,
                              label: 'AI-powered',
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        _FeatureChip(
                          imagepath: AppImages.meals,
                          label: 'Smart meals',
                        ),

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
                                Image(image: AssetImage(AppImages.arrow)),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: sh * 0.010),
                      ],
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

// ── Phone Mockup Area ─────────────────────────────────────────
class _PhoneMockupArea extends StatelessWidget {
  final double sw;
  final double sh;
  const _PhoneMockupArea({
    required this.sw, 
    required this.sh
    });

  @override
  Widget build(BuildContext context) {
    final phoneW = sw * 0.52;
    final phoneH = sh * 0.36;

    return SizedBox(
      width: sw,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          // ── Phone mockup shell ────────────────────────────
          Center(
            child: _PhoneShell(
              phoneW: phoneW,
              phoneH: phoneH,
            ),
          ),

          // ── TIME SAVED card (left) ────────────────────────
          Positioned(
            left: sw * 0.05,
            top: sh * 0.13,
            child: _FloatingInfoCard(
              topLabel: 'TIME SAVED',
              icon: '⏰',
              mainText: '3.2 hrs',
              subText: 'per week',
              bgColor: Color(0xFFEEF2FF),
            ),
          ),

          // ── MEALS PLANNED card (right) ────────────────────
          Positioned(
            right: sw * 0.02,
            top: sh * 0.06,
            child: _FloatingInfoCard(
              topLabel: 'MEALS PLANNED',
              icon: '🍽',
              mainText: '14+',
              subText: 'this month',
              bgColor: Color(0xFFEEF2FF),
            ),
          ),

          // ── Food circle icons ─────────────────────────────
          // Lemon top-left
          Positioned(
            left: sw * 0.04,
            top: sh * 0.01,
            child: _FoodBubble(
              imagePath: AppImages.lemon,
              size: sw * 0.10,
              bgColor: const Color(0xFFFFFBE6),
              borderColor: const Color(0xFFFFE870),
            ),
          ),
          // Tomato/bell top-right
          Positioned(
            right: sw * 0.04,
            top: sh * 0.01,
            child: _FoodBubble(
              imagePath: AppImages.greenbell,
              size: sw * 0.10,
              bgColor: const Color(0xFFFFF0F0),
              borderColor: const Color(0xFFFECDD3),
            ),
          ),
          // Avocado/leaf left-bottom
          Positioned(
            left: sw * 0.04,
            bottom: sh * 0.02,
            child: _FoodBubble(
              imagePath: AppImages.leaf,
              size: sw * 0.09,
              bgColor: const Color(0xFFF0FDF4),
              borderColor: const Color(0xFFBBF7D0),
            ),
          ),

          // ── Speaker icon right-bottom ─────────────────────
          Positioned(
            right: sw * 0.04,
            bottom: sh * 0.04,
            child: Container(
              width: sw * 0.09,
              height: sw * 0.09,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Icon(
                Icons.volume_up_rounded,
                color: const Color(0xFF6366F1),
                size: sw * 0.048,
              ),
            ),
          ),

          // ── Decorative dots ───────────────────────────────
          Positioned(
            left: sw * 0.22,
            top: sh * 0.03,
            child: _Dot(size: 6, color: const Color(0xFFFACC15)),
          ),
          Positioned(
            right: sw * 0.22,
            top: sh * 0.16,
            child: _Dot(size: 5, color: const Color(0xFF6366F1)),
          ),
          Positioned(
            left: sw * 0.14,
            top: sh * 0.22,
            child: _Dot(size: 5, color: const Color(0xFF6366F1)),
          ),
        ],
      ),
    );
  }
}

// ── Phone Shell ───────────────────────────────────────────────
class _PhoneShell extends StatelessWidget {
  final double phoneW;
  final double phoneH;
  const _PhoneShell({required this.phoneW, required this.phoneH});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: phoneH,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color(0xFFF0F2FF),
          Color(0xFFE8ECFF),
        ]),
        // color: Colors.white,
        borderRadius: BorderRadius.circular(phoneW * 0.14),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6366F1).withOpacity(0.15),
            blurRadius: 30,
            offset: const Offset(0, 12),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 6),
          ),
        ],
        border: Border.all(
          color: const Color(0xFFDDE2FF),
          width: 1.5,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(phoneW * 0.13),
        child: Column(
          children: [
            // Status bar
            Container(
              height: phoneH * 0.06,
              color: Color(0xFFEEF2FF),
              padding: EdgeInsets.symmetric(horizontal: phoneW * 0.08),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: phoneW * 0.12,
                    height: 3,
                    decoration: BoxDecoration(
                      color: const Color(0xFFD1D5DB),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  // Dynamic island notch
                  Container(
                    width: phoneW * 0.20,
                    height: phoneH * 0.025,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1A1A2E),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  
                ],
              ),
            ),

            // Screen content — RecipeInSecondsWidget
            Expanded(
              child: Container(
                color: const Color(0xFFEEF0FB),
                child: const RecipeInSecondsWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Floating Info Card (TIME SAVED / MEALS PLANNED) ─────────

class _FloatingInfoCard extends StatelessWidget {
  final String topLabel;
  final String icon;
  final String mainText;
  final String subText;
  final Color bgColor;

  const _FloatingInfoCard({
    required this.topLabel,
    required this.icon,
    required this.mainText,
    required this.subText,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            bgColor,
             Colors.white,
          ],
          stops: const [0.5, 0.20],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.10),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(
          color: Color(0xFFE0E4FF),
          width: 2,
        )
      ),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Text(
              topLabel,
              style: GoogleFonts.poppins(
                fontSize: 7,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF6366F1),
                letterSpacing: 0.4,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(icon, style: const TextStyle(fontSize: 14)),
              const SizedBox(width: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    mainText,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xFF1A1A2E),
                      height: 1.1,
                    ),
                  ),
                  Text(
                    subText,
                    style: GoogleFonts.poppins(
                      fontSize: 7,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF9CA3AF),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ── Food Bubble ───────────────────────────────────────────────
class _FoodBubble extends StatelessWidget {
  final String imagePath;
  final double size;
  final Color bgColor;
  final Color borderColor;

  const _FoodBubble({
    required this.imagePath,
    required this.size,
    required this.bgColor,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: bgColor,
        shape: BoxShape.circle,
        border: Border.all(color: borderColor, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Center(
        child: Image.asset(
          imagePath,
          width: size * 0.55,
          height: size * 0.55,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

// ── Feature Chip ──────────────────────────────────────────────
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

// ── Dot ───────────────────────────────────────────────────────
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