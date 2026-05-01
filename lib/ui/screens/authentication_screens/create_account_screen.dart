// lib/screens/create_account_screen.dart
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quillo_app/providers/auth_provider/auth_provider.dart';
import 'package:quillo_app/ui/screens/authentication_screens/wel_come_back_screen.dart';
import 'package:quillo_app/utils/app_images.dart';
import 'package:quillo_app/widgets/authentication/auth_header.dart';
import 'package:quillo_app/widgets/authentication/background_blobs.dart';
import 'package:quillo_app/widgets/authentication/divider_with_text.dart';
import 'package:quillo_app/widgets/authentication/field_label.dart';
import 'package:quillo_app/widgets/authentication/primary_button.dart';
import 'package:quillo_app/widgets/authentication/quillo_text_field.dart';
import 'package:quillo_app/widgets/authentication/social_button.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F7FB),
      body: Stack(
        children: [
       const BackgroundBlobs(
  leftTopOffset: Offset(-120, -95),
  rightTopOffset: Offset(-88, -65),
),
          // ── Main Content ───────────────────────────────────────────
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // ── Top Illustration ───────────────────────────────
                  const QuilloHeaderIllustration(),

                  // ── White Card Panel ───────────────────────────────
                  Padding(
                    padding: const EdgeInsets.only(left: 23.0, right: 23),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all( Radius.circular(28)),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x0F000000),
                            blurRadius: 24,
                            offset: Offset(0, -4),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.fromLTRB(24, 28, 24, 32),
                      child: Consumer<AuthProvider>(
                        builder: (context, auth, _) {
                          return Form(
                            key: auth.formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                // Title
                                _buildTitle(context),
                                const SizedBox(height: 28),

                                // Email field
                                const FieldLabel(text: 'Email'),
                                QuilloTextField(
                                  controller: auth.emailController,
                                  hintText: 'you@example.com',
                                  prefixIcon: Icons.mail_outline_rounded,
                                  keyboardType: TextInputType.emailAddress,
                                  validator: auth.validateEmail,
                                ),
                                const SizedBox(height: 20),

                                // Password field
                                const FieldLabel(text: 'Password'),
                                QuilloTextField(
                                  controller: auth.passwordController,
                                  hintText: 'Min. 8 characters',
                                  prefixIcon: Icons.lock_outline_rounded,
                                  obscureText: !auth.isPasswordVisible,
                                  validator: auth.validatePassword,
                                  suffixIcon: _VisibilityToggle(
                                    isVisible: auth.isPasswordVisible,
                                    onToggle: auth.togglePasswordVisibility,
                                  ),
                                ),
                                const SizedBox(height: 20),

                                // Confirm Password field
                                const FieldLabel(text: 'Confirm Password'),
                                QuilloTextField(
                                  controller: auth.confirmPasswordController,
                                  hintText: 'Repeat your password',
                                  prefixIcon: Icons.lock_outline_rounded,
                                  obscureText: !auth.isConfirmPasswordVisible,
                                  validator: auth.validateConfirmPassword,
                                  textInputAction: TextInputAction.done,
                                  suffixIcon: _VisibilityToggle(
                                    isVisible: auth.isConfirmPasswordVisible,
                                    onToggle:
                                        auth.toggleConfirmPasswordVisibility,
                                  ),
                                ),
                                const SizedBox(height: 28),

                                // Error message
                                if (auth.status == AuthStatus.error &&
                                    auth.errorMessage != null)
                                  _ErrorBanner(message: auth.errorMessage!),

                                // CTA Button
                                PrimaryButton(
                                  label: 'Create Account',
                                  onPressed: (){
                                    Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                    builder: (context) => const WelComeBackScreen(),
                                    ),
);
                                  },
                                ),
                                const SizedBox(height: 20),

                                // Divider
                                const DividerWithText(text: 'or continue with'),
                                const SizedBox(height: 16),

                                // Social buttons
                                _SocialRow(auth: auth),
                                const SizedBox(height: 20),

                                // Terms
                                _TermsText(),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Create account ',
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.w800,
                color: Color(0xFF1A1A2E),
              ),
            ),
            const Text('👋', style: TextStyle(fontSize: 22)),
          ],
        ),
        const SizedBox(height: 6),
        Center(
          child: RichText(
            text: TextSpan(
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xFF6B7280),
              ),
              children: [
                TextSpan(
                  text: 'Join QUILLO already cooking? ',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF6B7280),
                  ),
                ),
                TextSpan(
                  text: 'Sign in',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF6366F1),
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // TODO: Navigate to sign in screen
                    },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// ── Private sub-widgets ──────────────────────────────────────────────────────

class _VisibilityToggle extends StatelessWidget {
  final bool isVisible;
  final VoidCallback onToggle;

  const _VisibilityToggle({
    required this.isVisible,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isVisible
            ? Icons.visibility_outlined
            : Icons.visibility_off_outlined,
        size: 18,
        color: Color(0xFFA5ACCC),
      ),
      onPressed: onToggle,
    );
  }
}

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
            const TextSpan(text: 'By signing up you agree to our '),
            TextSpan(
              text: 'Terms',
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF6366F1),
              ),
              recognizer: TapGestureRecognizer()..onTap = () {},
            ),
            TextSpan(
              text: ' & ',
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xFF6B7280),
              ),
            ),
            TextSpan(
              text: 'Conditions',
              style: GoogleFonts.poppins(
                fontSize: 16,
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
          Expanded(
            child: Text(message),
          ),
        ],
      ),
    );
  }
}