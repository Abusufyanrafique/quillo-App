import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quillo_app/utils/app_images.dart';

// ─────────────────────────────────────────────────────────────
// USAGE — apni kisi bhi screen mein bas yeh likho:
//
//   RecipeInSecondsWidget()
//
// Example:
//   Expanded(child: RecipeInSecondsWidget())
//   SizedBox(height: 600, child: RecipeInSecondsWidget())
// ─────────────────────────────────────────────────────────────

class RecipeInSecondsWidget extends StatelessWidget {
  const RecipeInSecondsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    final sh = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 0),
      child: Container(
        height: 268,
        width: 110.49333190917969,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Top Bar ────────────────────────────────────
            _TopBar(sw: sw),
            SizedBox(height: sh * 0.025),
        
            // ── Featured Recipe Card (yellow, big) ─────────
            _FeaturedRecipeCard(sw: sw, sh: sh),
            SizedBox(height: sh * 0.022),
        
            // ── Two smaller cards row ───────────────────────
            Row(
              children: [
                Expanded(
                  child: _SmallRecipeCard(
                    bgColor: const Color(0xFFB8F0D8),
                    borderColor: const Color(0xFF6EE7B7),
                    imagePath: AppImages.salad,
                    label1Width: 0,
                    label2Width: 0,
                    
                  ),
                ),
                SizedBox(width: sw * 0.04),
                Expanded(
                  child: _SmallRecipeCard(
                    bgColor: const Color(0xFFE8E4FF),
                    borderColor: const Color(0xFFD4CFFF),
                    imagePath: AppImages.rice,
                    label1Width: 0.18,
                    label2Width: 0.24,
                  ),
                ),
              ],
            ),
            SizedBox(height: sh * 0.012),
        
            // ── Bottom CTA button ───────────────────────────
            _BottomCtaButton(sw: sw, sh: sh),
            SizedBox(height: sh * 0.01),
        
            // ── Page indicator dots ─────────────────────────
            const _PageDots(),
          ],
        ),
      ),
    );
  }
}

// ── Top Bar ───────────────────────────────────────────────────
class _TopBar extends StatelessWidget {
  final double sw;
  const _TopBar({required this.sw});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _GreyLine(width: 39),
            const SizedBox(height: 8),
            _GreyLine(width:64),
            const SizedBox(height: 3),
            _GreyLine(width: 46),
          ],
        ),
        const Spacer(),
        Container(
          height: 2,
          width: 4,
          decoration: BoxDecoration(
            color: const Color(0xFFFDE68A),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        const SizedBox(width: 12),
        Container(
          width: 16,
          height: 16,
          decoration: const BoxDecoration(
            color: Color(0xFF6366F1),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.person, color: Colors.white, size: 20),
        ),
      ],
    );
  }
}

// ── Featured Recipe Card ──────────────────────────────────────
class _FeaturedRecipeCard extends StatelessWidget {
  final double sw;
  final double sh;
  const _FeaturedRecipeCard({required this.sw, required this.sh});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 96,
        height: 78,
        decoration: BoxDecoration(
          color: const Color(0xFFFDE68A),
          gradient: LinearGradient(colors: [
            Color(0xFFFEF3C7),
            Color(0xFFFDE68A)
          ]),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: const Color(0xFFFDE68A), 
            width: 1.5,
            ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFFCD34D).withOpacity(0.30),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // RECIPE badge
            Positioned(
              top: sh * 0.001,
              left: sw * 0.02,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFF6366F1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'RECIPE',
                  style: GoogleFonts.poppins(
                    fontSize: 6.25,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),
      
            // Food image
            // Positioned(
            //   top: -sh * 0.02,
            //   right: sw * 0.03,
            //   child: Image.asset(
            //     AppImages.noodles,
            //     width: sw * 0.20,
            //     height: sh * 0.22,
            //     fit: BoxFit.contain,
            //   ),
            // ),
      
            // NEW badge
            Positioned(
              bottom: sh * 0.030,
              right: sw * 0.10,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                decoration: BoxDecoration(
                  color: const Color(0xFFFACC15),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFFACC15).withOpacity(0.5),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Text(
                  'NEW',
                  style: GoogleFonts.poppins(
                    fontSize: 6,
                    fontWeight: FontWeight.w800,
                    color: const Color(0xFF92400E),
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ),
      
            // Text lines
            Positioned(
              bottom: 40,
              left: sw * 0.12,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _BrownLine(width: 42, opacity: 0.5),
                  const SizedBox(height: 6),
                  _BrownLine(width: sw * 0.15, opacity: 0.3),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Small Recipe Card ─────────────────────────────────────────
class _SmallRecipeCard extends StatelessWidget {
  final Color bgColor;
  final Color borderColor;
  final String imagePath;
  final double label1Width;
  final double label2Width;

  const _SmallRecipeCard({
    required this.bgColor,
    required this.borderColor,
    required this.imagePath,
    required this.label1Width,
    required this.label2Width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 51.9,
      width: 44,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: borderColor, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: borderColor.withOpacity(0.35),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            // width: sw * 0.22,
            // height: sh * 0.10,
            fit: BoxFit.contain,
          ),
          SizedBox(height:1),
          _WhiteLine(width:32, opacity: 0.70,color: Color(0xFF059669),height: 4,),
          const SizedBox(height: 5),
          _WhiteLine(width:21 , opacity: 0.50,color: Color(0xFF059669),height: 4,),
        ],
      ),
    );
  }
}

// ── Bottom CTA Button ─────────────────────────────────────────
class _BottomCtaButton extends StatelessWidget {
  final double sw;
  final double sh;
  const _BottomCtaButton({required this.sw, required this.sh});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,
      height: 28,
      decoration: BoxDecoration(
        color: const Color(0xFF6366F1),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6366F1).withOpacity(0.40),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text('✦', style: TextStyle(fontSize: 22, color: Color(0xFFFACC15))),
          // SizedBox(width: sw * 0.04),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _WhiteLine(
                width:53, 
                opacity: 0.85, 
                height: 4,
                color: Color(0xFFFFFFFF).withOpacity(0.25),
                ),
              const SizedBox(height: 6),
              _WhiteLine(
                width: 39.10, 
                opacity: 0.45, 
                height: 4,
                color: Color(0xFFFFFFFF).withOpacity(0.25),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

// ── Page Indicator Dots ───────────────────────────────────────
class _PageDots extends StatelessWidget {
  const _PageDots();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 17,
      width: 96.7,
      // padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Active (pill shape)
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: const Color(0xFF6366F1),
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          const SizedBox(width: 6),

          for (int i = 0; i < 3; i++) ...[
            Container(
              width: 7.15,
              height: 7.15,
              decoration: const BoxDecoration(
                color: Color(0xFFEEF2FF),
                shape: BoxShape.circle,
              ),
            ),
            if (i < 2) const SizedBox(width: 6),
          ],
        ],
      ),
    );
  }
}
// ── Reusable tiny helpers ─────────────────────────────────────
class _GreyLine extends StatelessWidget {
  final double width;
  const _GreyLine({required this.width});
  @override
  Widget build(BuildContext context) => Container(
        height: 7,
        width: width,
        decoration: BoxDecoration(
          color: const Color(0xFFD1D5DB),
          borderRadius: BorderRadius.circular(5),
        ),
      );
}

class _WhiteLine extends StatelessWidget {
  final double width;
  final double opacity;
  final double height;
  final Color color;
  const _WhiteLine({
    required this.width, 
    required this.opacity, 
    this.height = 7, 
    required this.color});
  @override
  Widget build(BuildContext context) => Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(4),
        ),
      );
}

class _BrownLine extends StatelessWidget {
  final double width;
  final double opacity;
  const _BrownLine({required this.width, required this.opacity});
  @override
  Widget build(BuildContext context) => Container(
        height: 8,
        width: width,
        decoration: BoxDecoration(
          color: const Color(0xFF92400E).withOpacity(opacity),
          borderRadius: BorderRadius.circular(4),
        ),
      );
}