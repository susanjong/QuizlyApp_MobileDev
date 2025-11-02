import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/widgets/social_button.dart';
import 'package:quiz_app/widgets/darkmode_theme.dart';
import 'package:quiz_app/routes/app_routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoginTab = true;
  bool _rememberMe = false;
  bool _obscurePassword = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final ThemeProvider _themeProvider = ThemeProvider();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    String email = _emailController.text;
    String password = _passwordController.text;

    AppRoutes.navigateTo(context, AppRoutes.home);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Login successful!',
          style: GoogleFonts.montserrat(fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  void _navigateToSignUp() {
    final currentTheme = _themeProvider.isDarkMode;

    setState(() {
      _isLoginTab = false;
    });

    Navigator.pushNamed(
      context,
      AppRoutes.signUp,
      arguments: {'isDarkMode': currentTheme},
    );

    Future.delayed(Duration.zero, () {
      setState(() {
        _isLoginTab = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _themeProvider,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: _themeProvider.gradientColors,
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
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
                      _buildEmailField(),
                      const SizedBox(height: 20),
                      _buildPasswordField(),
                      const SizedBox(height: 16),
                      _buildRememberMeRow(),
                      const SizedBox(height: 24),
                      _buildLoginButton(),
                      const SizedBox(height: 24),
                      _buildDivider(),
                      const SizedBox(height: 24),
                      _buildSocialButtons(),
                      const SizedBox(height: 20),
                    ],
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
              ),
            ),
            const SizedBox(width: 10),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Quizly',
                style: GoogleFonts.montserrat(
                  color: Color(0xFFCBE3B3),
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
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Create an account or log in to explore about our app',
          style: GoogleFonts.montserrat(
            color: _themeProvider.secondaryTextColor,
            fontSize: 14,
            fontWeight: FontWeight.w400,
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
              onTap: () {
                setState(() {
                  _isLoginTab = true;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: _isLoginTab
                      ? const Color(0xFFFF1493)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    'Log In',
                    style: GoogleFonts.montserrat(
                      color: _isLoginTab ? Colors.white : _themeProvider.primaryTextColor,
                      fontWeight: _isLoginTab ? FontWeight.w700 : FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: _navigateToSignUp,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: !_isLoginTab
                      ? const Color(0xFFFF1493)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    'Sign Up',
                    style: GoogleFonts.montserrat(
                      color: !_isLoginTab ? Colors.white : _themeProvider.primaryTextColor,
                      fontWeight: !_isLoginTab ? FontWeight.w700 : FontWeight.w600,
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
        TextField(
          controller: _emailController,
          style: GoogleFonts.montserrat(
            color: _themeProvider.primaryTextColor,
          ),
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'Lottebecketi@gmail.com',
            hintStyle: GoogleFonts.montserrat(
              color: _themeProvider.primaryTextColor.withValues(alpha: 0.4),
              fontWeight: FontWeight.w400,
            ),
            filled: true,
            fillColor: _themeProvider.inputBackgroundColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
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
        TextField(
          controller: _passwordController,
          obscureText: _obscurePassword,
          style: GoogleFonts.montserrat(
            color: _themeProvider.primaryTextColor,
          ),
          decoration: InputDecoration(
            hintText: '••••••••',
            hintStyle: GoogleFonts.montserrat(
              color: _themeProvider.primaryTextColor.withValues(alpha: 0.4),
              fontWeight: FontWeight.w400,
            ),
            filled: true,
            fillColor: _themeProvider.inputBackgroundColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
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

  Widget _buildRememberMeRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SizedBox(
              width: 20,
              height: 20,
              child: Checkbox(
                value: _rememberMe,
                onChanged: (value) {
                  setState(() {
                    _rememberMe = value ?? false;
                  });
                },
                fillColor: MaterialStateProperty.all(
                  _themeProvider.checkboxColor,
                ),
                checkColor: _themeProvider.primaryTextColor,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              'Remember me',
              style: GoogleFonts.montserrat(
                color: _themeProvider.primaryTextColor,
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'Forgot Password ?',
            style: GoogleFonts.montserrat(
              color: const Color(0xFF355F3B),
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: _handleLogin,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF355F3B).withValues(alpha: 0.8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          'Log In',
          style: GoogleFonts.montserrat(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Row(
      children: [
        Expanded(child: Divider(color: _themeProvider.dividerColor)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Or',
            style: GoogleFonts.montserrat(
              color: _themeProvider.secondaryTextColor,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Expanded(child: Divider(color: _themeProvider.dividerColor)),
      ],
    );
  }

  Widget _buildSocialButtons() {
    return Column(
      children: [
        SocialButton(
          text: 'Continue with Google',
          icon: Image.asset(
            'assets/images/logo_google.png',
            width: 20,
            height: 20,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}