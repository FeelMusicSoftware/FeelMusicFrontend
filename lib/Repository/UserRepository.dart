
import 'dart:convert';

import 'package:feel_music_frontend/Repository/url.dart';

import 'package:http/http.dart' as http;
import 'package:feel_music_frontend/Repository/url.dart' as api;
import 'package:feel_music_frontend/Models/LoginRequest.dart';
import 'package:feel_music_frontend/Repository/Token.dart';
import 'package:feel_music_frontend/Models/User.dart';

class UserRepository {

  Future<bool> signIn(LoginRequest loginRequest)async {
    try{
      var url= directionUrl + "user/signin";
      final response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(loginRequest.toJson())
      );
      if(response.statusCode==200){
        var tok=json.decode(response.body)["token"];
        print("DoneConfirmUser SIIIIIIIIII");
        await Token().setToken(tok);
        return true;
      }
      else{
        return false;
      }
    }
    catch(e){
      print(e);
      return false;
    }
  }

  // Future<User> obtainUserProfile(int userId) async {
  //   try {
  //
  //     String url = directionUrl + "user/" + userId.toString();
  //     User user = User();
  //     var res = await http.get(url, //ip for virtualized devices
  //         headers: <String, String>{
  //           'Content-Type': 'application/json; charset=UTF-8',
  //         });
  //     var user2 = jsonDecode(res.body);
  //     user = User.fromJson(user2);
  //     if (res.statusCode == 200) {
  //       // print("obtencion de datos del usuario");
  //       return user;
  //     } else {
  //       return null;
  //     }
  //   } catch (error) {
  //     print(error);
  //     return null;
  //   }
  // }

  // Future<User> confirmUser(ConfirmUser confirmUser) async {
  //   try {
  //     String url = directionUrl + "user/login";
  //     User user = User();
  //     var res = await http.post(url, //ip for virtualized devices
  //         headers: <String, String>{
  //           'Content-Type': 'application/json; charset=UTF-8',
  //         },
  //         body: jsonEncode(confirmUser.toJsonUp()));
  //     var user2 = jsonDecode(res.body);
  //     user = User.fromJson(user2);
  //     if (res.statusCode == 200) {
  //       // print("DoneConfirmUser");
  //       return user;
  //     } else {
  //       return null;
  //     }
  //   } catch (error) {
  //     print(error);
  //     return null;
  //   }
  // }

  // Future<User> addUser(User user) async {
  //   try {
  //     String url = directionUrl + "user";
  //     User user1 = User();
  //     print("llego al repositorio del addUser");
  //     var res = await http.post(url, //ip for virtualized devices
  //         headers: <String, String>{
  //           'Content-Type': 'application/json; charset=UTF-8',
  //         },
  //         body: jsonEncode(user.toJson()));
  //     var user2 = jsonDecode(res.body);
  //     user1 = User.fromJson(user2);
  //     if (res.statusCode == 200) {
  //       print("DoneCreateUser");
  //       return user1;
  //     } else {
  //       return null;
  //     }
  //   } catch (error) {
  //     print(error);
  //     return null;
  //   }
  // }


  Future<bool> signup(User user,LoginRequest loginRequest)async {
    try{
      var url= directionUrl + "user/signup";
      final response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(loginRequest.toJson())
      );
      if(response.statusCode==200){
        var urlSignup=directionUrl + "person";
        var body=json.decode(response.body);
        final res = await http.post(urlSignup,
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'Authorization':body["token"],
            },
            body: jsonEncode(user.toJson())
        );
        if(res.statusCode==200){
          return true;
        }
        else{
          return false;
        }
      }
      else{
        return false;
      }
    }
    catch(e){
      print(e);
      return false;
    }
  }

}
