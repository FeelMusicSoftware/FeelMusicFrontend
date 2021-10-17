import 'package:feel_music_frontend/Colors.dart';
import 'package:feel_music_frontend/Components/MusicCard.dart';
import 'package:flutter/material.dart';
class ListSongPage extends StatefulWidget {
  @override
  _ListSongPageState createState() => _ListSongPageState();
}

class _ListSongPageState extends State<ListSongPage> {
  List<String> _songs=["Believer","Natural","Jamas","Pink","Believer","Natural","Jamas","Pink"];
  List<String> _artist=["Imagine Dragons","Imagine Dragons","Camilo Cesto","Aerosmith","Imagine Dragons","Imagine Dragons","Camilo Cesto","Aerosmith"];
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: color4,
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          width: size.width,
          child: ListView.builder(
              itemCount: _songs.length,
              itemBuilder:(context,index){
                if(index%2==0){
                  return MusicCard(size.width, size.height*0.11, color4, _songs[index], _artist[index]);
                }
                else{
                  return MusicCard(size.width, size.height*0.11, color3, _songs[index], _artist[index]);
                }
              }
          ),
        ),
      ),
    );
  }
}
