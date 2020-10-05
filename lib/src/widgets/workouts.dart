import 'package:bold_app/src/utilities/constants.dart';
import 'package:flutter/material.dart';

class WorkoutsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Container(
            padding: EdgeInsets.all(25.0),
            child: Column(
              children: <Widget>[
                SizedBox(height: 10.0),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Pilates',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Avenir Bold',
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Container(
                          height: 2.0,
                          width: MediaQuery.of(context).size.width * 0.63,
                          color: primaryColor),
                    ),
                  ],
                ),
                SizedBox(height: 5.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        CardImage(),
                        Spacer(),
                        CardImage(),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        CardImage(),
                        Spacer(),
                        CardImage(),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        CardImageLarge(),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 30.0),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Barre & Sculpt',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'Avenir Bold',
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Container(
                        height: 2.0,
                        width: MediaQuery.of(context).size.width * 0.45,
                        color: primaryColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        CardImage(),
                        Spacer(),
                        CardImage(),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        CardImage(),
                        Spacer(),
                        CardImage(),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        CardImageLarge(),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class CardImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, 'detail_workout'),
      child: Container(
        width: 180,
        height: 180,
        child: Card(
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Stack(children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/photos/work_1.png'),
                      fit: BoxFit.cover)),
            ),
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0x99000000),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 100.0, left: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    RichText(
                        text: TextSpan(
                            style: TextStyle(
                              fontSize: 12.0,
                              color: primaryColor,
                              fontFamily: 'Avenir Regular',
                            ),
                            children: <TextSpan>[
                          TextSpan(
                              text: '30 min\n',
                              style: TextStyle(
                                fontFamily: 'Avenir Bold',
                              )),
                          TextSpan(
                              text: 'Pilates\n',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Avenir Bold',
                              )),
                          TextSpan(
                              text: 'But Workout\n',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 8.0,
                              )),
                        ])),
                  ],
                ),
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
  }
}

class CardImageLarge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 180,
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Stack(children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/photos/work.png'),
                    fit: BoxFit.cover)),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0x99000000),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 100.0, left: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  RichText(
                      text: TextSpan(
                          style: TextStyle(
                            fontSize: 12.0,
                            color: primaryColor,
                            fontFamily: 'Avenir Regular',
                          ),
                          children: <TextSpan>[
                        TextSpan(
                            text: '25 min\n',
                            style: TextStyle(
                              fontFamily: 'Avenir Bold',
                            )),
                        TextSpan(
                            text: 'Bodybuilding\n',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Avenir Bold',
                            )),
                        TextSpan(
                            text: 'Leg Workout\n',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 8.0,
                            )),
                      ])),
                ],
              ),
            ),
          )
        ]),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 5,
        margin: EdgeInsets.all(10),
      ),
    );
  }
}
