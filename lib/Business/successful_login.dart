import 'package:flutter/material.dart';
import 'package:foot_man/Data/FirebaseAuthentication.dart';
import 'package:foot_man/Presentation/AboutUs.dart';
import 'package:foot_man/Presentation/calendar_screen_user.dart';
import 'Constants.dart';
import '../Presentation/login_screen.dart';

class SuccessfulLogin extends StatefulWidget {
  const SuccessfulLogin({Key key}) : super(key: key);

  @override
  _SuccessfulLoginState createState() => _SuccessfulLoginState();
}

Color primaryColor = Color(0xff0e0e0e);
Color secondaryColor = Color(0xffFBD83C);

class _SuccessfulLoginState extends State<SuccessfulLogin> {
  final AuthenticationServices _auth = new AuthenticationServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: secondaryColor,
        title: new Text('FootMan',
            style: TextStyle(color: Colors.black, fontSize: 20)),
        actions: <Widget>[
          PopupMenuButton<String>(
            icon: Icon(Icons.more_vert, color: primaryColor),
            color: secondaryColor,
            onSelected: choiceAction,
            itemBuilder: (BuildContext context) {
              return Constants.choices.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //We take the image from the assets

            new Image.asset('assets/images/vbk.png',
                width: 200.0, height: 400.0),
            SizedBox(
              height: 30,
            ),
            //Texts and Styling of them
            Text(
              'Login Successful !',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 28),
            ),
            SizedBox(height: 20),
            Text(
              'Click on Top Right to get the Menu!',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }

  void choiceAction(String choice) async {
    if (choice == Constants.Calendar)
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => CalendarScreenUser()));
    else if (choice == Constants.SignOut) {
      await _auth.logOut();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    } else if (choice == Constants.AboutUs)
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AboutUsScreen()));
  }
}
