import 'package:feel_music_frontend/Components/MusicBoxWidget.dart';
import 'package:feel_music_frontend/Components/SearchWidget.dart';
import 'package:flutter/material.dart';

import '../Colors.dart';
class Principal extends StatefulWidget {
  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
          backgroundColor: color4,
          body: SingleChildScrollView(
            child: Container(
              height: size.height,
              child: Column(
                children: [
                  Text("By Name",style: TextStyle(color: color1,fontWeight: FontWeight.bold,fontSize: size.height*0.04 ),),
                  SearchWidget(size.width*0.94, size.height*0.06, color2),
                  MusicBoxWidget(size.width*0.44,size.height*0.22,"assets/images/img1.jpg","Believer","Imagine Dragons"),
                ],
              ),
            ),
          ),
        ) );
  }
}
