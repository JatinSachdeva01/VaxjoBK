import 'package:flutter/material.dart';
import 'package:foot_man/Data/FirebaseAuthentication.dart';
import 'package:foot_man/Data/database.dart';
import 'package:foot_man/Presentation/login_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

Color primaryColor = Color(0xff0e0e0e);
Color secondaryColor = Color(0xffFBD83C);

class _RegistrationScreenState extends State<RegistrationScreen> {
  final AuthenticationServices _auth = AuthenticationServices();

  final _key = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _cityController = TextEditingController();


  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 40),
          child: SingleChildScrollView(
            child: Form(
              key: _key,
              child: Column(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Register to FOOTMAN',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                            color: Colors.white, fontSize: 20),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Enter your details to sign-up to The Vaxjo BK club!',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                            color: Colors.white, fontSize: 14),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0xff414141),
                            border: Border.all(color: Colors.yellow)),
                        child: TextFormField(
                          controller: _nameController,
                          validator: (value) {
                            String pattern = '[a-zA-Z]';
                            RegExp regExp = new RegExp(pattern);
                            if (value.isEmpty) {
                              return "Name Required";
                            } else if (!regExp.hasMatch(value)) {
                              return "Enter only characters";
                            } else
                              return null;
                          },
                          /*validator: (val) =>
                              val.isEmpty ? 'Enter full name' : null,*/
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 10),
                            labelText: 'Name',
                            labelStyle: TextStyle(color: Colors.white),
                            border: InputBorder.none,
                            hintText: 'Eg. Jason Momoa',
                          ),
                        ),
                      ),
                      //buildTextField('Name', 'Eg. Jason Momoa'),
                      SizedBox(
                        height: 10,
                      ),
                      //buildTextField('Age', 'Eg. 25'),
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0xff414141),
                            border: Border.all(color: Colors.yellow)),
                        child: TextFormField(
                          controller: _ageController,
                          validator: (value) {
                            String pattern = r'\d';
                            RegExp regExp = new RegExp(pattern);
                            if (value.isEmpty) {
                              return "Age Required";
                            } else if (!regExp.hasMatch(value)) {
                              return "Enter only digits";
                            } else
                              return null;
                          },
                          //validator: (val) => val.isEmpty ? 'Enter an age':null,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 10),
                            labelText: 'Age',
                            labelStyle: TextStyle(color: Colors.white),
                            border: InputBorder.none,
                            hintText: 'Eg. 25',
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      //buildTextField('City', 'Eg.Vaxjo'),
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0xff414141),
                            border: Border.all(color: Colors.yellow)),
                        child: TextFormField(
                          controller: _cityController,
                          validator: (value) {
                            String pattern = '[a-zA-Z]';
                            RegExp regExp = new RegExp(pattern);
                            if (value.isEmpty) {
                              return "City Required";
                            } else if (!regExp.hasMatch(value)) {
                              return "Enter only characters";
                            } else
                              return null;
                          },
                          //validator: (val) => val.isEmpty ? 'Enter a city':null,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 10),
                            labelText: 'City',
                            labelStyle: TextStyle(color: Colors.white),
                            border: InputBorder.none,
                            hintText: 'Eg. Vaxjo',
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0xff414141),
                            border: Border.all(color: Colors.yellow)),
                        child: TextFormField(
                          controller: _emailController,
                          validator: (value) {
                            String pattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
                            RegExp regExp = new RegExp(pattern);
                            if (value.isEmpty) {
                              return "Enter Email";
                            } else if (!regExp.hasMatch(value)) {
                              return "Invalid Email";
                            } else
                              return null;
                          },
                          /*validator: (val) =>
                              val.isEmpty ? 'Enter an email' : null,*/
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 10),
                            labelText: 'Email',
                            labelStyle: TextStyle(color: Colors.white),
                            border: InputBorder.none,
                            hintText: 'Eg. ziad@gmail.com',
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0xff414141),
                            border: Border.all(color: Colors.yellow)),
                        child: TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          validator: (val) => val.length < 6
                              ? 'Enter a password of atleast 6 characters'
                              : null,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 10),
                            labelText: 'Password',
                            labelStyle: TextStyle(color: Colors.white),
                            border: InputBorder.none,
                            hintText: 'Eg. Atleast 6 Chaarcters',
                          ),
                        ),
                      ),
                      //buildTextField('Email', 'Eg. jasonmomoa@gmail.com'),
                      SizedBox(height: 40),
                      MaterialButton(
                        elevation: 0,
                        minWidth: double.maxFinite,
                        height: 50,
                        onPressed: () async {
                          if (_key.currentState.validate()) {
                            createUser();
                          }
                        },
                        color: secondaryColor,
                        child: Text('Sign-Up',
                            style: TextStyle(color: Colors.black, fontSize: 20)),
                        textColor: Colors.black,
                      ),
                      SizedBox(height: 120),
                      _buildFooterLogo()
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  buildTextField(String labelText, String hintText) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xff414141), border: Border.all(color: Colors.yellow)),
      child: TextField(
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.white),
          border: InputBorder.none,
          hintText: hintText,
        ),
      ),
    );
  }

  buildTextFieldPassword(String labelText) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xff414141), border: Border.all(color: Colors.yellow)),
      child: TextField(
        obscureText: true,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            labelText: labelText,
            labelStyle: TextStyle(color: Colors.white),
            // prefix: Icon(icon),
            border: InputBorder.none),
      ),
    );
  }

  _buildFooterLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          'assets/images/vbk.png',
          height: 60,
        ),
        Text('FOOTMAN',
            textAlign: TextAlign.center,
            style: GoogleFonts.openSans(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
      ],
    );
  }

  void createUser() {
    dynamic result =  _auth.createNewUser(
        _emailController.text, _passwordController.text).then((value) {
          DatabaseService(uid: value.uid).updateUserData(_emailController.text, _nameController.text, _ageController.text, _cityController.text);
          Navigator.push(context,
              new MaterialPageRoute(builder: (context) => new LoginScreen()));
    },
    );
    if (result == null) {
      print('Email is not valid');
    } else {
      print(result.toString());
    }
  }
}
