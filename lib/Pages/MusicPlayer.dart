import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:just_audio/just_audio.dart';

import '../Colors.dart';
class MusicPlayer extends StatefulWidget {
  SongInfo songInfo;
  Function changeTrack;
  final GlobalKey<MusicPlayerState> key;
  MusicPlayer({this.songInfo,this.changeTrack,this.key}):super(key: key);

  @override
  MusicPlayerState createState() => MusicPlayerState();
}

class MusicPlayerState extends State<MusicPlayer> {
  double minimunValue=0.0,maximunValue=0.0, currentValue=0.0;
  String currentTime='', endTime='';
  final AudioPlayer player=AudioPlayer();
  bool isPlaying=false;


  @override
  void initState() {

    super.initState();
    setSong(widget.songInfo);
  }
  void dispose(){
    super.dispose();
    player?.dispose();
  }
  void setSong(SongInfo songInfo) async{
    widget.songInfo=songInfo;
    await player.setUrl(songInfo.uri);
    currentValue=minimunValue;
    maximunValue=player.duration.inMilliseconds.toDouble();
    setState(() {
      currentTime=getDuration(currentValue);
      endTime=getDuration(maximunValue);
    });
    isPlaying=false;
    changeStatus();
    player.positionStream.listen((duration) {
      currentValue=duration.inMilliseconds.toDouble();
      setState(() {
        currentTime=getDuration(currentValue);
      });
    });
  }
  void changeStatus(){
    setState(() {
      isPlaying=!isPlaying;
    });
    if(isPlaying){
      player.play();
    }else{
      player.pause();
    }
  }
  String getDuration(double value){
    Duration duration=Duration(milliseconds: value.round());
    return [duration.inMinutes,duration.inSeconds].map((e) => e.remainder(60).toString().padLeft(2,'0')).join(':');
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: color4,
      body: Container(
        margin: EdgeInsets.fromLTRB(5, 40, 5, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              maxRadius: size.width*0.3,
              backgroundImage: widget.songInfo.albumArtwork==null?
              AssetImage("assets/images/img1.jpg"):
              FileImage(File(widget.songInfo.albumArtwork)),),
            Container(
              margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Text(widget.songInfo.title,style: TextStyle(color: color1,fontSize: size.width*0.07,fontWeight: FontWeight.bold),),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
              child: Text(widget.songInfo.artist,style: TextStyle(color: color10,fontSize: size.width*0.04,fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: size.width*0.15,),
            Slider(
                inactiveColor: Colors.white12,
                activeColor: Colors.white,
                min: minimunValue,
                max: maximunValue,
                value: currentValue,
                onChanged:(value){
                  currentValue=value;
                  player.seek(Duration(milliseconds: currentValue.round()));
                }
            ),
            Container(
              transform: Matrix4.translationValues(0, -5, 0),
              margin: EdgeInsets.fromLTRB(5, 0, 5, 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(currentTime,style: TextStyle(color: color10,fontSize: size.width*0.04,fontWeight: FontWeight.bold),),
                  Text(endTime,style: TextStyle(color: color10,fontSize: size.width*0.04,fontWeight: FontWeight.bold),),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    child: Icon(Icons.skip_previous,color: color1,size: size.width*0.18,),behavior: HitTestBehavior.translucent,
                    onTap: (){
                      widget.changeTrack(false);
                    },
                  ),
                  GestureDetector(
                    child: Icon(isPlaying?Icons.pause_circle_filled:Icons.play_circle_fill,color: color1,size: size.width*0.2,),behavior: HitTestBehavior.translucent,
                    onTap: (){
                      // print("reconoce");
                      // player.pause();
                      changeStatus();
                    },
                  ),
                  GestureDetector(
                    child: Icon(Icons.skip_next,color: color1,size: size.width*0.18,),behavior: HitTestBehavior.translucent,
                    onTap: (){
                      widget.changeTrack(true);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
