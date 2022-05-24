import 'dart:async';
import 'package:first/pages/welcome.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  final String title;

  const Splash({Key? key, required this.title}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  bool _isVisible = false;

  _SplashState(){

    new Timer(const Duration(milliseconds: 4000), (){
      setState(() {
        Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => Welcome()), (route) => false);
      });
    });

    new Timer(
      Duration(milliseconds: 20),(){
        setState(() {
          _isVisible = true; // Now it is showing fade effect and navigating to Login page
        });
      }
    );

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/app/f2.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: AnimatedOpacity(
        opacity: _isVisible ? 1.0 : 0,
        duration: Duration(milliseconds: 2300),
        child: Center(
          child: Container(
            height: 200.0,
            width: 200.0,
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
      ),
    );
  }
}