import 'dart:async';

import 'package:first/json/songs_json.dart';
import 'package:first/pages/detail_playlist.dart';
import 'package:first/pages/playlist.dart';
import 'package:first/pages/profile_page.dart';
import 'package:first/pages/welcome.dart';
import 'package:first/pages/genres.dart';
import 'package:first/pages/artistes.dart';
import 'package:first/pages/reglages.dart';
import 'package:first/sidebar/sidebar_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:first/theme/colors.dart';
import '../bloc.navigation_bloc/navigation_bloc.dart';
import '../sidebar/menu_item.dart';
import 'package:first/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:page_transition/page_transition.dart';

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> with SingleTickerProviderStateMixin<SideBar> {
  late AnimationController _animationController;
  late StreamController<bool> isSidebarOpenedStreamController;
  late Stream<bool> isSidebarOpenedStream;
  late StreamSink<bool> isSidebarOpenedSink;
  final _animationDuration = const Duration(milliseconds: 500);

  User? user;
  
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: _animationDuration);
    isSidebarOpenedStreamController = PublishSubject<bool>();
    isSidebarOpenedStream = isSidebarOpenedStreamController.stream;
    isSidebarOpenedSink = isSidebarOpenedStreamController.sink;

    User.getUserFromStorage().then((value) {
      setState(() {
        user = value;
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    isSidebarOpenedStreamController.close();
    isSidebarOpenedSink.close();
    super.dispose();
  }

  void onIconPressed() {
    final animationStatus = _animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;

    if (isAnimationCompleted) {
      isSidebarOpenedSink.add(false);
      _animationController.reverse();
    } else {
      isSidebarOpenedSink.add(true);
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return StreamBuilder<bool>(
      initialData: false,
      stream: isSidebarOpenedStream,
      builder: (context, isSideBarOpenedAsync) {
        return AnimatedPositioned(
          duration: _animationDuration,
          top: 0,
          bottom: 0,
          left: isSideBarOpenedAsync.data! ? 0 : -screenWidth,
          right: isSideBarOpenedAsync.data! ? 0 : screenWidth - 45,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  color: primary,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 60,
                      ),
                      ListTile(
                        title: Text(user!.firstName! + " " + user!.name!,
                        style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w800),
                        ),
                        leading: CircleAvatar(
                          child: Icon(
                            Icons.perm_identity,
                            color: Colors.white,
                          ),
                          radius: 40,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Divider(
                        height: 30,
                        thickness: 0.5,
                        color: white,
                        indent: 32,
                        endIndent: 32,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      MenuItem(
                        icon: Icons.home_rounded,
                        title: "Accueil",
                        onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => SideBarLayout()));},
                        couleur: white,
                      ),
                      MenuItem(
                        icon: Icons.person,
                        title: "Compte",
                        onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) =>ProfilePage()));},
                        couleur: white,
                      ),
                      MenuItem(
                        icon: Icons.category_rounded,
                        title: "Catégories music",
                        onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) =>GenresPage()));},
                        couleur: white,
                      ),
                      MenuItem(
                        icon: Icons.groups_rounded,
                        title: "Artistes",
                        onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) =>ArtistesPage()));},
                        couleur: white,
                      ),
                      MenuItem(
                        icon: Icons.playlist_play_rounded,
                        title: "Playlist",
                        onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) =>PlayList()));},
                        couleur: white,
                      ),
                      MenuItem(
                        icon: Icons.favorite_rounded,
                        title: "Favoris",
                        onTap: () {
                          Navigator.push(
                            context,
                              PageTransition(
                                alignment: Alignment.bottomCenter,
                                child: dPlayList(
                                  plist: myplaylist[0],
                                ),
                                type: PageTransitionType.scale));},
                        couleur: white,
                      ),
                      MenuItem(
                        icon: Icons.settings,
                        title: "Réglages",
                        onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) =>ReglagesPage()));},
                        couleur: white,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Divider(
                        height: 30,
                        thickness: 0.5,
                        color: white,
                        indent: 32,
                        endIndent: 32,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      MenuItem(
                        icon: Icons.exit_to_app,
                        title: "Déconnexion",
                        onTap: () {
                            Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) => Welcome()), (route) => false);
                        },
                        couleur: white,
                      ),
                          ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0, -0.9),
                child: GestureDetector(
                  onTap: () {
                    onIconPressed();
                  },
                  child: ClipPath(
                    clipper: CustomMenuClipper(),
                    child: Container(
                      width: 35,
                      height: 110,
                      color: primary,
                      alignment: Alignment.centerLeft,
                      child: AnimatedIcon(
                        progress: _animationController.view,
                        icon: AnimatedIcons.menu_close,
                        color: white,
                        size: 25,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class CustomMenuClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Paint paint = Paint();
    paint.color = Colors.white;

    final width = size.width;
    final height = size.height;

    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(width - 1, height / 2 - 20, width, height / 2);
    path.quadraticBezierTo(width + 1, height / 2 + 20, 10, height - 16);
    path.quadraticBezierTo(0, height - 8, 0, height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
