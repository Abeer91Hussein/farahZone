import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  static const Color cream = Color(0xFFF3EDE2);
  static const Color navy = Color(0xFF1B2A4A);
  static const Color gold = Color(0xFFD4AF37);

  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cream,

      // =====================================================
      // APP BAR
      // =====================================================
      appBar: AppBar(
        backgroundColor: cream,
        elevation: 0,
        surfaceTintColor: Colors.transparent,

        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: navy, size: 20),
          onPressed: () {
            Navigator.pop(context);
          },
        ),

        title: const Text(
          'FARAH ZONE',
          style: TextStyle(
            color: navy,
            fontSize: 18,
            letterSpacing: 2,
            fontWeight: FontWeight.w600,
            fontFamily: 'LibertinusMath'
          ),
        ),

        centerTitle: true,
      ),

      // =====================================================
      // BODY
      // =====================================================
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 40),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(28),

                boxShadow: [
                  BoxShadow(
                    color: navy.withOpacity(0.08),
                    blurRadius: 25,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),

              child: Form(
                key: _formKey,

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // =================================================
                    // LOGO
                    // =================================================
                    Center(
                      child: Container(
                        width: 65,
                        height: 65,
                        alignment: Alignment.center,

                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: gold, width: 1.5),
                        ),

                        child: const Text(
                          'FZ',
                          style: TextStyle(
                            color: navy,
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'LibertinusMath'
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 25),

                    // =================================================
                    // TITLE
                    // =================================================
                    const Center(
                      child: Text(
                        'Create Your Account',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'LibertinusMath',
                          fontSize: 31,
                          fontWeight: FontWeight.w600,
                          color: navy,
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),

                    Center(
                      child: Text(
                        'Join Farah Zone and start planning your perfect day.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: navy.withOpacity(0.6),
                          fontSize: 13,
                          height: 1.5,
                          fontFamily: 'LibertinusMath'
                        ),
                      ),
                    ),

                    const SizedBox(height: 35),

                    // =================================================
                    // FULL NAME
                    // =================================================
                    const Text(
                      'Full Name',
                      style: TextStyle(
                        color: navy,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'LibertinusMath'
                      ),
                    ),

                    const SizedBox(height: 8),

                    TextFormField(
                      controller: nameController,

                      style: const TextStyle(color: navy),

                      decoration: _inputDecoration(
                        hint: 'Enter your full name',
                        icon: Icons.person_outline,

                      ),

                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }

                        return null;
                      },
                    ),

                    const SizedBox(height: 20),

                    // =================================================
                    // EMAIL
                    // =================================================
                    const Text(
                      'Email Address',
                      style: TextStyle(
                        color: navy,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'LibertinusMath'
                      ),
                    ),

                    const SizedBox(height: 8),

                    TextFormField(
                      controller: emailController,

                      keyboardType: TextInputType.emailAddress,

                      style: const TextStyle(color: navy),

                      decoration: _inputDecoration(
                        hint: 'Enter your email',
                        icon: Icons.email_outlined,
                      ),

                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }

                        if (!value.contains('@')) {
                          return 'Please enter a valid email';
                        }

                        return null;
                      },
                    ),

                    const SizedBox(height: 20),

                    // =================================================
                    // PASSWORD
                    // =================================================
                    const Text(
                      'Password',
                      style: TextStyle(
                        color: navy,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'LibertinusMath'
                      ),
                    ),

                    const SizedBox(height: 8),

                    TextFormField(
                      controller: passwordController,

                      obscureText: _obscurePassword,

                      style: const TextStyle(color: navy),

                      decoration:
                          _inputDecoration(
                            hint: 'Create a password',
                            icon: Icons.lock_outline,
                          ).copyWith(
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _obscurePassword = !_obscurePassword;
                                });
                              },
                              icon: Icon(
                                _obscurePassword
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                color: navy.withOpacity(0.55),
                                size: 20,
                              ),
                            ),
                          ),

                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please create a password';
                        }

                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }

                        return null;
                      },
                    ),

                    const SizedBox(height: 20),

                    // =================================================
                    // CONFIRM PASSWORD
                    // =================================================
                    const Text(
                      'Confirm Password',
                      style: TextStyle(
                        color: navy,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'LibertinusMath'
                      ),
                    ),

                    const SizedBox(height: 8),

                    TextFormField(
                      controller: confirmPasswordController,

                      obscureText: _obscureConfirmPassword,

                      style: const TextStyle(color: navy),

                      decoration:
                          _inputDecoration(
                            hint: 'Confirm your password',
                            icon: Icons.lock_reset_outlined,
                          ).copyWith(
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _obscureConfirmPassword =
                                      !_obscureConfirmPassword;
                                });
                              },
                              icon: Icon(
                                _obscureConfirmPassword
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                color: navy.withOpacity(0.55),
                                size: 20,
                              ),
                            ),
                          ),

                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please confirm your password';
                        }

                        if (value != passwordController.text) {
                          return 'Passwords do not match';
                        }

                        return null;
                      },
                    ),

                    const SizedBox(height: 30),

                    // =================================================
                    // SIGN UP BUTTON
                    // =================================================
                    SizedBox(
                      width: double.infinity,
                      height: 52,

                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // SIGN UP ACTION HERE
                          }
                        },

                        style: ElevatedButton.styleFrom(
                          backgroundColor: navy,
                          foregroundColor: Colors.white,
                          elevation: 0,

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),

                        child: const Text(
                          'CREATE ACCOUNT',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.3,
                            fontFamily: 'LibertinusMath'
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 25),

                    // =================================================
                    // LOGIN
                    // =================================================
                    Center(
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        children: [
                          Text(
                            'Already have an account? ',
                            style: TextStyle(
                              color: navy.withOpacity(0.6),
                              fontSize: 13,
                              fontFamily: 'LibertinusMath'
                            ),
                          ),

                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },

                            child: const Text(
                              'Login',
                              style: TextStyle(
                                color: navy,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'LibertinusMath'
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // =========================================================
  // INPUT DECORATION
  // =========================================================

  InputDecoration _inputDecoration({
    required String hint,
    required IconData icon,
  }) {
    return InputDecoration(
      hintText: hint,

      hintStyle: TextStyle(color: navy.withOpacity(0.35), fontSize: 13),

      prefixIcon: Icon(icon, color: navy.withOpacity(0.55), size: 20),

      filled: true,
      fillColor: cream.withOpacity(0.55),

      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: navy.withOpacity(0.10)),
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: navy.withOpacity(0.10)),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: gold, width: 1.4),
      ),

      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.redAccent),
      ),

      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.redAccent),
      ),
    );
  }
}
