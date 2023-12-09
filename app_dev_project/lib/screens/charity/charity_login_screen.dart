import 'package:app_dev_project/screens/charity/charity_home_page.dart';
import 'package:app_dev_project/screens/charity/charity_sign_up_screen.dart';
import 'package:app_dev_project/screens/donor/donor_home_page.dart';
import 'package:app_dev_project/resources/auth_methods.dart';
import 'package:app_dev_project/utils.dart';
import 'package:app_dev_project/widgets/text_field_input.dart';
import 'package:flutter/material.dart';

class CharityLoginScreen extends StatefulWidget {
  const CharityLoginScreen({super.key});

  @override
  State<CharityLoginScreen> createState() => _CharityLoginScreenState();
}

class _CharityLoginScreenState extends State<CharityLoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });

    String res = await AuthMethods().loginCharity(
      email: _emailController.text,
      password: _passwordController.text,
    );

    if (res == "success") {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const CharityHomePageScreen()));
    } else {
      showSnackBar(res, context);
    }

    setState(() {
      _isLoading = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 78, 246, 6),
      appBar: AppBar(
        title: const Text(
          'Log In',
          style: TextStyle(
            color: Colors.white,
            fontSize: 23,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 63, 21, 162),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 44,
              ),
              TextFieldInput(
                  textEditingController: _emailController,
                  hintText: "Enter your email",
                  textInputType: TextInputType.emailAddress),
              const SizedBox(
                height: 24,
              ),
              TextFieldInput(
                textEditingController: _passwordController,
                hintText: "Enter your password",
                textInputType: TextInputType.text,
                isPass: true,
              ),
              const SizedBox(
                height: 24,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: loginUser,
                child: _isLoading
                    ? Center(
                        child: CircularProgressIndicator(
                            color: Colors.indigoAccent.shade700),
                      )
                    : Text(
                        'Log in',
                        style: TextStyle(
                            fontSize: 18, color: Colors.indigoAccent.shade700),
                      ),
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CharitySignupScreen()),
                  );
                },
                child: Text(
                  "Don't have an account? Sign Up",
                  style: TextStyle(
                      fontSize: 15, color: Colors.indigoAccent.shade700),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
