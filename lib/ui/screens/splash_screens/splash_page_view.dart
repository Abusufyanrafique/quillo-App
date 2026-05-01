// lib/ui/screens/splash_screens/splash_page_view.dart
import 'package:flutter/material.dart';
import 'package:quillo_app/ui/screens/splash_screens/happy_cooking.dart';
import 'package:quillo_app/ui/screens/splash_screens/scan_and_discover_recipe.dart';
import 'package:quillo_app/widgets/splash_screens/splash_indicator.dart';

class SplashPageView extends StatefulWidget {
  const SplashPageView({super.key});

  @override
  State<SplashPageView> createState() => _SplashPageViewState();
}

class _SplashPageViewState extends State<SplashPageView> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<Color> _bgColors = const [
    Color(0xFFEFE7DE), // HappyCooking
    Color(0xFFF5F7FB), // ScanAndDiscoverRecipe
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgColors[_currentPage],
      body: Column(
        children: [
          // ── Pages ─────────────────────────────────────────
          Expanded(
            child: PageView(
              controller: _controller,
              onPageChanged: (index) {
                setState(() => _currentPage = index);
              },
              children: const [
                HappyCooking(),
                ScanAndDiscoverRecipe(),
              ],
            ),
          ),

          // ── Dot Indicator ──────────────────────────────────
          SplashIndicator(
            currentPage: _currentPage,
            pageCount: 2,
          ),

          const SizedBox(height: 24),
        ],
      ),
    );
  }
}