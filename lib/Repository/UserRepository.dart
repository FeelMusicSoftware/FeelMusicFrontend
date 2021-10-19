
import 'dart:convert';

import 'package:feel_music_frontend/Repository/url.dart';

import 'package:http/http.dart' as http;

class UserRepository {


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
}
