import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
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
      validator: (value) {},
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
      validator: (value) {},
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
      validator: (value) {},
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
      validator: (value) {},
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
      validator: (value) {},
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
        onPressed: () {},
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
}
