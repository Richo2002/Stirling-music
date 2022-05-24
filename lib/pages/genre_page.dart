import 'dart:io';
import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:first/json/songs_json.dart';
import 'package:first/theme/colors.dart';
import 'package:page_transition/page_transition.dart';

class GenrePage extends StatefulWidget {
  final dynamic genre;

  const GenrePage({Key? key, this.genre}) : super(key: key);

  @override
  State<GenrePage> createState() => _GenrePageState();
}

class _GenrePageState extends State<GenrePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    List genreAlbums = widget.genre['genres'];
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(widget.genre['img']),
          fit: BoxFit.cover,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 20,
          sigmaY: 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: white,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 20,),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(widget.genre['title'], textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 45,
                            fontWeight: FontWeight.bold,
                            color: white, fontFamily: "Rage",)
                        ),
                      ],
                    ),
              ),
              SizedBox(
                height: 40,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: List.generate(genres.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    alignment: Alignment.bottomCenter,
                                    child: GenrePage(
                                      genre: genres[index],
                                    ),
                                    type: PageTransitionType.scale));
                          },
                          child: Column(
                            children: [
                              Container(
                                width: 140,
                                height: 100,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(genres[index]['img']),
                                    fit: BoxFit.cover),
                                    color: primary,
                                    borderRadius: BorderRadius.circular(0)),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                genres[index]['title'],
                                style: TextStyle(
                                  fontSize: 15,
                                  color: white,
                                  fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Column(
                        children: List.generate(genreAlbums.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: GestureDetector(
                                child: Row(
                                  children: [
                                    Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(genreAlbums[index]['image']),
                                          fit: BoxFit.cover,),
                                          color: primary,
                                          borderRadius: BorderRadius.circular(100)),
                                    ),
                                    Container(
                                      width: (size.width - 90) * 0.77,
                                      child: Text(
                                        "  " + genreAlbums[index]['title'],
                                        style: TextStyle(color: white, fontSize: 16),
                                      ),
                                    ),
                                    Container(
                                      width: (size.width - 90) * 0.23,
                                      height: 50,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            genreAlbums[index]['duration'],
                                            style: TextStyle(color: Colors.white, fontSize: 15),
                                          ),
                                          Container(
                                            width: 25,
                                            height: 25,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: primary2.withOpacity(0.8),
                                            ),
                                            child: Center(
                                                child: Icon(
                                                  Icons.play_arrow,
                                                  color: white,
                                                  size: 18,)
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }
                        )
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}