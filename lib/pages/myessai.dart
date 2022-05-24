import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class MyEssai extends StatefulWidget {
  const MyEssai({ Key? key }) : super(key: key);

  @override
  State<MyEssai> createState() => _MyEssaiState();
}

class _MyEssaiState extends State<MyEssai> {
  selectFromImagePicker() async {
    File image = (await ImagePicker.platform.getImage(
      source: ImageSource.gallery,
      maxWidth: null,
      maxHeight: null,
      imageQuality: null,
      preferredCameraDevice: CameraDevice.rear,
    )) as File;
    if (image == null) return;
    setState(() {
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TFLite Demo"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.image),
        tooltip: "Pick Image from gallery",
        onPressed: selectFromImagePicker,
      ),
      body: Stack(
      ),
    );
  }
}