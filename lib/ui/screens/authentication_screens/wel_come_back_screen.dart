import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quillo_app/providers/auth_provider/auth_provider.dart';
import 'package:quillo_app/ui/screens/authentication_screens/reset_password.dart';
import 'package:quillo_app/utils/app_images.dart';
import 'package:quillo_app/widgets/authentication/auth_header.dart';
import 'package:quillo_app/widgets/authentication/background_blobs.dart';
import 'package:quillo_app/widgets/authentication/divider_with_text.dart';
import 'package:quillo_app/widgets/authentication/field_label.dart';
import 'package:quillo_app/widgets/authentication/primary_button.dart';
import 'package:quillo_app/widgets/authentication/quillo_text_field.dart';
import 'package:quillo_app/widgets/authentication/social_button.dart';

class WelComeBackScreen extends StatefulWidget {
  const WelComeBackScreen({super.key});

  @override
  State<WelComeBackScreen> createState() => _WelComeBackScreenState();
}

class _WelComeBackScreenState extends State<WelComeBackScreen> {
  final _formKey = GlobalKey<FormState>(); // ── Apna alag formKey

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      body: Stack(
        children: [
          const BackgroundBlobs(
  leftTopOffset: Offset(-58, -59),
  rightTopOffset: Offset(-39, -39),
),
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
                        padding: const EdgeInsets.symmetric(horizontal: 23,vertical: 0),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(28)),
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
                                key: _formKey, // ── auth.formKey ki jagah _formKey
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    _buildTitle(),
                                    const SizedBox(height: 28),
                                    const FieldLabel(text: 'Email'),
                                    QuilloTextField(
                                      controller: auth.emailController,
                                      hintText: 'you@example.com',
                                      prefixIcon: Icons.mail_outline_rounded,
                                      keyboardType: TextInputType.emailAddress,
                                      validator: auth.validateEmail,
                                    ),
                                    const SizedBox(height: 20),
                                    const FieldLabel(text: 'Password'),
                                    QuilloTextField(
                                      controller: auth.passwordController,
                                      hintText: 'Min. 8 characters',
                                      prefixIcon: Icons.lock_outline_rounded,
                                      obscureText: !auth.isPasswordVisible,
                                      validator: auth.validatePassword,
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          auth.isPasswordVisible
                                              ? Icons.visibility_outlined
                                              : Icons.visibility_off_outlined,
                                          size: 18,
                                        ),
                                        onPressed: auth.togglePasswordVisibility,
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    if (auth.status == AuthStatus.error &&
                                        auth.errorMessage != null)
                                      _ErrorBanner(message: auth.errorMessage!),
                                    PrimaryButton(
                                      label: 'Sign In',
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          // auth.signIn(); // apna sign in method
                                           Navigator.push(
                                           context,
                                           MaterialPageRoute(
                                           builder: (context) => const ResetPassword(),
                                          ),
                                          );
                                        }
                                      },
                                    ),
                                    const SizedBox(height: 20),
                                    const DividerWithText(text: 'or continue with'),
                                    const SizedBox(height: 16),
                                    _SocialRow(auth: auth),
                                    const SizedBox(height: 20),
                                    _TermsText(),
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
          'Welcome back 🍳',
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.w800,
            color: const Color(0xFF1A1A2E),
          ),
        ),
        const SizedBox(height: 8),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: GoogleFonts.poppins(
              fontSize: 13,
              color: const Color(0xFF6B7280),
            ),
            children: [
              const TextSpan(text: 'Sign in to your QUILLO account.'),
              TextSpan(
                text: 'Create one?',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF6366F1),
                ),
                recognizer: TapGestureRecognizer()..onTap = () {},
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
            const TextSpan(text: 'Dont have an account?'),
            TextSpan(
              text: ' Sign up free',
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
