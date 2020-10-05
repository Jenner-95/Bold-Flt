import 'package:bold_app/src/utilities/constants.dart';
import 'package:flutter/material.dart';

class CompletedChallenge extends StatelessWidget {
  List<String> imgs = [
    "assets/photos/work.png",
    "assets/photos/work_3.png",
  ];

  List<String> titles = [
    "Perfect Abs",
    "Full Body Workout",
  ];

  List<String> subtitles = [
    "21 day Challenge",
    "2 week Challenge",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        itemCount: imgs.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'detail_challenge');
            },
            child: Container(
              height: 120,
              child: Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Stack(children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(imgs[index]), fit: BoxFit.cover)),
                  ),
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Color(0x99000000),
                        borderRadius: BorderRadius.circular(10.0)),
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(top: 10.0, left: 25.0),
                      child: RichText(
                          text: TextSpan(
                              style: TextStyle(
                                  fontSize: 10.0, color: primaryColor),
                              children: <TextSpan>[
                            TextSpan(
                                text: '${titles[index]}\n',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontFamily: 'Avenir Bold',
                                )),
                            TextSpan(
                                text: '${subtitles[index]}\n',
                                style: TextStyle(
                                  fontSize: 17.0,
                                  fontFamily: 'Avenir Regular',
                                  fontWeight: FontWeight.bold,
                                )),
                          ])),
                    ),
                  )
                ]),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5,
                margin: EdgeInsets.all(10),
              ),
            ),
          );
        },
      ),
    );
  }
}
