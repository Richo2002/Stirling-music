import 'package:flutter/material.dart';
import 'package:first/json/songs_json.dart';
import 'package:first/theme/colors.dart';
import 'package:first/pages/detail_playlist.dart';
import 'package:page_transition/page_transition.dart';
import '../bloc.navigation_bloc/navigation_bloc.dart';

class PlayList extends StatefulWidget with NavigationStates{
  const PlayList({ Key? key }) : super(key: key);

  @override
  State<PlayList> createState() => _PlayListState();
}

class _PlayListState extends State<PlayList> { 
  late TextEditingController controller;
  String nomL = "";

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose(){
    controller.dispose();
  }

  void ajouterL(){
    Navigator.of(context).pop(controller.text);
    controller.clear();
  }
  Future<String?> openDialog() => showDialog<String>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Créer une playlist'),
      content: TextField(
        autocorrect: true,
        decoration: InputDecoration(hintText: 'Entrer nom'),
        controller: controller,
        onSubmitted: (_) => ajouterL(),
        ),
      actions: [
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: primary,
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
          ),
          child: Text('Ajouter', style: TextStyle(fontSize: 15, color: white,),),
        onPressed: ajouterL,)
      ]
    )

  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: primary,
        onPressed: () async {
          final nomL = openDialog();
        },
      ),
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
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, top: 20),
                  child: Row(
                    children: [
                      Text("Liste de lecture", style: TextStyle(fontSize: 18, color: primary2, fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: List.generate(myplaylist.length, (index) {
                return Padding(
                  padding:
                      const EdgeInsets.only(left: 30, bottom: 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                          PageTransition(
                            alignment: Alignment.bottomCenter,
                            child: dPlayList(
                              plist: myplaylist[index],
                            ),
                            type: PageTransitionType.scale));
                          },
                   child: Row(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          width: 30,
                          height: 35,
                          child: Center(
                            child: Icon(
                              Icons.folder,
                              color: grey,
                              size: 35,)
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: (size.width - 60) * 0.73,
                          child: Text( myplaylist[index]['name'] + "\n" + myplaylist[index]['chansons'] + " chansons",
                                style: TextStyle(color: white),
                              ),
                        ),
                        Container(
                          width: (size.width - 60) * 0.12,
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Center(
                                  child: Icon(
                                      Icons.more_vert,
                                      color: grey,
                                      size: 35,)
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
              ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}