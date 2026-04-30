// lib/widgets/social_button.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class SocialButton extends StatelessWidget {
  final String label;
  final String? imagepath;
  final VoidCallback? onPressed;

  const SocialButton({
    super.key,
    required this.label,
    this.onPressed,  
    this.imagepath,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 46,
        child: OutlinedButton.icon(
          onPressed: onPressed,
          icon: imagepath != null
              ? Image.asset(
                  imagepath!,
                  width: 20,
                  height: 20,
                )
              : SizedBox.shrink(),
          label: Text(
            label, 
           style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color:Color(0xFF1A1A2E),
                ),
            ),
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.white,
            // foregroundColor: AppColors.textPrimary,
            elevation: 0,
            side:  BorderSide(
              color: Color(0xFF6B7080).withOpacity(0.6),
              width: 1.5,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12),
          ),
        ),
      ),
    );
  }
}