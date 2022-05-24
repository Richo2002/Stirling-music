import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:first/pages/widgets/header_widget.dart';
import 'package:first/theme/colors.dart';
import 'registration_page.dart';
import 'package:first/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../bloc.navigation_bloc/navigation_bloc.dart';

class ProfilePage extends StatefulWidget with NavigationStates{
  const ProfilePage({ Key? key }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>{
  User? user;
  
  @override
  void initState() {
    super.initState();

    User.getUserFromStorage().then((value) {
      setState(() {
        user = value;
      });
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        titleSpacing: 0.0,
        automaticallyImplyLeading: false,
        backgroundColor: black,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 10, right: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Mon compte",
                style: TextStyle(
                    fontSize: 25, color: white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
        child: Stack(
          children: [
            Container(height: 100, child: HeaderWidget(100,false,Icons.house_rounded),),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.fromLTRB(25, 10, 25, 10),
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(width: 5, color: white),
                      color: primary2,
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 20, offset: const Offset(5, 5),),
                      ],
                    ),
                    child: Icon(Icons.person, size: 80, color: white,),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        Card(
                          child: Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.all(5),
                            child: Column(
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    ...ListTile.divideTiles(
                                      color: Colors.grey,
                                      tiles: [
                                        ListTile(
                                          leading: Icon(Icons.person_outlined),
                                          title: Text("Nom"),
                                          subtitle: Text(user!.name!),
                                        ),
                                        ListTile(
                                          leading: Icon(Icons.person_outline),
                                          title: Text("Prénoms"),
                                          subtitle: Text(user!.firstName!),
                                        ),
                                        ListTile(
                                          leading: Icon(Icons.phone),
                                          title: Text("Phone"),
                                          subtitle: Text(user!.telephone!),
                                        ),
                                        ListTile(
                                          leading: Icon(Icons.email_rounded),
                                          title: Text("Email"),
                                          subtitle: Text(user!.email!),
                                        ),
                                        ListTile(
                                          leading: Icon(Icons.person),
                                          title: Text("About Me"),
                                          subtitle: Text(
                                              "La musique seule sait comment me faire vibrer"),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
    );
  }
}