import 'package:flutter/material.dart';

class BackgroundBlobs extends StatelessWidget {
  final double leftTopSize;
  final double rightTopSize;
  final Offset leftTopOffset;
  final Offset rightTopOffset;

  const BackgroundBlobs({
    super.key,
    this.leftTopSize = 240,
    this.rightTopSize = 200,
    this.leftTopOffset = const Offset(-95, -88),
    this.rightTopOffset = const Offset(-65, -70),
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: leftTopOffset.dy,
          left: leftTopOffset.dx,
          child: _Blob(
            size: leftTopSize,
            color: const Color(0xFF6366F1).withOpacity(0.08),
          ),
        ),

        Positioned(
          top: rightTopOffset.dy,
          right: rightTopOffset.dx,
          child: _Blob(
            size: rightTopSize,
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