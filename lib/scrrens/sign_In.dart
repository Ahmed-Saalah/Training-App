import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_settings.dart';
import 'package:flutter_application_1/core/firebase_auth_util.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/app_buttons.dart';
import 'welcom_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 50),
              SizedBox(
                width: 150,
                height: 150,
                 child: Image.asset("login.jpg"),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: "email",
                  ),
                  validator: (value) {
                    if (value!.isNotEmpty) {
                      return null;
                    } else {
                      return "Invalid Email";
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: const InputDecoration(labelText: "Password"),
                  validator: (value) {
                    if (value!.length < 8) {
                      return "invalid Password";
                    }
                    return null;
                  },
                ),
              ),
              
              isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : AppButton(
                      label: "Log in",
                      color: Colors.blue[300]!,
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          if (kDebugMode) {
                            print("Logged in");
                          }

                          isLoading = true;
                          setState(() {});
                          bool loginResult = await FirebaseAuthUtil.loginIn(
                              email: emailController.text, password: passwordController.text);
                          if (loginResult) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => const HomePage()),
                            );
                          } else {
                            var snackBar = const SnackBar(
                              content: Text("Email or password is not correct"),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          }
                          isLoading = false;
                          setState(() {});
                        }
                      },
                    ),

              const SizedBox(
                height: 15,
              ),
              const Text("Forgot Password?. Tap me"),
              const SizedBox(
                height: 15,
              ),
              AppButton(
                label: "No account, sign up",
                color: Colors.grey,
                onTap: () {
                  if (kDebugMode) {
                    print("Sign up");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}