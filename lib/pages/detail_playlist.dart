import 'package:flutter/material.dart';
import 'package:first/json/songs_json.dart';
import 'package:first/pages/music_detail_page.dart';
import 'package:first/pages/playlist.dart';
import 'package:first/theme/colors.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:page_transition/page_transition.dart';

class dPlayList extends StatefulWidget {
  final dynamic plist;

  const dPlayList({Key? key, this.plist}) : super(key: key);

  @override
  State<dPlayList> createState() => _dPlayListState();
}

class _dPlayListState extends State<dPlayList> {
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
                "Playlist",
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
    List favoriSons = widget.plist['songs'];
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.only(left: 15, top: 20),
                  child: Row(
                    children: [
                      Text(widget.plist['name'], style: TextStyle(fontSize: 18, color: primary2, fontWeight: FontWeight.bold),),
                    ],
                  ),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                  children: List.generate(favoriSons.length, (index) {
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
                                title: favoriSons[index]['title'],
                                description: "",
                                img: "assets/images/6.jpg",
                                songUrl: favoriSons[index]['song_url'],
                              ),
                              type: PageTransitionType.scale));
                    },
                    child: Row(
                      children: [
                        Container(
                          width: (size.width - 60) * 0.77,
                          child: Text(
                            "${index + 1}  " + favoriSons[index]['title'],
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
                                favoriSons[index]['duration'],
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
        ],
      ),
    );
  }
}