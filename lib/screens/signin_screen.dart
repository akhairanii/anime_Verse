import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/app_scaffold.dart';
import 'signup_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordObscured = true;

  // Menyimpan data akun terdaftar (Email & Password)
  String? _registeredEmail;
  String? _registeredPassword;

  void _navigateToSignUp() async {
    // Membuka SignUpScreen dan menunggu data dikirim kembali setelah pendaftaran selesai
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignUpScreen()),
    );

    if (result != null && result is Map<String, String>) {
      setState(() {
        _registeredEmail = result['email'];
        _registeredPassword = result['password'];
        // Mengisi otomatis kolom email untuk kemudahan pengguna
        _emailController.text = _registeredEmail ?? '';
      });
    }
  }

  void _handleSignIn() {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Harap isi Email dan Password terlebih dahulu!'),
          backgroundColor: Colors.orangeAccent,
        ),
      );
      return;
    }

    // 1. Jika belum pernah mendaftar di SignUp
    if (_registeredEmail == null || _registeredPassword == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Akun belum terdaftar! Silakan buat akun terlebih dahulu.'),
          backgroundColor: Colors.redAccent,
          action: SnackBarAction(
            label: 'Sign Up',
            textColor: Colors.white,
            onPressed: _navigateToSignUp,
          ),
        ),
      );
      return;
    }

    // 2. Jika email/password yang dimasukkan tidak cocok
    if (email != _registeredEmail || password != _registeredPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Email atau Password salah!'),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    // 3. Jika sudah mendaftar dan input cocok -> LANGSUNG MASUK KE HOME
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
                    SizedBox(height: screenHeight * 0.14),
                    Text(
                      'Welcome Back!',
                      style: TextStyle(
                        fontSize: screenWidth * (isLargeScreen ? 0.06 : 0.1),
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Text(
                      'Sign in to continue your anime journey',
                      style: TextStyle(
                        fontSize: screenWidth * 0.035,
                        fontWeight: FontWeight.w500,
                        color: Colors.white70,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: screenHeight * 0.05),

                    //Text Field Email
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
                        prefixIcon: Icon(Icons.email, color: Colors.white70, size: screenWidth * 0.06),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.025,
                          horizontal: screenWidth * 0.055,
                        ),
                      ),
                      style: TextStyle(fontSize: screenWidth * 0.04, color: Colors.white),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: screenHeight * 0.02),

                    //Text Field Password
                    TextField(
                      controller: _passwordController,
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
                          vertical: screenHeight * 0.025,
                          horizontal: screenWidth * 0.055,
                        ),
                      ),
                      style: TextStyle(fontSize: screenWidth * 0.04, color: Colors.white),
                      obscureText: _isPasswordObscured,
                    ),
                    SizedBox(height: screenHeight * 0.01),

                    //Forgot Password
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(fontSize: screenWidth * 0.035, color: Colors.blue.shade300),
                        ),
                        onPressed: () {
                          // TODO: Implement forgot password functionality
                        },
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03),

                    //Sign In Button
                    SizedBox(
                      width: double.infinity,
                      height: screenHeight * 0.075,
                      child: ElevatedButton(
                        onPressed: _handleSignIn,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue.withValues(alpha: 0.8),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(screenWidth * 0.03),
                          ),
                          elevation: 5,
                        ),
                        child: Text(
                          'Sign In',
                          style: TextStyle(fontSize: screenWidth * 0.045, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03),

                    // Or Divider
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

                    // Google Sign In Button
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
                          'Continue with Google',
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
                    SizedBox(height: screenHeight * 0.04),

                    //Don't have an account? Sign Up
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: TextStyle(fontSize: screenWidth * 0.04, color: Colors.white70),
                        ),
                        TextButton(
                          onPressed: _navigateToSignUp,
                          child: Text(
                            'Sign Up',
                            style: TextStyle(fontSize: screenWidth * 0.04, fontWeight: FontWeight.w600, color: Colors.blue.shade300),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.05),
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