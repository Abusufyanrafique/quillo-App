// lib/widgets/field_label.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quillo_app/utils/app_colors.dart';

class FieldLabel extends StatelessWidget {
  final String text;
  final EdgeInsets padding;

  const FieldLabel({
    super.key,
    required this.text,
    this.padding = const EdgeInsets.only(bottom: 8,left: 4),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(text.toUpperCase(), style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color:AppColors.textfiledlable,
                ),),
    );
  }
}