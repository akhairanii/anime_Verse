import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/app_scaffold.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool _isPasswordObscured = true;
  bool _isConfirmPasswordObscured = true;

  void _handleSignUp() {
    final username = _usernameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim();

    if (username.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Harap isi semua kolom terlebih dahulu!'),
          backgroundColor: Colors.orangeAccent,
        ),
      );
      return;
    }

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password dan Confirm Password tidak cocok!'),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Akun berhasil dibuat! Silakan Sign In.'),
        backgroundColor: Colors.green,
      ),
    );

    // Mengirimkan data akun yang baru dibuat ke halaman SignIn
    Navigator.pop(context, {
      'email': email,
      'password': password,
    });
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return AppScaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isLargeScreen = constraints.maxWidth > 600;
          final maxWidth = isLargeScreen ? 400.0 : constraints.maxWidth;

          return SingleChildScrollView(
            child: Center(
              child: Container(
                width: maxWidth,
                padding: EdgeInsets.all(screenWidth * 0.06),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: screenHeight * 0.08),

                    Text(
                      'Create Account',
                      style: TextStyle(
                        fontSize: screenWidth * (isLargeScreen ? 0.06 : 0.09),
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Text(
                      'Join AnimeVerse and start your journey',
                      style: TextStyle(
                        fontSize: screenWidth * 0.035,
                        fontWeight: FontWeight.w500,
                        color: Colors.white70,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: screenHeight * 0.04),

                    TextField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        labelText: 'Username',
                        labelStyle: TextStyle(fontSize: screenWidth * 0.04, color: Colors.white70),
                        filled: true,
                        fillColor: Colors.white.withValues(alpha: 0.1),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(screenWidth * 0.03),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: Icon(Icons.person_outline, color: Colors.white70, size: screenWidth * 0.06),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.022,
                          horizontal: screenWidth * 0.055,
                        ),
                      ),
                      style: TextStyle(fontSize: screenWidth * 0.04, color: Colors.white),
                    ),
                    SizedBox(height: screenHeight * 0.02),

                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(fontSize: screenWidth * 0.04, color: Colors.white70),
                        filled: true,
                        fillColor: Colors.white.withValues(alpha: 0.1),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(screenWidth * 0.03),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: Icon(Icons.email_outlined, color: Colors.white70, size: screenWidth * 0.06),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.022,
                          horizontal: screenWidth * 0.055,
                        ),
                      ),
                      style: TextStyle(fontSize: screenWidth * 0.04, color: Colors.white),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: screenHeight * 0.02),

                    TextField(
                      controller: _passwordController,
                      obscureText: _isPasswordObscured,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(fontSize: screenWidth * 0.04, color: Colors.white70),
                        filled: true,
                        fillColor: Colors.white.withValues(alpha: 0.1),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(screenWidth * 0.03),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: Icon(Icons.lock_outline, color: Colors.white70, size: screenWidth * 0.06),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordObscured ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                            color: Colors.white70,
                            size: screenWidth * 0.06,
                          ),
                          onPressed: () {
                            setState(() {
                              _isPasswordObscured = !_isPasswordObscured;
                            });
                          },
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.022,
                          horizontal: screenWidth * 0.055,
                        ),
                      ),
                      style: TextStyle(fontSize: screenWidth * 0.04, color: Colors.white),
                    ),
                    SizedBox(height: screenHeight * 0.02),

                    TextField(
                      controller: _confirmPasswordController,
                      obscureText: _isConfirmPasswordObscured,
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        labelStyle: TextStyle(fontSize: screenWidth * 0.04, color: Colors.white70),
                        filled: true,
                        fillColor: Colors.white.withValues(alpha: 0.1),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(screenWidth * 0.03),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: Icon(Icons.lock_reset, color: Colors.white70, size: screenWidth * 0.06),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isConfirmPasswordObscured ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                            color: Colors.white70,
                            size: screenWidth * 0.06,
                          ),
                          onPressed: () {
                            setState(() {
                              _isConfirmPasswordObscured = !_isConfirmPasswordObscured;
                            });
                          },
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.022,
                          horizontal: screenWidth * 0.055,
                        ),
                      ),
                      style: TextStyle(fontSize: screenWidth * 0.04, color: Colors.white),
                    ),
                    SizedBox(height: screenHeight * 0.035),

                    SizedBox(
                      width: double.infinity,
                      height: screenHeight * 0.075,
                      child: ElevatedButton(
                        onPressed: _handleSignUp,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue.withValues(alpha: 0.8),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(screenWidth * 0.03),
                          ),
                          elevation: 5,
                        ),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(fontSize: screenWidth * 0.045, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03),

                    Row(
                      children: [
                        Expanded(child: Divider(color: Colors.white.withValues(alpha: 0.3), thickness: 1)),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
                          child: Text('or', style: TextStyle(fontSize: screenWidth * 0.035, color: Colors.white70)),
                        ),
                        Expanded(child: Divider(color: Colors.white.withValues(alpha: 0.3), thickness: 1)),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.03),

                    SizedBox(
                      width: double.infinity,
                      height: screenHeight * 0.075,
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          'assets/images/google_icon.svg',
                          height: screenWidth * 0.06,
                          width: screenWidth * 0.06,
                        ),
                        label: Text(
                          'Sign Up with Google',
                          style: TextStyle(fontSize: screenWidth * 0.04, fontWeight: FontWeight.w500, color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black45,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(screenWidth * 0.03),
                            side: const BorderSide(color: Colors.black45, width: 1),
                          ),
                          elevation: 3,
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account? ",
                          style: TextStyle(fontSize: screenWidth * 0.04, color: Colors.white70),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Sign In',
                            style: TextStyle(fontSize: screenWidth * 0.04, fontWeight: FontWeight.w600, color: Colors.blue.shade300),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.04),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}