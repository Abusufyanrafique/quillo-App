// lib/widgets/divider_with_text.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quillo_app/utils/app_colors.dart';


class DividerWithText extends StatelessWidget {
  final String text;

  const DividerWithText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            color:Color(0xFFE8EBF5), 
            thickness: 1
            ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            text, 
           style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color:AppColors.dividercolor,
                ),
            ),
        ),
        const Expanded(
          child: Divider(
            color:Color(0xFFE8EBF5), 
            thickness: 1
            ),
        ),
      ],
    );
  }
}