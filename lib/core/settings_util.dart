import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_settings.dart';
import 'package:flutter_application_1/scrrens/sign_In.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsUtil {
  static Future<void> signOutFlow(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, 
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Sign out'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
              Text('Are you sure you want to sign out?'),
              Text('You will need to log in again.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('YES'),
              onPressed: () async {
                final SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.remove(AppSettings.emailSharedPrefsKey);
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const SignInPage()),
                );
              },
            ),
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static Future<String> getCachedUserEmail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(AppSettings.emailSharedPrefsKey) ?? "--";
  }
}