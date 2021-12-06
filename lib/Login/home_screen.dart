import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design/models/user_model.dart';

import 'login_screen.dart';

class HomeScren extends StatefulWidget {
  @override
  _HomeScrenState createState() => _HomeScrenState();
}

class _HomeScrenState extends State<HomeScren> {
  User user = FirebaseAuth.instance.currentUser;
  UserModel logedUser = UserModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get()
        .then((value) {
      this.logedUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
                child: Image.asset(
                  'images/logobuyuk.png',
                  fit: BoxFit.contain,
                  height: 93,
                ),
              ),
              Text(
                'Welcome back',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                '${logedUser.firstName} ${logedUser.secondName}',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54),
              ),
              Text(
                '${logedUser.email}',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54),
              ),
              ActionChip(
                label: Text('Logout'),
                onPressed: () {
                  logout(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => LoginScreen(),
    ));
  }
}
