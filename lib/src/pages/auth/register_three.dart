import 'package:bold_app/src/utilities/constants.dart';
import 'package:flutter/material.dart';

class RegisterForm3 extends StatefulWidget {
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
                    // children: <Widget>[
                    // SizedBox(height: 20.0)
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          // _isDark = !_isDark;
                          items[index].selected = !items[index].selected;
                          // print(items[index].title);
                        });
                      },
                      child: Container(
                        width: double.infinity,
                        height: 80,
                        margin: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        decoration: BoxDecoration(
                            color: items[index].selected
                                ? Color(0xff43444c)
                                : Colors.white,
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                offset: Offset(4, 6),
                                blurRadius: 10,
                              )
                            ],
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 25.0),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    items[index].title,
                                    style: TextStyle(
                                        fontFamily: 'Avenir Regular',
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: items[index].selected
                                            ? Colors.white
                                            : Color(0xff1a1a1b)),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 3.0),
                            Padding(
                              padding: const EdgeInsets.only(left: 25.0),
                              child: Row(
                                children: <Widget>[
                                  Text(items[index].subtitle,
                                      style: TextStyle(
                                          fontFamily: 'Avenir Regular',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                          color: items[index].selected
                                              ? primaryColor
                                              : Color(0xff9cc6e8)))
                                ],
                              ),
                            ),
                          ],
                        ),
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
        onPressed: () {
          Navigator.pushNamed(context, 'tabbar');
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