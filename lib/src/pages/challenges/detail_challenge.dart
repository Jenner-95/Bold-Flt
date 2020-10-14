import 'package:bold_app/src/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailChallenge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Perfect Abs Challenge',
          style: TextStyle(fontFamily: 'Avenir Bold'),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            height: 200,
            child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.only(top: 20.0, left: 25.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      RichText(
                          text: TextSpan(
                              style: TextStyle(
                                  fontSize: 10.0, color: Colors.black),
                              children: <TextSpan>[
                            TextSpan(
                                text: 'Day 1',
                                style: TextStyle(
                                    fontSize: 17,
                                    fontFamily: 'Avenir Bold',
                                    color: primaryColor)),
                            TextSpan(
                                text: ' of 21\n',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontFamily: 'Avenir Regular',
                                )),
                            TextSpan(
                                text: 'Equipment:\n',
                                style: TextStyle(
                                    fontFamily: 'Avenir Regular',
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold)),
                          ])),
                      Wrap(
                        direction: Axis.horizontal,
                        children: <Widget>[
                          ButtonTheme(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            minWidth: 50.0,
                            height: 50.0,
                            child: RaisedButton(
                              onPressed: () {},
                              color: greyColor,
                              child: SvgPicture.asset(
                                'assets/images/pesasicon.svg',
                                fit: BoxFit.cover,
                                width: 20,
                              ),
                            ),
                          ),
                          SizedBox(width: 10.0),
                          ButtonTheme(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            minWidth: 50.0,
                            height: 50.0,
                            child: RaisedButton(
                              onPressed: () {},
                              color: greyColor,
                              child: SvgPicture.asset(
                                'assets/images/jumpropeicon.svg',
                                fit: BoxFit.cover,
                                width: 14,
                              ),
                            ),
                          ),
                          SizedBox(width: 10.0),
                          ButtonTheme(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            minWidth: 50.0,
                            height: 50.0,
                            child: RaisedButton(
                              onPressed: () {},
                              color: greyColor,
                              child: SvgPicture.asset(
                                'assets/images/yogamaticon.svg',
                                fit: BoxFit.cover,
                                width: 23,
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          RawMaterialButton(
                            padding: EdgeInsets.only(right: 20.0, bottom: 20.0),
                            onPressed: () {},
                            child: Row(
                              children: <Widget>[
                                Text(
                                  'Start Workout',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Avenir Regular',
                                  ),
                                ),
                                Icon(
                                  Icons.play_arrow,
                                  color: primaryColor,
                                  size: 45.0,
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 5,
              // margin: EdgeInsets.all(10),
            ),
          );
        },
      ),
    );
  }
}
