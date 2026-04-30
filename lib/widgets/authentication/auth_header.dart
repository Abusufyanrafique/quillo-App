// lib/widgets/quillo_header_illustration.dart
import 'package:flutter/material.dart';
import 'package:quillo_app/utils/app_images.dart';

class QuilloHeaderIllustration extends StatelessWidget {
  const QuilloHeaderIllustration({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      child: Stack(
        alignment: Alignment.center,
        children: [

          // Decorative food emoji elements
          const Positioned(
            left: 30,
            top: -1,
            child:Image(image: AssetImage(AppImages.lemon)),
          ),
          const Positioned(
            right: 38,
            top: 18,
            child: Image(image: AssetImage(AppImages.leaf)),
          ),
           const Positioned(
            left: 30,
            top: 80,
            child:Image(image: AssetImage(AppImages.greenbell)),
          ),
          // Main bowl icon
         Container(
  height: 200,
  width: 300,
  child: const Center(
    child: Image(
      image: AssetImage(AppImages.illustrationauth),
      fit: BoxFit.fill,
      // 👈 IMPORTANT FIX
    ),
  ),
)
        ],
      ),
    );
  }
}