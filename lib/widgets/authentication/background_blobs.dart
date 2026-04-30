import 'package:flutter/material.dart';

class BackgroundBlobs extends StatelessWidget {
  const BackgroundBlobs({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Top-left blob
        Positioned(
          top: -95,
          left: -88,
          child: _Blob(
            size: 240,
            color: const Color(0xFF6366F1).withOpacity(0.08),
          ),
        ),

        // Top-right blob
        Positioned(
          top: -65,
          right: -70,
          child: _Blob(
            size: 200,
            color: const Color(0xFFFACC15).withOpacity(0.11),
          ),
        ),
      ],
    );
  }
}

class _Blob extends StatelessWidget {
  final double size;
  final Color color;

  const _Blob({
    required this.size,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}