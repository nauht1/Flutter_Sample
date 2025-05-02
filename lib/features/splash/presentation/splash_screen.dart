import 'package:flutter_app_sample/features/auth/data/models/user_model.dart';
import 'package:flutter_app_sample/features/auth/presentation/provider/user_provider.dart';
import 'package:flutter_app_sample/features/auth/presentation/screens/login_screen.dart';
import 'package:flutter_app_sample/features/main/presentation/main_screen.dart';
import 'package:flutter_app_sample/services/api_service.dart';
import 'package:flutter_app_sample/services/auth_service.dart';
import 'package:flutter_app_sample/utils/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final authService = AuthService();

  @override
  void initState() {
    super.initState();
    _initApp();
  }

  Future<void> _initApp() async {
    final accessToken = await SharedPrefs.getAccessToken();
    await Provider.of<UserProvider>(context, listen: false).loadUserInfoFromPrefs();

    if (accessToken != null) {
      final refreshed = await authService.refreshToken();
      if (refreshed) {
        _goToMain();
      } else {
        await SharedPrefs.clearTokens();
        _goToLogin();
      }
    } else {
      _goToLogin();
    }
  }

  void _goToLogin() {
    Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (_) => const LoginScreen()));
  }

  void _goToMain() {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const MainScreen()),
          (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'lib/assets/images/logo.png',
              width: 120,
              height: 120,
            ),
            const SizedBox(height: 24),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }

}