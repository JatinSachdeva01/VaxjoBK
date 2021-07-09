import 'package:flutter/material.dart';
import 'Presentation/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async{
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
        home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  @override
  HomePage createState() => HomePage();
  Color primaryColor = Color(0xff0e0e0e);
  Color secondaryColor = Color(0xffFBD83C);

  @override
  Widget build(BuildContext context) {
      return new Scaffold(
        backgroundColor: primaryColor,
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
                'Welcome to FOOTMAN !',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 28),
              ),
              SizedBox(height: 20),
              Text(
                'Get all information about the Vaxjo BK club here!',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              SizedBox(
                height: 30,
              ),
              //Our MaterialButton which when pressed will take us to a new screen named as
              //LoginScreen
              MaterialButton(
                elevation: 0,
                height: 50,
                onPressed: () {
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) => new LoginScreen()));
                },
                color: secondaryColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Get Started',
                        style:
                            TextStyle(color: Color(0xff0e0e0e), fontSize: 20)),
                    Icon(Icons.arrow_forward_ios)
                  ],
                ),
                textColor: Color(0xff0e0e0e),
              )
            ],
          ),
        ),
      );
  }
}

// This widget is the root of your application.
