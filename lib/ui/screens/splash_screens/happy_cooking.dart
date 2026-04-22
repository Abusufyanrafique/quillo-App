import 'package:flutter/material.dart';
import 'package:quillo_app/ui/screens/splash_screens/scan_and_discover_recipe.dart';
import 'package:quillo_app/utils/app_colors.dart';
import 'package:quillo_app/utils/app_images.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quillo_app/utils/app_text.dart';
import 'package:quillo_app/widgets/splash_screens/get_started_button .dart';
import 'package:quillo_app/widgets/splash_screens/quillo_button.dart';
import 'package:quillo_app/widgets/splash_screens/quillo_cooking_Illustration.dart';

class HappyCooking extends StatefulWidget {
  const HappyCooking({super.key});

  @override
  _HappyCookingState createState() => _HappyCookingState();
}

class _HappyCookingState extends State<HappyCooking> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashscreenbackground,
      body: Stack(
        clipBehavior: Clip.none,
        children: [

          // ── Purple Blob (top) ───────────────────────────────
          Positioned(
            top: -75,
            left: -55,
            child: Container(
              width: 500,
              height: 340,
              decoration: BoxDecoration(
                color: Color(0x148366F1), // #8366F1 @ 8% opacity
                borderRadius: BorderRadius.circular(210),
              ),
            ),
          ),

          // ── Yellow Blob (bottom right) ──────────────────────
          Positioned(
            top: 515,
            left: 245.4,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: Color(0x21FACC15), // #FACC15 @ 13% opacity
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),

          // ── Indigo Blob (bottom left) ───────────────────────
          Positioned(
            top: 495,
            left: -55,
            child: Container(
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                color: Color(0x126366F1), 
                borderRadius: BorderRadius.circular(80),
              ),
            ),
          ),

          // ── Main Content ────────────────────────────────────
          Column(
            children: [
            SizedBox(height: 40,),
              // Logo image
              // Image(image: AssetImage(AppImages.aimagic)),
              // Apni screen mein sirf yeh likho
                 QuilloCookingIllustration(),

              // Quillo Button
              QuilloButton(
                imagePath: AppImages.yellowcricle,
                onTap: () {},
              ),

              SizedBox(height: 20),

              // ── "Happy" text ──────────────────────────────
              Text(
                AppText.happy,
                style: GoogleFonts.poppins(
                  fontSize: 42,
                  color: AppColors.splashscreenfirsttext,
                  fontWeight: FontWeight.w900,
                  letterSpacing: -1.2,
                  height: 1,
                ),
              ),

              // ── "Cooking" text ────────────────────────────
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppText.cooking,
                      style: GoogleFonts.poppins(
                        fontSize: 42,
                        color: AppColors.splashscreensecondtext,
                        fontWeight: FontWeight.w900,
                        letterSpacing: -1.2,
                      ),
                    ),
                    SizedBox(width: 20,),
                    Image(image: AssetImage(AppImages.chef)),
                  ],
                ),
              ),

              // ── Subtitle text ─────────────────────────────
              Text(
                AppText.trunreceipts,
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  color: AppColors.thirdtext,
                  fontWeight: FontWeight.w400,
                  letterSpacing: -1.2,
                ),
              ),

              SizedBox(height: 10),

              // ── Get Started Button ────────────────────────
              GetStartedButton(
                imagePath: AppImages.getstarted,
                onTap: () {
                   Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ScanAndDiscoverRecipe(),
      ),
    );
                },
              ),

              SizedBox(height: 14),

              // ── Already have account text ─────────────────
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: AppText.alreadyaccount,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.accounttext,
                      ),
                    ),
                    TextSpan(
                      text: AppText.sigin,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.sigintext,
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),

        ],
      ),
    );
  }
}

