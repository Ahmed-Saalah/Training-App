import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_settings.dart';
import 'package:flutter_application_1/scrrens/sign_In.dart';
import 'package:flutter_application_1/scrrens/welcom_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    handleLogin();
  }

  Future<void> handleLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? userPhoneNumber = prefs.getString(AppSettings.emailSharedPrefsKey);
    if (userPhoneNumber == null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SignInPage()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
