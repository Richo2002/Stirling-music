import 'dart:async';
import 'package:first/sidebar/sidebar_layout.dart';
import 'package:flutter/material.dart';
import 'package:first/pages/registration_page.dart';
import 'package:first/pages/login_page.dart';
import 'package:first/theme/colors.dart';
import 'package:first/pages/common/theme_helper.dart';
import 'myessai.dart';
import 'package:first/pages/home_page.dart';
import 'package:first/models/user.dart';

class Welcome extends StatefulWidget {
  const Welcome({ Key? key }) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  bool? userConnected;

  @override
  void initState() {
    super.initState();
    User.isLogged().then((value) {
      setState(() {
        userConnected = value;
      });
    });
    Timer(
      const Duration(seconds: 2),
      () {
        if(userConnected!) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => SideBarLayout()));
        }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/app/fond2.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 80.0,
            ),
            Center(
              child: Container(
                height: 150.0,
                width: 150.0,
                child: Center(
                  child: ClipOval(
                    child: Image.asset("assets/app/logo.png"), //put your logo here
                  ),
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 2.0,
                      offset: Offset(5.0, 3.0),
                      spreadRadius: 2.0,
                    )
                  ]
                ),
              ),
            ),
            SizedBox(
              height: 250.0,
            ),
            Container(
              decoration: ThemeHelper().buttonBoxDecoration2(context),
              child: ElevatedButton(
              style: ThemeHelper().buttonStyle2(),
              child: Padding(
              padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
              child: Text('S\'identifier', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: white),),
              ),
                onPressed: (){
                //After successful login we will redirect to profile page. Let's create profile page now
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
              },
             ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              decoration: ThemeHelper().buttonBoxDecoration2(context),
              child: ElevatedButton(
              style: ThemeHelper().buttonStyle2(),
              child: Padding(
              padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
              child: Text('Créer un compte', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: white),),
              ),
                onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationPage()));
              },
             ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}