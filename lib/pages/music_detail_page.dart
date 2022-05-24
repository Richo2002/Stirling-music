import 'dart:io';
import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:first/theme/colors.dart';

class MusicDetailPage extends StatefulWidget {
  final String title;
  final String description;
  final String img;
  final String songUrl;

  const MusicDetailPage({
    Key? key,
    required this.title,
    required this.description,
    required this.img,
    required this.songUrl})
    : super(key: key);
  @override
  State<MusicDetailPage> createState() => _MusicDetailPageState();
}

class _MusicDetailPageState extends State<MusicDetailPage> {
  double _currentSliderValue = 0;

  // audio player here
  late AudioPlayer advancedPlayer;
  late AudioCache audioCache;
  bool isLike = true;
  bool isPlaying = true;
  bool isRepeat=false;
  late double b;
  Duration _duration = new Duration();
  Duration _position = new Duration();

  @override

  void initState() {
    super.initState();
    initPlayer();
  }

  initPlayer() {
    advancedPlayer = new AudioPlayer();
    audioCache = new AudioCache(fixedPlayer: advancedPlayer);
    playSound(widget.songUrl);
    advancedPlayer.onDurationChanged.listen((d) {setState(() {
        _duration=d;
      });});
    advancedPlayer.onAudioPositionChanged.listen((p) {setState(() {
        _position=p;
      });});
    advancedPlayer.onPlayerCompletion.listen((event) {
      setState(() {
        _position = Duration(seconds: 0);
        if(isRepeat==true){
          isPlaying=true;
        }else{

        isPlaying=false;
        isRepeat=false;
        }
      });
    });
  }

  void seekToSecond(int second){
    Duration newDuration = Duration(seconds: second);

    advancedPlayer.seek(newDuration);
  }

  playSound(localPath) async {
    await audioCache.play(localPath);
  }

  pauseSound(localPath) async {
    await advancedPlayer.pause();
  }

  fastSound(localPath) async {
    await advancedPlayer.setPlaybackRate(1.5);
  }

  slowSound(localPath) async {
    await advancedPlayer.setPlaybackRate(0.5);
  }

  repeatSound(localPath) async {
    if(isRepeat==false){
          await advancedPlayer.setReleaseMode(ReleaseMode.LOOP);
          setState(() {
            isRepeat=true;
          });
        }else if(isRepeat==true){
          await advancedPlayer.setReleaseMode(ReleaseMode.RELEASE);
          isRepeat=false;
        }
  }

  seekSound() async {
    Uri audioFile = await audioCache.load(widget.songUrl);
    await advancedPlayer.setUrl(audioFile.path);
    advancedPlayer.seek(Duration(milliseconds: 2000));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pauseSound(widget.songUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }


  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(widget.img),
          fit: BoxFit.cover,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 20,
          sigmaY: 20,
        ),
        child: Container(
          alignment: Alignment.center,
          color: Colors.black.withOpacity(0.1),
          child: Column(
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
            Stack(
              children: [
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
                  child: Container(
                    width: size.width - 200,
                    height: size.width - 200,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: black,
                          blurRadius: 50,
                          spreadRadius: 5,
                          offset: Offset(-10, 40))
                      ], 
                      shape: BoxShape.circle,),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
                  child: Container(
                    width: size.width - 150,
                    height: size.width - 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(widget.img), fit: BoxFit.cover),
                      ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Container(
                width: size.width - 80,
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.share_rounded,
                        color: white,
                      ),
                      onPressed: null,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          widget.title,
                          style: TextStyle(
                              fontSize: 18,
                              color: white,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          width: 150,
                          child: Text(
                            widget.description,
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15, color: white.withOpacity(0.5)),
                          ),
                        )
                      ],
                    ),
                    IconButton(
                      icon: Icon(
                        isLike
                            ? Icons.favorite_border
                            :  Icons.favorite,
                        color: white,
                      ),
                      onPressed: () {
                        if (isLike) {
                          setState(() {
                            isLike = false;
                          });
                        } else {
                          setState(() {
                            isLike = true;
                          });
                        }
                      }
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Slider(
                activeColor: primary,
                value: _position.inSeconds.toDouble(),
                min: 0,
                max: _duration.inSeconds.toDouble(),
                onChanged: (double value) {
                  setState(() {
                    seekToSecond(value.toInt());
                    value = value;
                  });
                }),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _position.toString().split(".")[0],
                    style: TextStyle(color: white.withOpacity(0.5)),
                  ),
                  Text(
                    _duration.toString().split(".")[0],
                    style: TextStyle(color: white.withOpacity(0.5)),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      icon: Icon(
                        Icons.shuffle,
                        color: white.withOpacity(0.8),
                        size: 30,
                      ),
                      onPressed: null),
                  IconButton(
                      icon: Icon(
                        Icons.fast_rewind_rounded,
                        color: white,
                        size: 40,
                      ),
                      onPressed: () {
                        slowSound(widget.songUrl);
                      }),
                  IconButton(
                      icon: Icon(
                        isPlaying
                          ? Icons.pause_circle_outline_rounded
                          :  Icons.play_circle_outline_rounded,
                        color: white,
                        size: 60,
                      ),
                      onPressed: () {
                        if (isPlaying) {
                          pauseSound(widget.songUrl);
                          setState(() {
                            isPlaying = false;
                          });
                        } else {
                          playSound(widget.songUrl);
                          setState(() {
                            isPlaying = true;
                          });
                        }
                      }),
                  IconButton(
                      icon: Icon(
                        Icons.fast_forward_rounded,
                        color: white,
                        size: 40,
                      ),
                      onPressed: () {
                        fastSound(widget.songUrl);
                      }),
                  IconButton(
                      icon: Icon(
                        Icons.repeat,
                        color: white.withOpacity(0.8),
                        size: 30,
                      ),
                      onPressed: () {
                        repeatSound(widget.songUrl);
                      })
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    ),
    );
  }
}
