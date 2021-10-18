

import 'dart:io';

import 'package:feel_music_frontend/Colors.dart';
import 'package:feel_music_frontend/Pages/MusicPlayer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  final FlutterAudioQuery audioQuery=FlutterAudioQuery();
  List<SongInfo> songs=[];
  int currentIndex=0;
  final GlobalKey<MusicPlayerState> key=GlobalKey<MusicPlayerState>();

  @override
  void initState() {
    super.initState();
    getTracks();
  }
  void getTracks() async{
    songs=await audioQuery.getSongs();
    setState(() {
      songs=songs;
    });
  }
  void changeTrack(bool isNext){
    if(isNext){
      if(currentIndex!=songs.length-1){
        currentIndex++;
      }
    }else{
      if(currentIndex!=0){
        currentIndex--;
      }
    }
    key.currentState.setSong(songs[currentIndex]);
  }
  @override
  Widget build(BuildContext context) {
    // return Container(color: color3,);
    return ListView.separated(

        separatorBuilder: (context,index)=>Divider(),
        itemCount: songs.length,
        itemBuilder: (context,index)=>ListTile(
          leading: CircleAvatar(
            backgroundImage: songs[index].albumArtwork==null?
            AssetImage("assets/images/img1.jpg"):
            FileImage(File(songs[index].albumArtwork)),),
              title: Text(songs[index].title),
              subtitle: Text(songs[index].artist),
              onTap: (){
                currentIndex=index;
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MusicPlayer(changeTrack: changeTrack,songInfo: songs[currentIndex],key: key,)));
              },),
    );
  }
}
