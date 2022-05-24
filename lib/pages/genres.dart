import 'package:flutter/material.dart';
import 'package:first/slide/carousel_slider.dart';
import 'package:page_transition/page_transition.dart';
import 'package:first/json/songs_json.dart';
import 'package:first/pages/album_page.dart';
import 'package:first/pages/genre_page.dart';
import 'package:first/pages/playlist.dart';
import 'package:first/theme/colors.dart';
import '../bloc.navigation_bloc/navigation_bloc.dart';

class GenresPage extends StatefulWidget with NavigationStates {
  const GenresPage({ Key? key }) : super(key: key);

  @override
  State<GenresPage> createState() => _GenresPageState();
}

class _GenresPageState extends State<GenresPage> {
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        titleSpacing: 0.0,
        automaticallyImplyLeading: false,
        backgroundColor: black,
        elevation: 0,title: Padding(
          padding: const EdgeInsets.only(left: 10, right: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Catégories",
                style: TextStyle(
                    fontSize: 25, color: white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        actions: [Icon(Icons.search), SizedBox(width: 20)],
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    final double width0 = MediaQuery.of(context).size.width;
    final double height0 = MediaQuery.of(context).size.height;
    return Container(
      child: CarouselSlider(
        options: CarouselOptions(
          aspectRatio: 2.0,
          enlargeCenterPage: true,
          scrollDirection: Axis.vertical,
          autoPlay: true,
          height: height0,
        ),
          items: List.generate(genres.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 15),
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
                          child: ClipRRect(
                            child: Stack(
                              alignment: Alignment.center,
                              children: <Widget>[
                                Container(
                                  width: width0,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(genres[index]['img']),
                                        fit: BoxFit.cover),
                                    color: primary,
                                  ),
                                ),
                                Text(
                                  genres[index]['title'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 34, fontFamily: "Rage",
                                  ),
                                ),
                                Positioned(
                                  bottom: 0.0,
                                  left: 0.0,
                                  right: 0.0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color.fromARGB(200, 0, 0, 0),
                                          Color.fromARGB(0, 0, 0, 0)
                                        ],
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ),
                      );
              }),
        ),
    );
  }
}