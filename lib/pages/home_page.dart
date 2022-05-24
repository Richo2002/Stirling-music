import 'package:first/pages/artistes.dart';
import 'package:flutter/material.dart';
import 'package:first/slide/carousel_slider.dart';
import 'package:page_transition/page_transition.dart';
import 'package:first/json/songs_json.dart';
import 'package:first/pages/album_page.dart';
import 'package:first/pages/genre_page.dart';
import 'package:first/pages/genres.dart';
import 'package:first/pages/playlist.dart';
import 'package:first/theme/colors.dart';
import '../bloc.navigation_bloc/navigation_bloc.dart';

class HomePage extends StatefulWidget with NavigationStates{
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activeMenu1 = 0;
  int activeMenu2 = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      floatingActionButton: FloatingActionButton.extended(
	      backgroundColor: primary,
        label: Row(
          children: [Icon(Icons.playlist_play_rounded), Text('Playlist')],
        ),
        onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => PlayList()));
        },
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
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 20),
                child: TextField(
                  cursorColor: black,
                  cursorRadius: Radius.circular(10.0),
                  style: TextStyle(color: black),
                  decoration: InputDecoration(
                    hintText: "Rechercher des musiques...",
                    hintStyle: TextStyle(color: black),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0), borderSide: BorderSide.none),
                    prefixIcon: Icon(
                      Icons.search,
                      color: black,
                    ),
                    filled: true,
                    fillColor: Colors.white),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                ),
                items: sliders
                .map((item) => Container(
                      child: Container(
                        margin: EdgeInsets.all(1.0),
                        child: ClipRRect(
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  width: 1000.0,
                                  height: 210,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(sliders[sliders.indexOf(item)]['img']),
                                        fit: BoxFit.cover),
                                    color: primary,
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
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 20.0),
                                    child:  TextButton(
                                      style: TextButton.styleFrom(
                                        backgroundColor: red,
                                        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                                        alignment: Alignment.center,
                                      ),
                                      child: Text(sliders[sliders.indexOf(item)]['text'], style: TextStyle(fontSize: 15, color: white,),),
                                    onPressed: null,)
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ))
                .toList(),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, top: 20),
                  child: Row(
                    children: List.generate(1, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: GestureDetector(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                TextButton(
                                  child: Text("GENRES", style: TextStyle(fontSize: 15, color: primary2, fontWeight: FontWeight.bold),),
                                  onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) =>GenresPage()));},),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  })),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Row(
                    children: List.generate(genres.length, (index) {
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
                          child: Card(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                width: 220,
                                height: 180,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(genres[index]['img']),
                                        fit: BoxFit.cover),
                                    color: primary,
                                    borderRadius: BorderRadius.circular(10)),
                                ),
                                Text(
                                  genres[index]['title'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 24,
                                  ),
                                ),
                              ],
                          ),
                        ),
                      ),
                      );
                    }),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, top: 20),
                  child: Row(
                    children: List.generate(1, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: GestureDetector(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                TextButton(
                                  child: Text("ARTISTES LES PLUS POPULAIRES", style: TextStyle(fontSize: 15, color: grey, fontWeight: FontWeight.bold),),
                                  onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) =>ArtistesPage()));},),
                                ],
                            )
                          ],
                        ),
                      ),
                    );
                  })),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Row(
                    children: List.generate(artists.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    alignment: Alignment.bottomCenter,
                                    child: AlbumPage(
                                      song: artists[index],
                                    ),
                                    type: PageTransitionType.scale));
                          },
                          child: Column(
                            children: [
                              Container(
                                width: 180,
                                height: 180,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image:
                                            AssetImage(artists[index]['img']),
                                        fit: BoxFit.cover),
                                    color: primary,
                                    borderRadius: BorderRadius.circular(100)),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                artists[index]['title'],
                                style: TextStyle(
                                    fontSize: 15,
                                    color: white,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: 180,
                                child: Text(
                                  artists[index]['description'],
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: grey,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
