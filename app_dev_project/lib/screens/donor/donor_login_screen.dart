import 'package:app_dev_project/screens/donor/donor_home_page.dart';
import 'package:app_dev_project/resources/auth_methods.dart';
import 'package:app_dev_project/utils.dart';
import 'package:app_dev_project/widgets/text_field_input.dart';
import 'package:flutter/material.dart';

import 'donor_sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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

    String res = await AuthMethods().loginUser(
      email: _emailController.text,
      password: _passwordController.text,
    );

    if (res == "success") {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const HomePageScreen()));
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
          'Login',
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

              // TextFormField(
              //   decoration: const InputDecoration(
              //     labelText: 'Email',
              //     filled: true,
              //     fillColor: Colors.white,
              //     labelStyle: TextStyle(
              //       fontSize: 19,
              //     ),
              //   ),
              //   autofillHints: const [AutofillHints.email],
              //   keyboardType: TextInputType.emailAddress,
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return 'Please enter your email';
              //     }
              //     return null;
              //   },
              //   onSaved: (value) {
              //     email = value!;
              //   },
              // ),
              // const SizedBox(height: 20),
              // TextFormField(
              //   decoration: const InputDecoration(
              //     labelText: 'Password',
              //     filled: true,
              //     fillColor: Colors.white,
              //     labelStyle: TextStyle(
              //       fontSize: 19,
              //     ),
              //   ),
              //   autofillHints: const [AutofillHints.password],
              //   obscureText: true,
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return 'Please enter your password';
              //     }
              //     return null;
              //   },
              //   onSaved: (value) {
              //     password = value!;
              //   },
              // ),

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
                child:  _isLoading
                  ? Center(
                      child: CircularProgressIndicator(
                        color: Colors.indigoAccent.shade700),
                      )
                  : Text(
                  'Login',
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
                        builder: (context) => const DonorSignupScreen()),
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
