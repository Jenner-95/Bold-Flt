import 'package:bold_app/src/preferences/user_preferences.dart';
import 'package:bold_app/src/utilities/constants.dart';
import 'package:bold_app/src/utilities/url_api.dart';
import 'package:bold_app/src/utilities/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bold_app/src/bloc/provider.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    // final userProvider = new UserProvider();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: 350,
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image: AssetImage('assets/photos/sign_in_back.png'),
                  fit: BoxFit.cover,
                ),
              ),
              // constraints: BoxConstraints.expand(),
            ),
          ),
          ListView(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 30.0, left: 30.0, top: 80.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: SvgPicture.asset(
                                'assets/images/boldlogo.svg',
                                height: 85.0,
                                color: primaryColor,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 90.0,
                        ),
                        _crearEmail(bloc),
                        SizedBox(
                          height: 10.0,
                        ),
                        _crearPassword(bloc),
                        SizedBox(
                          height: 50.0,
                        ),
                        _crearBoton(bloc),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget _crearEmail(LoginBloc bloc) {
  return StreamBuilder(
    stream: bloc.emailStream,
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
          child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          counterText: snapshot.data,
          labelText: 'e-mail',
          errorText: snapshot.error,
          hintStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        maxLines: 1,
        onChanged: bloc.changeEmail,
      ));
    },
  );
}

Widget _crearPassword(LoginBloc bloc) {
  return StreamBuilder(
    stream: bloc.passwordStream,
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        child: TextFormField(
          keyboardType: TextInputType.visiblePassword,
          decoration: InputDecoration(
            counterText: snapshot.data,
            labelText: 'Password',
            errorText: snapshot.error,
            hintStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
          maxLines: 1,
          obscureText: true,
          onChanged: bloc.changePassword,
        ),
      );
    },
  );
}

Widget _crearBoton(LoginBloc bloc) {
  return StreamBuilder(
    stream: bloc.formValidStream,
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return ButtonTheme(
        minWidth: 370.0,
        height: 50.0,
        child: RaisedButton(
          elevation: 5,
          textColor: Colors.black,
          color: primaryColor,
          padding: EdgeInsets.all(8.0),
          // onPressed: () => _login(bloc, context),
          onPressed: snapshot.hasData ? () => _login(bloc, context) : null,
          // onPressed: () => Navigator.pushNamed(context, 'register'),
          child: Text(
            'Sign In',
            style: TextStyle(
              fontSize: 15.0,
              fontFamily: 'Avenir Regular',
              fontWeight: FontWeight.bold,
            ),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        ),
      );
    },
  );
}

_login(LoginBloc bloc, BuildContext context) async {
  final _prefs = new UserPreferences();
  await http.post(
    URL.base + 'api/user/token/',
    // headers: {"Content-Type": "application/json"},
    body: {
      'email': bloc.email,
      'password': bloc.password,
    },
  ).then((resp) {
    Map<String, dynamic> decodedResp = json.decode(resp.body);
    if (resp.statusCode == 200) {
      print(resp.statusCode);
      if (decodedResp.containsKey('jwt')) {
        print(decodedResp['jwt']);
        _prefs.token = decodedResp['jwt'];
        print(_prefs.token);
        Navigator.pushReplacementNamed(context, 'home_page');
      } else {
        mostrarAlerta(context, 'Error, Intente de nuevo');
      }
    }
  });
}
