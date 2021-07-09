import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foot_man/Data/FirebaseAuthentication.dart';
import 'package:foot_man/Business/Admin_page.dart';
import 'package:foot_man/Presentation/registration_screen.dart';
import 'package:foot_man/Business/successful_login.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

Color primaryColor = Color(0xff0e0e0e);
Color secondaryColor = Color(0xffFBD83C);

class _LoginScreenState extends State<LoginScreen> {
  final _key = GlobalKey<FormState>();
  final AuthenticationServices _auth = new AuthenticationServices();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  @override
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
                        'Sign in to FOOTMAN and continue',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                            color: Colors.white, fontSize: 28),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Enter your email and password below to continue to the The Vaxjo BK club!',
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
                          controller: _emailController,
                          validator: (val) =>
                              val.isEmpty ? 'Enter an email' : null,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                            labelText: 'Email',
                            labelStyle: TextStyle(color: Colors.white),
                            border: InputBorder.none,
                            hintText: 'Eg. Jason Momoa',
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
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                            labelText: 'Password',
                            labelStyle: TextStyle(color: Colors.white),
                            border: InputBorder.none,
                            hintText: 'Eg. Atleast 6 Chaarcters',
                          ),
                        ),
                      ),
                      SizedBox(height: 2),
                      //_buildForgotPassword(),
                      SizedBox(height: 5),
                      MaterialButton(
                        elevation: 0,
                        minWidth: double.maxFinite,
                        height: 50,
                        onPressed: () {
                          if (_key.currentState.validate()) {
                            loginUser();
                          }
                        },
                        color: secondaryColor,
                        child: Text('Login',
                            style:
                                TextStyle(color: Colors.black, fontSize: 20)),
                        textColor: Colors.black,
                      ),
                      SizedBox(height: 20),
                      MaterialButton(
                        elevation: 0,
                        minWidth: double.maxFinite,
                        height: 50,
                        onPressed: () {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) =>
                                      new RegistrationScreen()));
                        },
                        color: secondaryColor,
                        child: Text('Sign-Up',
                            style:
                                TextStyle(color: Colors.black, fontSize: 20)),
                        textColor: Colors.black,
                      ),
                      SizedBox(height: 120),
                      buildFooterLogo(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  /* buildTextField(String labelText, IconData icon) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xff414141), border: Border.all(color: Colors.yellow)),
      child: TextField(
        controller: emailController,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            labelText: labelText,
            labelStyle: TextStyle(color: Colors.white),
            icon: Icon(
              icon,
              color: Colors.white,
            ),
            // prefix: Icon(icon),
            border: InputBorder.none),
      ),
    );
  }


  buildTextFieldPassword(String labelText, IconData icon) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xff414141), border: Border.all(color: Colors.yellow)),
      child: TextField(
        controller: passwordController,
        obscureText: true,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            labelText: labelText,
            labelStyle: TextStyle(color: Colors.white),
            icon: Icon(
              icon,
              color: Colors.white,
            ),
            // prefix: Icon(icon),
            border: InputBorder.none),
      ),
    );
  }*/

 /* _buildForgotPassword() {
    return TextButton(
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text('Forgot Password?',
            textAlign: TextAlign.right,
            style: TextStyle(
                color: secondaryColor,
                fontSize: 15,
                fontWeight: FontWeight.normal)),
      ),
      onPressed: () {
        Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) => new ForgotPasswordScreen()));
      },
    );
  }*/

  Widget buildFooterLogo() {
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

  void loginUser() async {
    dynamic authResult =
        await _auth.loginUser(_emailController.text, _passwordController.text);
    var firebaseUser = await FirebaseAuth.instance.currentUser;
    if (authResult == null) {
      print('Email or Password is wrong');
    } else if (firebaseUser.uid == "GP5THx9V53VNryTD7r8wqe8p4bZ2") {
      Navigator.push(context,
          new MaterialPageRoute(builder: (context) => new AdminLogin()));
    } else {
      _emailController.clear();
      _passwordController.clear();
      Navigator.push(context,
          new MaterialPageRoute(builder: (context) => new SuccessfulLogin()));
    }
  }

/*Future<void> signIn() async
  {
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);
    Navigator.push(context, new MaterialPageRoute(builder: (
        context) => new SuccessfulLogin()));
  }*/
}
