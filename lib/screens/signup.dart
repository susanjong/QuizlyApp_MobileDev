import 'package:flutter/material.dart';
import 'package:quiz_app/models/user_models.dart';
import 'package:quiz_app/routes/app_routes.dart';
import 'package:quiz_app/widgets/gradient_background.dart';
import 'package:quiz_app/widgets/darkmode_theme.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final ThemeProvider _themeProvider = ThemeProvider(); //ini untuk atur darkmodenya

  bool _isSignUpTab = true;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Ambil argumen dari halaman sebelumnya agar ini bisa stay apabila
    // theme di login di set masih status dark/light mode (sinkron)
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    if (args != null && args['isDarkMode'] != null) {
      _themeProvider.setTheme(args['isDarkMode']);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _handleSignUp() {
    UserModel newUser = UserModel(
      name: _nameController.text.isEmpty ? 'Guest User' : _nameController.text,
      email: _emailController.text.isEmpty ? 'guest@example.com' : _emailController.text,
      password: _passwordController.text.isEmpty ? '123456' : _passwordController.text,
    );

    //Navigator.pushReplacement( context, MaterialPageRoute(builder: (context)
    // => const HomePage()),
    // );

    AppRoutes.navigateTo(context, AppRoutes.home);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Account created successfully!',
          style: GoogleFonts.montserrat(),
        ),
      ),
    );
  }

  void _navigateToLogin() {
    setState(() {
      _isSignUpTab = false;
    });
    AppRoutes.goBack(context);
  }

  String? _validateEmail(String? value) {
    return null;
  }

  String? _validatePassword(String? value) {
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    return null;
  }

  String? _validateName(String? value) {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _themeProvider,
      builder: (context, child) {
        return GradientBackground(
          colors: _themeProvider.gradientColors,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        _buildHeader(),
                        const SizedBox(height: 40),
                        _buildTitle(),
                        const SizedBox(height: 32),
                        _buildTabs(),
                        const SizedBox(height: 32),
                        _buildNameField(),
                        const SizedBox(height: 20),
                        _buildEmailField(),
                        const SizedBox(height: 20),
                        _buildPasswordField(),
                        const SizedBox(height: 20),
                        _buildConfirmPasswordField(),
                        const SizedBox(height: 32),
                        _buildSignUpButton(),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.asset(
                'assets/images/Logo.png',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE06B9F),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.quiz,
                      size: 20,
                      color: Colors.white,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(width: 10),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Quizly',
                style: GoogleFonts.montserrat(
                  color: const Color(0xFFCBE3B3),
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),

        DarkModeToggle(themeProvider: _themeProvider),
      ],
    );
  }

  Widget _buildTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Get Started now',
          style: GoogleFonts.montserrat(
            color: _themeProvider.primaryTextColor,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Create an account or log in to explore about our app',
          style: GoogleFonts.montserrat(
            color: _themeProvider.secondaryTextColor,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget _buildTabs() {
    return Container(
      decoration: BoxDecoration(
        color: _themeProvider.tabBackgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: _navigateToLogin,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: !_isSignUpTab ? const Color(0xFFFF1493) : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    'Log In',
                    style: GoogleFonts.montserrat(
                      color: !_isSignUpTab ? Colors.white : _themeProvider.primaryTextColor,
                      fontWeight: !_isSignUpTab ? FontWeight.bold : FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _isSignUpTab = true;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: _isSignUpTab ? const Color(0xFFFF1493) : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    'Sign Up',
                    style: GoogleFonts.montserrat(
                      color: _isSignUpTab ? Colors.white : _themeProvider.primaryTextColor,
                      fontWeight: _isSignUpTab ? FontWeight.bold : FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Full Name',
          style: GoogleFonts.montserrat(
            color: _themeProvider.primaryTextColor,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: _nameController,
          style: GoogleFonts.montserrat(color: _themeProvider.primaryTextColor),
          validator: _validateName,
          decoration: InputDecoration(
            hintText: 'Enter your name',
            hintStyle: GoogleFonts.montserrat(color: _themeProvider.hintTextColor),
            filled: true,
            fillColor: _themeProvider.inputBackgroundColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red),
            ),
            errorStyle: GoogleFonts.montserrat(color: Colors.redAccent),
            contentPadding: const EdgeInsets.all(16),
          ),
        ),
      ],
    );
  }

  Widget _buildEmailField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Email',
          style: GoogleFonts.montserrat(
            color: _themeProvider.primaryTextColor,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: _emailController,
          style: GoogleFonts.montserrat(color: _themeProvider.primaryTextColor),
          keyboardType: TextInputType.emailAddress,
          validator: _validateEmail,
          decoration: InputDecoration(
            hintText: 'Enter your email',
            hintStyle: GoogleFonts.montserrat(color: _themeProvider.hintTextColor),
            filled: true,
            fillColor: _themeProvider.inputBackgroundColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red),
            ),
            errorStyle: GoogleFonts.montserrat(color: Colors.redAccent),
            contentPadding: const EdgeInsets.all(16),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Password',
          style: GoogleFonts.montserrat(
            color: _themeProvider.primaryTextColor,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: _passwordController,
          obscureText: _obscurePassword,
          style: GoogleFonts.montserrat(color: _themeProvider.primaryTextColor),
          validator: _validatePassword,
          decoration: InputDecoration(
            hintText: '••••••••',
            hintStyle: GoogleFonts.montserrat(color: _themeProvider.hintTextColor),
            filled: true,
            fillColor: _themeProvider.inputBackgroundColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red),
            ),
            errorStyle: GoogleFonts.montserrat(color: Colors.redAccent),
            contentPadding: const EdgeInsets.all(16),
            suffixIcon: IconButton(
              icon: Icon(
                _obscurePassword ? Icons.visibility_off : Icons.visibility,
                color: _themeProvider.primaryTextColor,
              ),
              onPressed: () {
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildConfirmPasswordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Confirm Password',
          style: GoogleFonts.montserrat(
            color: _themeProvider.primaryTextColor,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: _confirmPasswordController,
          obscureText: _obscureConfirmPassword,
          style: GoogleFonts.montserrat(color: _themeProvider.primaryTextColor),
          validator: _validateConfirmPassword,
          decoration: InputDecoration(
            hintText: '••••••••',
            hintStyle: GoogleFonts.montserrat(color: _themeProvider.hintTextColor),
            filled: true,
            fillColor: _themeProvider.inputBackgroundColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red),
            ),
            errorStyle: GoogleFonts.montserrat(color: Colors.redAccent),
            contentPadding: const EdgeInsets.all(16),
            suffixIcon: IconButton(
              icon: Icon(
                _obscureConfirmPassword
                    ? Icons.visibility_off
                    : Icons.visibility,
                color: _themeProvider.primaryTextColor,
              ),
              onPressed: () {
                setState(() {
                  _obscureConfirmPassword = !_obscureConfirmPassword;
                });
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSignUpButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: _handleSignUp,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF355F3B).withValues(alpha: 0.8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          'Sign Up',
          style: GoogleFonts.montserrat(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}