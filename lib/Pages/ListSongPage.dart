import 'package:feel_music_frontend/Colors.dart';
import 'package:flutter/material.dart';
class ListSongPage extends StatefulWidget {
  @override
  _ListSongPageState createState() => _ListSongPageState();
}

class _ListSongPageState extends State<ListSongPage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: color4,
      body: SingleChildScrollView(),
    );
  }
}
