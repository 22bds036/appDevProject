import 'package:app_dev_project/homePage/home_page.dart';
import 'package:flutter/material.dart';

class DonorSignUpScreen extends StatefulWidget {
  const DonorSignUpScreen({Key? key}) : super(key: key);

  @override
  _DonorSignUpScreenState createState() => _DonorSignUpScreenState();
}

class _DonorSignUpScreenState extends State<DonorSignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  String name = '';
  String email = '';
  String phoneNumber = '';
  String nPass = '';
  String cPass = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 78, 246, 6),
      appBar: AppBar(
        title: const Text('Sign Up',
            style: TextStyle(
              color: Colors.white,
              fontSize: 23,
            )),
        backgroundColor: const Color.fromARGB(255, 63, 21, 162),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // ClipOval(
                  //     child: Image.asset(
                  //   'images/welcome.jpg',
                  //   alignment: Alignment.topCenter,
                  //   // height: 300,
                  //   width: 300,
                  // )),
                  const Text(
                    'Your Details:',
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 30),
  //! Name
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      filled: true,
                      fillColor: Colors.white,
                      labelStyle: TextStyle(
                        fontSize: 19,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name!';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      name = value!;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
  //! Phone Number
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Phone Number',
                      filled: true,
                      fillColor: Colors.white,
                      labelStyle: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          (value.length != 10)) {
                        return 'Please enter valid phone number!';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      phoneNumber = value!;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
  //! Email
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      filled: true,
                      fillColor: Colors.white,
                      labelStyle: TextStyle(
                        fontSize: 19,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your e-mail id!';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      email = value!;
                    },
                  ),

                  const SizedBox(
                    height: 10,
                  ),
  //! Create Password
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Create Password',
                      filled: true,
                      fillColor: Colors.white,
                      labelStyle: TextStyle(
                        fontSize: 19,
                      ),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password!';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      nPass = value!;
                    },
                  ),

                  const SizedBox(
                    height: 10,
                  ),
  //! Confirm Password
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Confirm Password',
                      filled: true,
                      fillColor: Colors.white,
                      labelStyle: TextStyle(
                        fontSize: 19,
                      ),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password!';
                      }
                      // if (value.compareTo(nPass) != 0) {
                      //   return 'Password does not match!';
                      // }
                      return null;
                    },
                    onSaved: (value) {
                      cPass = value!;
                    },
                  ),
                  const SizedBox(
                    height: 19,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();

                        // Here, you can save the information to your database
                        // or use it as needed.

                        // Navigate to the next screen or perform any other action
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  HomePageScreen(userName: name)),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(150, 45),
                    ),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                          fontSize: 19, color: Colors.indigoAccent.shade700),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
