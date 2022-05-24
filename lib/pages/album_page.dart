import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:page_transition/page_transition.dart';
import 'package:first/json/songs_json.dart';
import 'package:first/pages/music_detail_page.dart';
import 'package:first/theme/colors.dart';

class AlbumPage extends StatefulWidget {
  final dynamic song;

  const AlbumPage({Key? key, this.song}) : super(key: key);
  @override
  State<AlbumPage> createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  
  bool isAbonne = false;
  Color bgColor = red;
  Color couleur = white;
  Color bordercouleur = red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    List songAlbums = widget.song['songs'];
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                width: size.width,
                height: 220,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(widget.song['img']),
                        fit: BoxFit.cover)),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.song['title'],
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: white)),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                        backgroundColor: bgColor,
                        primary: couleur,
                        side: BorderSide(color: bordercouleur), 
                      ),
                      child: Text(
                        isAbonne
                          ? "Se désabonner"
                          : "S'abonner", style: TextStyle(
                            fontSize: 18)),
                      onPressed: () {
                        if (isAbonne) {
                          setState(() {
                            isAbonne = false;
                            bgColor =red;
                            couleur =white;
                            bordercouleur=red;
                          });
                        } else {
                          setState(() {
                            isAbonne = true;
                            bgColor = white;
                            couleur = black;
                            bordercouleur = black;
                          });
                        }
                      } )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
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
                                  artists[index]['song_count'],
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
              SizedBox(
                height: 30,
              ),
              Column(
                  children: List.generate(songAlbums.length, (index) {
                return Padding(
                  padding:
                      const EdgeInsets.only(left: 30, right: 30, bottom: 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              alignment: Alignment.bottomCenter,
                              child: MusicDetailPage(
                                title: songAlbums[index]['title'],
                                description: widget.song['description'],
                                img: widget.song['img'],
                                songUrl: songAlbums[index]['song_url'],
                              ),
                              type: PageTransitionType.scale));
                    },
                    child: Row(
                      children: [
                        Container(
                          width: (size.width - 60) * 0.77,
                          child: Text(
                            "${index + 1}  " + songAlbums[index]['title'],
                            style: TextStyle(color: white),
                          ),
                        ),
                        Container(
                          width: (size.width - 60) * 0.23,
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                songAlbums[index]['duration'],
                                style: TextStyle(color: grey, fontSize: 14),
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
                                      size: 16,)
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }))
            ],
          ),
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
          )
        ],
      ),
    );
  }
}
