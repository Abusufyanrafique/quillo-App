import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quillo_app/utils/app_colors.dart';

class QuilloButton extends StatelessWidget {
  final String imagePath;
  final VoidCallback onTap;

  const QuilloButton({
    super.key,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 45.6,
        width: 119.79,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Color(0xFF6366F1).withOpacity(0.13),
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
          
              Image.asset(
                imagePath,
                height: 24,
                width: 24,
              ),
          
              Text(
                "QUILLO",
                style: GoogleFonts.poppins(
                  fontSize: 18.42,
                  fontWeight: FontWeight.w700,
                  color: AppColors.splashscreensecondtext,
                  letterSpacing: -0.49
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}