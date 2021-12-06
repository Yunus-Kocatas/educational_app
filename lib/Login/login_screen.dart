import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_design/Login/splash_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'registration_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override

  /// form Key
  final _formKey = GlobalKey<FormState>();

  /// ediditin controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  /// firebase-------------------
  final _auth = FirebaseAuth.instance;

  Widget build(BuildContext context) {
    /// email field
    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter your eamil';
        }

        /// reg expression for email validation
        if (!RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value)) {
          return ('Please enter a valid mail');
        }
        return null;
      },
      onSaved: (newValue) {
        emailController.text = newValue;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.mail),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Email',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    /// password field
    final passwordField = TextFormField(
      autofocus: false,
      obscureText: true,
      controller: passwordController,
      validator: (value) {
        RegExp regex = RegExp(r'^.{6,}$');
        if (value.isEmpty) {
          return ('please is required for login');
        }
        if (!regex.hasMatch(value)) {
          return ('please enter your password Min. 6 character');
        }
      },
      onSaved: (newValue) {
        passwordController.text = newValue;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Password',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    /// login button
    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.redAccent,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          /// asagida pushReplacement kullandik cunku home secreen e gittigimizde geri donus butonunun olmasini istemiyoruz.
          signIn(emailController.text, passwordController.text);
        },
        child: Text(
          'Login',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

    return Scaffold(
      // backgroundColor: Colors.black26,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            // color: Colors.black26,
            child: Padding(
              padding: const EdgeInsets.all(38.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    Image.asset(
                      'images/logobuyuk.png',
                      fit: BoxFit.contain,
                      height: 93,
                    ),
                    SizedBox(
                      height: 55,
                    ),
                    emailField,
                    SizedBox(
                      height: 22,
                    ),
                    passwordField,
                    SizedBox(
                      height: 22,
                    ),
                    loginButton,
                    SizedBox(
                      height: 22,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account? "),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RegistrationScreen(),
                                ));
                          },
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 15,
                                color: Colors.redAccent),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signIn(String email, String password) async {
    if (_formKey.currentState.validate()) {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then(
            (uid) => {
              Fluttertoast.showToast(msg: 'Login Succesuful'),
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => MySplashScreen(),
              ))
            },
          )
          .catchError((e) {
        Fluttertoast.showToast(msg: e.message);
      });
    }
  }
}
