import 'package:bold_app/src/utilities/constants.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool _obscureText = false;
  bool _agreedToTOS = false;

  void _setAgreedToTOS(bool newValue) {
    setState(() {
      _agreedToTOS = newValue;
    });
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Name', style: kSingTextStyle),
              TextFormField(
                validator: (String value) {
                  if (value.trim().isEmpty) {
                    return 'Name is required';
                  }
                },
              ),
              const SizedBox(height: 16.0),
              Text('Email', style: kSingTextStyle),
              TextFormField(
                validator: (String value) {
                  if (value.trim().isEmpty) {
                    return 'Email is required';
                  }
                },
              ),
              const SizedBox(height: 16.0),
              Text('Password', style: kSingTextStyle),
              TextFormField(
                decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                  onTap: _toggle,
                  child: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    size: 28,
                  ),
                )),
                obscureText: _obscureText,
                validator: (String value) {
                  if (value.trim().isEmpty) {
                    return 'Password is required';
                  }
                },
              ),
              const SizedBox(height: 50.0),
              Text('Select a Plan', style: kSingTextStyle),
              const SizedBox(height: 26.0),
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Wrap(
                    spacing: 20.0,
                    direction: Axis.horizontal,
                    children: <Widget>[
                      ButtonTheme(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        minWidth: 100.0,
                        height: 100.0,
                        child: RaisedButton(
                          onPressed: () {},
                          color: Color(0xff1a1a1b),
                          child: Text(
                            'Free',
                            style: TextStyle(
                              fontFamily: 'Avenir Bold',
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ),
                      ButtonTheme(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        minWidth: 100.0,
                        height: 100,
                        child: RaisedButton(
                          onPressed: () {},
                          color: Color(0xff9cc6e8),
                          child: RichText(
                              textAlign: TextAlign.left,
                              text: TextSpan(
                                  style: TextStyle(
                                    fontFamily: 'Avenir Bold',
                                    fontSize: 20.0,
                                    color: Colors.white,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(text: 'Go\n'),
                                    TextSpan(text: 'Pro       ')
                                  ])),
                        ),
                      ),
                      ButtonTheme(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        minWidth: 100.0,
                        height: 100.0,
                        child: RaisedButton(
                          onPressed: () {},
                          color: Color(0xff43444c),
                          child: RichText(
                              text: TextSpan(
                                  style: TextStyle(
                                    fontFamily: 'Avenir Bold',
                                    fontSize: 20.0,
                                    color: Colors.white,
                                  ),
                                  children: <TextSpan>[
                                TextSpan(text: 'Full\n'),
                                TextSpan(text: 'Fitness')
                              ])),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ButtonTheme(
                        minWidth: 340.0,
                        height: 60.0,
                        child: RaisedButton(
                          elevation: 6,
                          textColor: Colors.black,
                          color: primaryColor,
                          padding: EdgeInsets.all(8.0),
                          onPressed: () {},
                          child:
                              Text('7 Day Free Trial', style: kSingTextStyle),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 70.0,
                        child: Column(
                          children: <Widget>[
                            Checkbox(
                              value: _agreedToTOS,
                              onChanged: _setAgreedToTOS,
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () => _setAgreedToTOS(!_agreedToTOS),
                        child: RichText(
                            text: TextSpan(
                                style: TextStyle(
                                  fontFamily: 'Avenir Light',
                                  fontSize: 12.0,
                                  color: Colors.black,
                                ),
                                children: <TextSpan>[
                              TextSpan(text: '*I agree BOLD'),
                              TextSpan(
                                  text: ' Terms of Service\n',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(text: 'and'),
                              TextSpan(
                                  text: ' Privacy Policy\n',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ])),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, 'register_two'),
        child: Icon(
          Icons.arrow_forward,
          color: Colors.black,
        ),
        backgroundColor: primaryColor,
      ),
    );
  }
}