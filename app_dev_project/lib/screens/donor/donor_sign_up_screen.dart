// import 'package:app_dev_project/homePage/home_page.dart';
// import 'package:flutter/material.dart';

// class DonorSignUpScreen extends StatefulWidget {
//   const DonorSignUpScreen({Key? key}) : super(key: key);

//   @override
//   _DonorSignUpScreenState createState() => _DonorSignUpScreenState();
// }

// class _DonorSignUpScreenState extends State<DonorSignUpScreen> {
//   final _formKey = GlobalKey<FormState>();

//   String name = '';
//   String email = '';
//   String phoneNumber = '';
//   String nPass = '';
//   String cPass = '';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 78, 246, 6),
//       appBar: AppBar(
//         title: const Text('Sign Up',
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 23,
//             )),
//         backgroundColor: const Color.fromARGB(255, 63, 21, 162),
//       ),
//       body: Center(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(15.0),
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   // ClipOval(
//                   //     child: Image.asset(
//                   //   'images/welcome.jpg',
//                   //   alignment: Alignment.topCenter,
//                   //   // height: 300,
//                   //   width: 300,
//                   // )),
//                   const Text(
//                     'Your Details:',
//                     style: TextStyle(
//                       fontSize: 23,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                   const SizedBox(height: 30),
//   //! Name
//                   TextFormField(
//                     decoration: const InputDecoration(
//                       labelText: 'Name',
//                       filled: true,
//                       fillColor: Colors.white,
//                       labelStyle: TextStyle(
//                         fontSize: 19,
//                       ),
//                     ),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your name!';
//                       }
//                       return null;
//                     },
//                     onSaved: (value) {
//                       name = value!;
//                     },
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//   //! Phone Number
//                   TextFormField(
//                     decoration: const InputDecoration(
//                       labelText: 'Phone Number',
//                       filled: true,
//                       fillColor: Colors.white,
//                       labelStyle: TextStyle(
//                         fontSize: 20,
//                       ),
//                     ),
//                     keyboardType: TextInputType.number,
//                     validator: (value) {
//                       if (value == null ||
//                           value.isEmpty ||
//                           (value.length != 10)) {
//                         return 'Please enter valid phone number!';
//                       }
//                       return null;
//                     },
//                     onSaved: (value) {
//                       phoneNumber = value!;
//                     },
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//   //! Email
//                   TextFormField(
//                     decoration: const InputDecoration(
//                       labelText: 'Email',
//                       filled: true,
//                       fillColor: Colors.white,
//                       labelStyle: TextStyle(
//                         fontSize: 19,
//                       ),
//                     ),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your e-mail id!';
//                       }
//                       return null;
//                     },
//                     onSaved: (value) {
//                       email = value!;
//                     },
//                   ),

//                   const SizedBox(
//                     height: 10,
//                   ),
//   //! Create Password
//                   TextFormField(
//                     decoration: const InputDecoration(
//                       labelText: 'Create Password',
//                       filled: true,
//                       fillColor: Colors.white,
//                       labelStyle: TextStyle(
//                         fontSize: 19,
//                       ),
//                     ),
//                     obscureText: true,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your password!';
//                       }
//                       return null;
//                     },
//                     onSaved: (value) {
//                       nPass = value!;
//                     },
//                   ),

//                   const SizedBox(
//                     height: 10,
//                   ),
//   //! Confirm Password
//                   TextFormField(
//                     decoration: const InputDecoration(
//                       labelText: 'Confirm Password',
//                       filled: true,
//                       fillColor: Colors.white,
//                       labelStyle: TextStyle(
//                         fontSize: 19,
//                       ),
//                     ),
//                     obscureText: true,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your password!';
//                       }
//                       // if (value.compareTo(nPass) != 0) {
//                       //   return 'Password does not match!';
//                       // }
//                       return null;
//                     },
//                     onSaved: (value) {
//                       cPass = value!;
//                     },
//                   ),
//                   const SizedBox(
//                     height: 19,
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       if (_formKey.currentState!.validate()) {
//                         _formKey.currentState!.save();

//                         // Here, you can save the information to your database
//                         // or use it as needed.

//                         // Navigate to the next screen or perform any other action
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) =>
//                                   HomePageScreen(userName: name)),
//                         );
//                       }
//                     },
//                     style: ElevatedButton.styleFrom(
//                       minimumSize: const Size(150, 45),
//                     ),
//                     child: Text(
//                       'Sign Up',
//                       style: TextStyle(
//                           fontSize: 19, color: Colors.indigoAccent.shade700),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:app_dev_project/screens/donor/donor_home_page.dart';
import 'package:app_dev_project/screens/donor/donor_login_screen.dart';
import 'package:app_dev_project/resources/auth_methods.dart';
import 'package:app_dev_project/utils.dart';
import 'package:app_dev_project/widgets/text_field_input.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DonorSignupScreen extends StatefulWidget {
  const DonorSignupScreen({super.key});

  @override
  State<DonorSignupScreen> createState() => _DonorSignupScreenState();
}

class _DonorSignupScreenState extends State<DonorSignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    _usernameController.dispose();
  }


  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().signUpuser(
      email: _emailController.text,
      password: _passwordController.text,
      username: _usernameController.text,
      phone: _phoneController.text,
      
    );
    setState(() {
      _isLoading = false;
    });
    if (res != 'success') {
      
      showSnackBar(res, context);
    }
    else{
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const HomePageScreen()
              ),
              );
    }
  }

  void navigateToLogin() {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => const LoginScreen()));
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
                  child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center, 
                  children: [
            TextFieldInput(
                textEditingController: _usernameController,
                hintText: "Enter your Username",
                textInputType: TextInputType.text),
            const SizedBox(
              height: 24,
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
            )
            ,
            const SizedBox(
              height: 24,
            )
            ,
            TextFieldInput(
                textEditingController: _phoneController,
                hintText: "Enter your Phone number",
                textInputType: TextInputType.phone),
          
            const SizedBox(
              height: 24,
            ),
          
            // ElevatedButton(
            //   style: ElevatedButton.styleFrom(
            //     minimumSize: Size(100, 40),
            //   ),
            //   onPressed: signUpUser, 
            //   child: _isLoading ? CircularProgressIndicator(
            //     color: Colors.indigoAccent[900],
            //   ) :const Text("Sign up", style: TextStyle(
            //     color:  Color.fromARGB(255, 63, 21, 162),
            //     fontSize: 20,
            //   )),),
          
InkWell(
            onTap: signUpUser,
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
              child: _isLoading ? CircularProgressIndicator(
              color: Colors.indigoAccent[900],
            ) :const Text("Sign up", style: TextStyle(
              color:  Color.fromARGB(255, 63, 21, 162),
              fontSize: 19,
              fontWeight: FontWeight.w600
            ),),
            ),
          ),

              Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: const Text("Already have an account?",
                  style: TextStyle(
                    color: Colors.black
                  ),),
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
                      style: TextStyle(fontWeight: FontWeight.bold,
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
