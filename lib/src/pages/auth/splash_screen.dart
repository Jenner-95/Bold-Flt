import 'package:bold_app/src/pages/auth/landing_screen.dart';
import 'package:bold_app/src/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _sockCheckForSession().then((status) {
      _navigateToSign();
    });
  }

  Future<bool> _sockCheckForSession() async {
    await Future.delayed(Duration(milliseconds: 5000), () {});
    return true;
  }

  void _navigateToSign() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => LandingScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyColor,
      body: Container(
        alignment: Alignment.center,
        child: SvgPicture.asset(
          'assets/images/boldicon.svg',
          color: primaryColor,
          width: 140,
        ),
      ),
    );
  }
}
