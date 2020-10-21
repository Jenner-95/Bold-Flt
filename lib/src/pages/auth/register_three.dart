import 'dart:convert';

import 'package:bold_app/src/pages/tabbar/tabbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:bold_app/src/utilities/constants.dart';
import 'package:bold_app/src/utilities/url_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterForm3 extends StatefulWidget {
  final PageController controller;

  const RegisterForm3({Key key, this.controller}) : super(key: key);
  @override
  _RegisterForm3State createState() => _RegisterForm3State();
}

class _RegisterForm3State extends State<RegisterForm3> {
  List<LisTile> items = <LisTile>[
    LisTile(1, "Get Fitter", "Tone up & Feel healthy"),
    LisTile(2, "Gain Muscle", "Build mass & Strength"),
    LisTile(3, "Lose Weight", "Get energized"),
    LisTile(4, "Be More Active", "Reduce health risks"),
    LisTile(5, "Increase Flexibility", "Improve posture & balance"),
    LisTile(6, "Get Healthy", "Get motivated & Feel better"),
  ];
  //SharedPreferences
  int selected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        // child: Container(
        child: Column(
          children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Text(
                'SELECT YOUR MAIN FITNESS GOAL',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    fontFamily: 'Avenir Regular'),
              )
            ]),
            Container(
              height: 650,
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: this.items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: ChoiceChip(
                        elevation: 3,
                        selectedColor: Colors.white,
                        backgroundColor: Color(0xff43444c),
                        padding: EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 20.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        label: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              items[index].title,
                              style: TextStyle(
                                  fontFamily: 'Avenir Regular',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: items[index].id != selected
                                      ? Colors.white
                                      : Color(0xff1a1a1b)),
                            ),
                            Text(items[index].subtitle,
                                style: TextStyle(
                                    fontFamily: 'Avenir Regular',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: items[index].id != selected
                                        ? primaryColor
                                        : Color(0xff9cc6e8))),
                          ],
                        ),
                        onSelected: (value) {
                          setState(() {
                            selected = items[index].id;
                          });
                          print(selected);
                        },
                        selected: selected == items[index].id,
                      ),
                    );
                  }
                  // ],
                  ),
            ),
          ],
        ),
        // ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          String name = prefs.getString('names');
          String email = prefs.getString('emails');
          String password = prefs.getString('passwords');
          int plan = prefs.getInt('selected');
          String month = prefs.getString('month');
          String day = prefs.getString('day');
          String year = prefs.getString('year');
          String country = prefs.getString('country');
          int gender = prefs.getInt('gender_select');
          String tall = prefs.getString('tall');
          String weight = prefs.getString('weight');
          if (selected != null) {
            http.post(URL.base + 'api/user/', body: {
              'name': name,
              "email": email,
              "password": password,
              // "plan": plan,
              "birth_date": '$year-$month-$day',
              "country": country,
              // "gender": gender,
            }).then((response) {
              Map<String, dynamic> post = json.decode(response.body);
              print(response.statusCode);
              print('Post: $post');
              if (response.statusCode == 200 || response.statusCode == 201) {
                http.post(URL.base + 'api/user/token/', body: {
                  'email': email,
                  'password': password
                }).then((response) {
                  Map<String, dynamic> post = json.decode(response.body);
                  print(post);
                  print(post['access']);
                  if (response.statusCode == 200) {
                    print(response.statusCode);
                    if (post.containsKey('access')) {
                      prefs.setString("jwt", post['access']);
                      prefs.setString("refresh", post['refresh']);
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (BuildContext context) => TabsPage()),
                          (Route<dynamic> route) => false);
                    } else {
                      print("error");
                    }
                  } else {
                    print("error");
                  }
                });
              } else {
                print("error");
              }
            });
          } else {
            print("error");
          }
        },
        child: Icon(
          Icons.check,
          color: Colors.black,
        ),
        backgroundColor: primaryColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class LisTile {
  final int id;
  final String title;
  final String subtitle;
  bool selected = true;

  LisTile(this.id, this.title, this.subtitle);
}
