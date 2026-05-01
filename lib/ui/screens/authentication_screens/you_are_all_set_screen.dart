import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quillo_app/providers/auth_provider/auth_provider.dart';
import 'package:quillo_app/widgets/authentication/auth_header.dart';
import 'package:quillo_app/widgets/authentication/background_blobs.dart';
import 'package:quillo_app/widgets/authentication/success_card.dart';

class YouAreAllSetScreen extends StatefulWidget {
  const YouAreAllSetScreen({super.key});

  @override
  State<YouAreAllSetScreen> createState() => _YouAreAllSetScreenState();
}

class _YouAreAllSetScreenState extends State<YouAreAllSetScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      body: Stack(
        children: [
          // ── Background Blobs ───────────────────────────────────────
          const BackgroundBlobs(
            leftTopOffset: Offset(-77, -65),
            rightTopOffset: Offset(-57, -57),
          ),

          // ── Bottom-left blob ───────────────────────────────────────
          Positioned(
            top: 387,
            left: -50,
            child: Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                color: const Color(0xFF6366F1).withOpacity(0.06),
                shape: BoxShape.circle,
              ),
            ),
          ),

          // ── Main Content ───────────────────────────────────────────
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
                        padding: const EdgeInsets.symmetric(
                          horizontal: 0,
                          vertical: 0,
                        ),
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(24, 28, 24, 32),
                          child: Consumer<AuthProvider>(
                            builder: (context, auth, _) {
                              return Form(
                                key: _formKey,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    const SizedBox(height: 28),

                                    SuccessCard(
                                      onPressed: () {
                                        // Navigator.pushReplacementNamed(context, '/home');
                                      },
                                    ),
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
}