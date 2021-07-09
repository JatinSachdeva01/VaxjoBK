import 'package:flutter/material.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({Key key}) : super(key: key);

  @override
  _AboutUsScreenState createState() => _AboutUsScreenState();
}
Color primaryColor = Color(0xff0e0e0e);
Color secondaryColor = Color(0xffFBD83C);
class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        body: Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //We take the image from the assets
          new Image.asset('assets/images/vbk.png',
              width: 200.0, height: 400.0),
          Text(
            'This is FootMan Application designed for Vaxjo BK football club.'
                'This application mainly helps in getting the recent event information in club including training, matches, holidays, etc.\n'
                ,
            textAlign: TextAlign.left,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'Developer Team:\n'
                'Jatin Sachdeva\n'
                'Ziad El-Jerbi\n'
                'Xaiohe Zhu',
            textAlign: TextAlign.justify,
            style: TextStyle(color: Colors.white,fontSize:12),
          )
        ],
      ),
    ),
    );
  }
}
