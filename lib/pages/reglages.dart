import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:first/pages/widgets/header_widget.dart';
import 'package:first/theme/colors.dart';
import 'registration_page.dart';
import 'package:first/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../bloc.navigation_bloc/navigation_bloc.dart';

class ReglagesPage extends StatefulWidget {
  const ReglagesPage({ Key? key }) : super(key: key);

  @override
  State<ReglagesPage> createState() => _ReglagesPageState();
}

class _ReglagesPageState extends State<ReglagesPage> {
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
                "Réglages",
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
    var size = MediaQuery.of(context).size;
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.fromLTRB(25, 10, 25, 10),
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Column(
                children: [

                ],
              ),
            )
            ],
          ),
          ]
        ),
      );
    }
}