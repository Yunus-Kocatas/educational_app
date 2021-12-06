import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design/Login/show_dialog.dart';
import 'package:flutter_design/models/user_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'home_screen.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;

  /// our form key
  final _formKey = GlobalKey<FormState>();

  ///editing  controller
  final firstNameEditingController = TextEditingController();
  final secondNameEditingController = TextEditingController();
  final emailNameEditingController = TextEditingController();
  final passwordNameEditingController = TextEditingController();
  final confirmPasswordNameEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    /// first Name Field
    final firstNamefield = TextFormField(
      autofocus: false,
      keyboardType: TextInputType.name,
      controller: firstNameEditingController,
      validator: (value) {
        RegExp regex = RegExp(r'^.{3,}$');
        if (value.isEmpty) {
          return ('First name can not be Empty');
        }
        if (!regex.hasMatch(value)) {
          return ('please enter valid name Min. 3 character');
        }
        return null;
      },
      onSaved: (newValue) {
        firstNameEditingController.text = newValue;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.account_circle),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'First Name ',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    /// second name field
    final seconfNamefield = TextFormField(
      autofocus: false,
      keyboardType: TextInputType.emailAddress,
      controller: secondNameEditingController,
      validator: (value) {
        if (value.isEmpty) {
          return ('First name can not be Empty');
        }
        return null;
      },
      onSaved: (newValue) {
        secondNameEditingController.text = newValue;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.account_circle),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Second Name ',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    /// email name field
    final emailNamefield = TextFormField(
      autofocus: false,
      keyboardType: TextInputType.emailAddress,
      controller: emailNameEditingController,
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
        emailNameEditingController.text = newValue;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.email),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Email ',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    /// passoed name field
    final passwordNamefield = TextFormField(
      autofocus: false,
      obscureText: true,
      controller: passwordNameEditingController,
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
        passwordNameEditingController.text = newValue;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Password ',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    ///confirm password name  field
    final confirPasswordNamefield = TextFormField(
      autofocus: false,
      obscureText: true,
      controller: confirmPasswordNameEditingController,
      validator: (value) {
        if (confirmPasswordNameEditingController.text !=
            passwordNameEditingController.text) {
          return 'password dont match';
        }
        return null;
      },
      onSaved: (newValue) {
        confirmPasswordNameEditingController.text = newValue;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Confirm Password ',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    /// sing up button
    final signUpButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.redAccent,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          showLoaderDialog1(context);
          signUp(emailNameEditingController.text,
              passwordNameEditingController.text);
        },
        child: Text(
          'Sign Up',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        /// burasi bizim app barimizi transparant yapar ama mutlaka elevation=0 kullanmaliizi-----------
        backgroundColor: Colors.transparent,
        elevation: 0,

        /// for transparence-----------------
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.red,
            )),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(38.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/logobuyuk.png',
                      fit: BoxFit.contain,
                      height: 93,
                    ),
                    SizedBox(
                      height: 42,
                    ),
                    firstNamefield,
                    SizedBox(
                      height: 22,
                    ),
                    seconfNamefield,
                    SizedBox(
                      height: 22,
                    ),
                    emailNamefield,
                    SizedBox(
                      height: 22,
                    ),
                    passwordNamefield,
                    SizedBox(
                      height: 22,
                    ),
                    confirPasswordNamefield,
                    SizedBox(
                      height: 22,
                    ),
                    signUpButton,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signUp(String email, String password) async {
    if (_formKey.currentState.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailtoFireStore()})
          .catchError((e) {
        Fluttertoast.showToast(msg: e.message);
      });
    }
  }

  postDetailtoFireStore() async {
    /// calling our fireStore
    /// calling our user model
    /// sending this value
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User user = _auth.currentUser;
    UserModel userModel = UserModel();

    /// write all the value
    userModel.email = user.email;
    userModel.uid = user.uid;
    userModel.firstName = firstNameEditingController.text;
    userModel.secondName = secondNameEditingController.text;

    await firebaseFirestore
        .collection('users')
        .doc(user.uid)
        .set(userModel.toMap());

    Fluttertoast.showToast(msg: 'Account created successfully :) ');
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScren(),
        ),
        (route) => false);
  }
}
