import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'package:bold_app/src/utilities/url_api.dart';
import 'package:bold_app/src/preferences/user_preferences.dart';

class UserProvider {
  String jwt = '';
  final _prefs = new UserPreferences();
  Future<Map<String, dynamic>> login(String email, String password) async {
    await http.post(
      URL.base + 'api/user/token/',
      // headers: {"Content-Type": "application/json"},
      body: {
        'email': email,
        'password': password,
      },
    ).then((resp) {
      Map<String, dynamic> decodedResp = json.decode(resp.body);
      // if (resp.statusCode == 200) {
      print(resp.statusCode);
      if (decodedResp.containsKey('jwt')) {
        print(decodedResp['jwt']);
        _prefs.token = decodedResp['jwt'];
        print(_prefs.token);
        return {'ok': true, 'token': decodedResp['jwt']};
      } else {
        return {'ok': false, 'mensaje': decodedResp['message']};
      }
      // }
    });
  }

//   Future<Map<String, dynamic>> nuevoUser(String email, String password) async {
//     final authData = {
//       'email': email,
//       'password': password,
//       'returnSecureToken': true
//     };

//     final resp = await http.post(
//         'https://bold-backend.herokuapp.com/api/user/login/',
//         body: json.encode(authData));

//     Map<String, dynamic> decodedResp = json.decode(resp.body);
//     print(decodedResp);
//     //Esto esta de mas investigar...
//     if (decodedResp.containsKey('idToken')) {
//       return {'ok': true, 'token': decodedResp['idToken']};
//     } else {
//       return {'ok': false, 'mensaje': decodedResp['error']['message']};
//     }
//   }
}
