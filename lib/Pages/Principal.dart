import 'package:feel_music_frontend/Components/BottomNavbar.dart';
import 'package:feel_music_frontend/Components/MusicBoxWidget.dart';
import 'package:feel_music_frontend/Components/SearchWidget.dart';
import 'package:flutter/material.dart';

import '../Colors.dart';
class Principal extends StatefulWidget {
  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  List<String> _images=["assets/images/img1.jpg","assets/images/img2.jpg","assets/images/img3.jpeg","assets/images/img4.jpg"];
  List<String> _songs=["Believer","Natural","Jamas","Pink"];
  List<String> _artist=["Imagine Dragons","Imagine Dragons","Camilo Cesto","Aerosmith"];
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
          // appBar: AppBar(
          //   toolbarHeight: size.height * 0.08,
          //   backgroundColor: color3,
          //   elevation: 5,
          //   title: Text(
          //     "Playlists",
          //     style: TextStyle(fontSize: size.height * 0.036,color: color1),
          //   ),
          //   centerTitle: true,
          // ),
          backgroundColor: color4,
          body: SingleChildScrollView(
            child: Container(
              height: size.height,
              padding: EdgeInsets.only( bottom: 10),
              // margin: EdgeInsets.only(top: 5,bottom: 10),
              child: Column(
                children: [
                  Text("By Name",style: TextStyle(color: color1,fontWeight: FontWeight.bold,fontSize: size.height*0.04 ),),
                  SearchWidget(size.width*0.95, size.height*0.06, color2),
                  Container(
                    width: size.width*0.98,
                    height: size.height*0.74,
                    child: Row(
                      children: [
                        // MusicBoxWidget(size.width*0.44, size.height*0.22, _images[0], _songs[0], _artist[0]),
                        // MusicBoxWidget(size.width*0.44, size.height*0.22, _images[1], _songs[1], _artist[1]),
                        Container(
                          width: size.width*0.48,
                          // height:size.height*0.4,
                          child: ListView.builder(
                            itemCount: _images.length,
                              itemBuilder: (context,index){
                                return MusicBoxWidget(size.width*0.44, size.height*0.22, _images[index], _songs[index], _artist[index]);
                              }
                          ),
                        ),
                        Container(
                          width: size.width*0.48,
                          child: ListView.builder(
                              itemCount: _images.length,
                              itemBuilder: (context,index){
                                return MusicBoxWidget(size.width*0.44, size.height*0.22, _images[index], _songs[index], _artist[index]);
                              }
                          ),
                        ),
                      ],
                    ),
                  ),
                  // MusicBoxWidget(size.width*0.44,size.height*0.22,"assets/images/img1.jpg","Believer","Imagine Dragons"),
                ],
              ),
            ),
          ),
          // bottomNavigationBar: BottomNavbar(),
        ) );
  }
}
