import 'dart:typed_data';

import 'package:app_dev_project/screens/charity/charity_home_page.dart';
import 'package:app_dev_project/screens/charity/charity_login_screen.dart';
import 'package:app_dev_project/resources/auth_methods.dart';
import 'package:app_dev_project/utils.dart';
import 'package:app_dev_project/widgets/text_field_input.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

class CharitySignupScreen extends StatefulWidget {
  const CharitySignupScreen({super.key});

  @override
  State<CharitySignupScreen> createState() => _CharitySignupScreenState();
}

class _CharitySignupScreenState extends State<CharitySignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _charitynameController = TextEditingController();
  Uint8List? _image;
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    _charitynameController.dispose();
  }

  void selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  

  void signUpCharity() async {
    setState(() {
      _isLoading = true;
    });
    Uint8List defaultImage = await getDefaultImage();
    String res = await AuthMethods().signUpcharity(
      email: _emailController.text,
      password: _passwordController.text,
      charityname: _charitynameController.text,
      phone: _phoneController.text,
      file: _image ?? defaultImage,
    );
    setState(() {
      _isLoading = false;
    });
    if (res != 'success') {
      showSnackBar(res, context);
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const CharityHomePageScreen()),
      );
    }
  }

  Future<Uint8List> getDefaultImage() async {
  ByteData data = await rootBundle.load('images/charity.png');
  return data.buffer.asUint8List();
}

  void navigateToLogin() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const CharityLoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 78, 246, 6),
      appBar: AppBar(
        title: const Text('Sign Up',
            style: TextStyle(
              color: Colors.white,
              fontSize: 23,
            )),
        backgroundColor: const Color.fromARGB(255, 63, 21, 162),
      ),
      body: SafeArea(
          child: Center(
        heightFactor: 50,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    _image == null ?
                    ClipRRect(
                      child: Image.asset(
                        'images/charity.png',
                        height: 220,
                        width: 250,
                      ),
                    ):ClipRRect(
                      child: Image.memory(
                        _image!,
                        height: 220,
                        width: 250,
                      ),
                    ),
                    Positioned(
                        bottom: 31,
                        right: -7,
                        child: IconButton(
                          onPressed: selectImage,
                          icon: const Icon(
                            Icons.add_a_photo,
                            color: Colors.white,
                            size: 30,
                          ),
                        ))
                  ],
                ),

                const SizedBox(
                  height: 15,
                ),

                TextFieldInput(
                    textEditingController: _charitynameController,
                    hintText: "Enter your Charity name",
                    textInputType: TextInputType.text),
                const SizedBox(
                  height: 24,
                ),

                TextFieldInput(
                    textEditingController: _emailController,
                    hintText: "Enter your Charity email",
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
                TextFieldInput(
                    textEditingController: _phoneController,
                    hintText: "Enter your Phone number",
                    textInputType: TextInputType.phone),

                const SizedBox(
                  height: 24,
                ),

                InkWell(
                  onTap: signUpCharity,
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: const ShapeDecoration(
                        color: Colors.lightBlue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ))),
                    child: _isLoading
                        ? CircularProgressIndicator(
                            color: Colors.indigoAccent[900],
                          )
                        : const Text(
                            "Sign up",
                            style: TextStyle(
                                color: Color.fromARGB(255, 63, 21, 162),
                                fontSize: 19,
                                fontWeight: FontWeight.w600),
                          ),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: const Text(
                        "Already have an account?",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: navigateToLogin,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: const Text(
                          "Login",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 27, 4, 80)),
                        ),
                      ),
                    )
                  ],
                )
              ]),
        ),
      )),
    );
  }
}
