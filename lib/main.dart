import 'package:flutter/material.dart';
import 'package:first/pages/splash.dart';
import 'package:first/theme/colors.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'TodoList',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
    home: Splash(title: 'Stirling Music'),
  ));
}