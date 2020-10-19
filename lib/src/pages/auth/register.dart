import 'package:bold_app/src/utilities/constants.dart';
import 'package:flutter/material.dart';

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
                validator: (String value) {
                  if (value.isEmpty) return 'Name is required';
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              Text('Email', style: kSingTextStyle),
              TextFormField(
                controller: email,
                validator: (String value) {
                  if (value.isEmpty) return 'Email is required';
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              Text('Password', style: kSingTextStyle),
              TextFormField(
                controller: password,
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
                          selected = 1;
                        });
                        print(selected);
                      },
                      selected: selected == 1,
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
                          selected = 2;
                        });
                        print(selected);
                      },
                      selected: selected == 2,
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
                          selected = 3;
                        });
                        print(selected);
                      },
                      selected: selected == 3,
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
                            selected = 4;
                          });
                          print(selected);
                        },
                        selected: selected == 4,
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
        onPressed: () {
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
