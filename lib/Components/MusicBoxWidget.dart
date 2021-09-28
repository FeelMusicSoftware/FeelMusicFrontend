import 'package:feel_music_frontend/Colors.dart';
import 'package:flutter/material.dart';
class MusicBoxWidget extends StatelessWidget {
  double _width;
  double _height;
  String _image;
  String _songName;
  String _artistName;

  MusicBoxWidget(
      this._width, this._height, this._image, this._songName, this._artistName);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: _height,
          width: _width,
          margin: EdgeInsets.only(left: 10,top: 10,bottom: 10,right: 10),
          padding: EdgeInsets.only(right: 10,left: 10,top: 5,bottom: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            image:DecorationImage(
              image: AssetImage(_image),
              fit: BoxFit.fill
            ),
            // borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0),bottomLeft: Radius.circular(10.0)),
            // color: _color,
          ),
          // child: Image(image: AssetImage(_image),),
        ),
        Text(_songName,style: TextStyle(color: color1,fontWeight: FontWeight.bold,fontSize: _height*0.12),),
        Text(_artistName,style: TextStyle(color: color1.withOpacity(0.5),fontSize: _height*0.08),),
      ],
    );
  }
}
