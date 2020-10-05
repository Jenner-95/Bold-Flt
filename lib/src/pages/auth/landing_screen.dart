import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bold_app/src/utilities/constants.dart';

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0x99000000),
              image: DecorationImage(
                image: AssetImage('assets/photos/sign_in.png'),
                fit: BoxFit.cover,
              ),
            ),
            constraints: BoxConstraints.expand(),
          ),
          Container(
            decoration: BoxDecoration(
              color: Color(0x99000000),
            ),
          ),
          ListView(
            children: <Widget>[
              Container(
                  padding: EdgeInsets.only(top: 80.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: SvgPicture.asset(
                                'assets/images/boldlogo.svg',
                                height: 85.0,
                                fit: BoxFit.cover,
                                color: primaryColor),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 100.0, horizontal: 50.0),
                        child: Row(
                          children: <Widget>[
                            RichText(
                                text: TextSpan(
                                    style: TextStyle(
                                        fontFamily: 'Avenir Regular',
                                        fontSize: 19.0,
                                        color: primaryColor),
                                    children: <TextSpan>[
                                  TextSpan(text: '"BE MENTALLY\n'),
                                  TextSpan(
                                      text: '  STRONGER\n',
                                      style:
                                          TextStyle(fontFamily: 'Avenir Bold')),
                                  TextSpan(text: '  THAN WHAT YOU\n'),
                                  TextSpan(
                                      text: '  PHYSICALLY\n',
                                      style:
                                          TextStyle(fontFamily: 'Avenir Bold')),
                                  TextSpan(text: '  FEEL"\n'),
                                ])),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 130.0),
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                ButtonTheme(
                                  minWidth: 370.0,
                                  height: 50.0,
                                  child: RaisedButton(
                                    textColor: Colors.black,
                                    color: primaryColor,
                                    padding: EdgeInsets.all(8.0),
                                    onPressed: () => Navigator.pushNamed(
                                        context, 'register'),
                                    child: Text(
                                      'Sign Up',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15.0,
                                          fontFamily: 'Avenir Regular'),
                                    ),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              'Already have an account?',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.0,
                                  fontFamily: 'Avenir Light'),
                            ),
                            FlatButton(
                              onPressed: () =>
                                  Navigator.pushNamed(context, 'sign_in'),
                              child: Text(
                                'SIGN IN',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontFamily: 'Avenir Regular'),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                            )
                          ],
                        ),
                      )
                    ],
                  ))
            ],
          )
        ],
      ),
    );
  }
}
