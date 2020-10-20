import 'package:bold_app/src/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

PageController controller = new PageController();

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final keyForm = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Duration kDuration = const Duration(milliseconds: 300);
  static const kCurve = Curves.ease;
  bool obscureText = true;
  bool termAndConditions = false;

  String value_name = '';
  String value_email = '';
  String value_password = '';

//Shared Preferences
  String selected = '';
  String names = '';
  String emails = '';
  String passwords = '';
  String value_select = '';

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
          key: keyForm,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Name', style: kSingTextStyle),
              TextFormField(
                controller: name,
                onChanged: (value) {
                  setState(() {
                    value_name = value;
                  });
                },
                validator: (String value) {
                  if (value.isEmpty) return 'Name is required';
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              Text('Email', style: kSingTextStyle),
              TextFormField(
                controller: email,
                onChanged: (value) {
                  setState(() {
                    value_email = value;
                  });
                },
                validator: (String value) {
                  if (value.isEmpty) return 'Email is required';
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              Text('Password', style: kSingTextStyle),
              TextFormField(
                controller: password,
                onChanged: (value) {
                  setState(() {
                    value_password = value;
                  });
                },
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() => obscureText = !obscureText);
                    },
                    icon: Icon(
                      obscureText ? Icons.visibility : Icons.visibility_off,
                      size: 28,
                    ),
                  ),
                ),
                obscureText: obscureText,
                validator: (String value) {
                  if (value.isEmpty) return 'Password is required';
                  return null;
                },
              ),
              const SizedBox(height: 50.0),
              Text('Select a Plan', style: kSingTextStyle),
              const SizedBox(height: 26.0),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ChoiceChip(
                      selectedColor: Color(0xffcaffbf),
                      backgroundColor: Color(0xff1a1a1b),
                      padding: EdgeInsets.symmetric(
                          vertical: 38.0, horizontal: 25.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      label: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Free',
                            style: TextStyle(
                              fontFamily: 'Avenir Bold',
                              fontSize: 20.0,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      onSelected: (value) {
                        setState(() {
                          selected = 'Free';
                        });
                        print(selected);
                      },
                      selected: selected.contains('Free'),
                    ),
                    ChoiceChip(
                      selectedColor: Color(0xffcaffbf),
                      backgroundColor: Color(0xff9cc6e8),
                      padding: EdgeInsets.symmetric(
                          vertical: 25.0, horizontal: 30.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      label: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Go',
                            style: TextStyle(
                              fontFamily: 'Avenir Bold',
                              fontSize: 20.0,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Pro',
                            style: TextStyle(
                              fontFamily: 'Avenir Bold',
                              fontSize: 20.0,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      onSelected: (value) {
                        setState(() {
                          selected = 'Pro';
                        });
                        print(selected);
                      },
                      selected: selected.contains('Pro'),
                    ),
                    ChoiceChip(
                      selectedColor: Color(0xffcaffbf),
                      backgroundColor: Color(0xff43444c),
                      padding: EdgeInsets.symmetric(
                          vertical: 25.0, horizontal: 10.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      label: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Full',
                            style: TextStyle(
                              fontFamily: 'Avenir Bold',
                              fontSize: 20.0,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Fitness',
                            style: TextStyle(
                              fontFamily: 'Avenir Bold',
                              fontSize: 20.0,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      onSelected: (value) {
                        setState(() {
                          selected = 'Full';
                        });
                        print(selected);
                      },
                      selected: selected.contains('Full'),
                    ),
                  ]),
              SizedBox(height: 20.0),
              Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ChoiceChip(
                        selectedColor: Color(0xffcaffbf),
                        backgroundColor: primaryColor,
                        padding: EdgeInsets.symmetric(
                            vertical: 25.0, horizontal: 110.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        label: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              '7 Day Free Trial',
                              style: kSingTextStyle,
                            ),
                          ],
                        ),
                        onSelected: (value) {
                          setState(() {
                            selected = 'Trial';
                          });
                          print(selected);
                        },
                        selected: selected.contains('Trial'),
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
                              value: termAndConditions,
                              onChanged: (value) {
                                setState(() => termAndConditions = value);
                              },
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
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
        onPressed: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();

          prefs.setString('names', value_name);
          prefs.setString('emails', value_email);
          prefs.setString('passwords', value_password);
          prefs.setString('selected', selected);

          if (keyForm.currentState.validate() &&
              selected != null &&
              termAndConditions == true) {
            controller.nextPage(duration: kDuration, curve: kCurve);
          }
        },
        child: Icon(
          Icons.arrow_forward,
          color: Colors.black,
        ),
        backgroundColor: primaryColor,
      ),
    );
  }
}
