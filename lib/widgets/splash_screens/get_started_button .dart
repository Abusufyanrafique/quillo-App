import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quillo_app/utils/app_colors.dart';
import 'package:quillo_app/utils/app_text.dart';

class GetStartedButton extends StatelessWidget {
  final String imagePath;
  final VoidCallback onTap;

  const GetStartedButton({
    super.key,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 70, vertical: 16),
        decoration: BoxDecoration(
          color: AppColors.getstartedbutton,
          borderRadius: BorderRadius.circular(48),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [

            // Image
            Image.asset(
              imagePath,
              height: 24,
              width: 24,
            ),

            SizedBox(width: 10),

            // Text
            Text(
              AppText.getstarted,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1A1A2E),
              ),
            ),
          ],
        ),
      ),
    );
  }
}