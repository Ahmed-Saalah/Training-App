import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_settings.dart';
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
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                width: 250,
                height: 250,
                child: Image.asset("login.jpg"),
              ),

              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: phoneNumberController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(labelText: "Phone Number"),
                  validator: (value) {
                    if(value!.length > 9 && value.length <= 11) {
                      return null;
                    } else {
                      return "InValid Phone Number";
                    }
                  }
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(labelText: "Password"),
                  validator: (value) {
                    if(value!.length < 8) {
                      return "InValid Password";
                    }
                    return null;
                  }
                ),
              ),
              

            AppButton(
              label: "Log In",
              color: Colors.blue[300]!,
              onTap: () async {
                if(_formKey.currentState!.validate()) {
                  if (kDebugMode) {
                    print("Logged In");
                  }
                  final SharedPreferences prefs = await SharedPreferences.getInstance();
                   await prefs.setString(AppSettings.phoneNumberSharedPrefsKey, phoneNumberController.text);
                 Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const WelcomPage()),
                );
                  passwordController.clear();
                }
              },
            ),
            
            const SizedBox(height: 15),
            const Text("Forget Password? Tap me."),
            const SizedBox(height: 15),
            
            AppButton(
              label: "No account, Sign Up",
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
