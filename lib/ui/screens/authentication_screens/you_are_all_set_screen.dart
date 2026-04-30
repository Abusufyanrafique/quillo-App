import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quillo_app/providers/auth_provider/auth_provider.dart';
import 'package:quillo_app/utils/app_images.dart';
import 'package:quillo_app/widgets/authentication/auth_header.dart';
import 'package:quillo_app/widgets/authentication/background_blobs.dart';
import 'package:quillo_app/widgets/authentication/social_button.dart';
import 'package:quillo_app/widgets/authentication/success_card.dart';

class YouAreAllSetScreen extends StatefulWidget {
  const YouAreAllSetScreen({super.key});

  @override
  State<YouAreAllSetScreen> createState() => _YouAreAllSetScreenState();
}

class _YouAreAllSetScreenState extends State<YouAreAllSetScreen> {
  final _formKey = GlobalKey<FormState>(); // ── Apna alag formKey

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      body: Stack(
        children: [
          const BackgroundBlobs(),
          LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: Column(
                    children: [
                      const QuilloHeaderIllustration(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 0),
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(24, 28, 24, 32),
                          child: Consumer<AuthProvider>(
                            builder: (context, auth, _) {
                              return Form(
                                key: _formKey, 
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    // _buildTitle(),
                                    const SizedBox(height: 28),
                                    SuccessCard(
                                    onPressed: () {
                                      // Navigate to home
                                  //  Navigator.pushReplacementNamed(context, '/home');
                                  },)
                                  ],
                                
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Column(
      children: [
        Text(
          'Reset password 🔑',
            textAlign: TextAlign.start,
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.w800,
            color: const Color(0xFF1A1A2E),
          ),
        ),
        const SizedBox(height: 8),
        RichText(         
          text: TextSpan(
            style: GoogleFonts.poppins(
              fontSize: 13,
              color: const Color(0xFF6B7280),
            ),
            children: [
               TextSpan(text: 'Enter your email and we ll send a magic link to reset your password.',
              style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF6B7280),
          ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ================= SOCIAL ROW =================

class _SocialRow extends StatelessWidget {
  final AuthProvider auth;

  const _SocialRow({required this.auth});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SocialButton(
          label: 'Google',
          imagepath: AppImages.google,
          onPressed: () => auth.signInWithGoogle(),
        ),
        const SizedBox(width: 12),
        SocialButton(
          label: 'Apple',
          imagepath: AppImages.apple,
        ),
      ],
    );
  }
}

// ================= ERROR =================

class _ErrorBanner extends StatelessWidget {
  final String message;

  const _ErrorBanner({required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.red.shade50,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.red.shade200),
      ),
      child: Row(
        children: [
          Icon(Icons.error_outline, size: 16, color: Colors.red.shade600),
          const SizedBox(width: 8),
          Expanded(child: Text(message)),
        ],
      ),
    );
  }
}
class _TermsText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xFF6B7280),
          ),
          children: [
            const TextSpan(text: 'Remembered it?'),
            TextSpan(
              text: ' Sign in',
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF6366F1),
              ),
              recognizer: TapGestureRecognizer()..onTap = () {},
            ),
          ],
        ),
      ),
    );
  }
}
