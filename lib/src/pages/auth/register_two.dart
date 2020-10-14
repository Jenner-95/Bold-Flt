import 'package:bold_app/src/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterForm2 extends StatefulWidget {
  @override
  _RegisterForm2State createState() => _RegisterForm2State();
}

class _RegisterForm2State extends State<RegisterForm2> {
  String _dropDownButtonValue = 'MM';
  String _dropDownButtonValue2 = 'DD';
  String _dropDownButtonValue3 = 'YYYY';

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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Welcome to Bold Gym please complete\n this steps so we can get to know you and\n your goal better',
                style: kSingTextStyle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 26.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        width: 65.0,
                        height: 65.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          // color: Colors.redAccent,
                        ),
                        child: SvgPicture.asset(
                          'assets/images/profileicon.svg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      // CircularProfileAvatar(
                      //   'https://www.shareicon.net/data/256x256/2017/02/15/878685_user_512x512.png',
                      //   radius: 40,
                      //   borderWidth: 5,
                      //   borderColor: Colors.yellowAccent,
                      //   elevation: 1.0,
                      //   cacheImage: true,
                      //   onTap: () {},
                      //   showInitialTextAbovePicture: true,
                      // ),
                      Padding(
                        padding: EdgeInsets.only(top: 40, left: 40),
                        child: ClipOval(
                          child: Material(
                            color: Color(0xff43444c),
                            child: InkWell(
                              child: SizedBox(
                                width: 25,
                                height: 25,
                                child: Icon(
                                  Icons.add,
                                  color: primaryColor,
                                  size: 18.0,
                                ),
                              ),
                              onTap: () {},
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              Text(
                'Monica',
                style: TextStyle(
                    fontFamily: 'Avenir Regular',
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0),
              ),
              SizedBox(height: 25.0),
              Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        'Birth Date',
                        style: kSingTextStyle,
                        textAlign: TextAlign.start,
                      )
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Wrap(
                    alignment: WrapAlignment.spaceEvenly,
                    spacing: 20.0,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * 0.2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white,
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 5.0,
                                  spreadRadius: 2.0,
                                  offset: Offset(3.0, 3.0))
                            ]),
                        child: DropdownButtonHideUnderline(
                          child: ButtonTheme(
                            alignedDropdown: true,
                            child: DropdownButton(
                              isExpanded: true,
                              hint: Text(
                                'MM',
                              ),
                              items: <String>['01', '02', '03']
                                  .map((String val) => DropdownMenuItem<String>(
                                        value: val,
                                        child: Text(val),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  _dropDownButtonValue = value;
                                });
                              },
                              style: TextStyle(color: Colors.grey),
                              iconEnabledColor: primaryColor,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white,
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 5.0,
                                  spreadRadius: 2.0,
                                  offset: Offset(3.0, 3.0))
                            ]),
                        child: DropdownButtonHideUnderline(
                          child: ButtonTheme(
                            alignedDropdown: true,
                            child: DropdownButton(
                              isExpanded: true,
                              hint: Text(
                                'DD',
                              ),
                              items: <String>['01', '02', '03']
                                  .map((String val) => DropdownMenuItem<String>(
                                        value: val,
                                        child: Text(val),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  _dropDownButtonValue2 = value;
                                });
                              },
                              style: TextStyle(color: Colors.grey),
                              iconEnabledColor: primaryColor,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white,
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 5.0,
                                  spreadRadius: 2.0,
                                  offset: Offset(3.0, 3.0))
                            ]),
                        child: DropdownButtonHideUnderline(
                          child: ButtonTheme(
                            alignedDropdown: true,
                            child: DropdownButton(
                              isExpanded: true,
                              hint: Text(
                                'YYYY',
                              ),
                              items: <String>['2019', '2020', '2021']
                                  .map((String val) => DropdownMenuItem<String>(
                                        value: val,
                                        child: Text(val),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  _dropDownButtonValue3 = value;
                                });
                              },
                              style: TextStyle(color: Colors.grey),
                              iconEnabledColor: primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        'Country',
                        style: kSingTextStyle,
                        textAlign: TextAlign.start,
                      )
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Wrap(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white,
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 5.0,
                                  spreadRadius: 2.0,
                                  offset: Offset(3.0, 3.0))
                            ]),
                        child: DropdownButtonHideUnderline(
                          child: ButtonTheme(
                              alignedDropdown: true,
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Guatemala',
                                  filled: true,
                                  border: InputBorder.none,
                                ),
                              )),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        'Gender',
                        style: kSingTextStyle,
                        textAlign: TextAlign.start,
                      )
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Wrap(
                        direction: Axis.horizontal,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.white,
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 5.0,
                                      spreadRadius: 2.0,
                                      offset: Offset(3.0, 3.0))
                                ]),
                            child: ButtonTheme(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              minWidth: 50.0,
                              height: 50.0,
                              child: RaisedButton(
                                onPressed: () {},
                                color: Colors.white,
                                child: SvgPicture.asset(
                                    'assets/images/femaleicon.svg'),
                              ),
                            ),
                          ),
                          SizedBox(width: 10.0),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.white,
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 5.0,
                                      spreadRadius: 2.0,
                                      offset: Offset(3.0, 3.0))
                                ]),
                            child: ButtonTheme(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              minWidth: 50.0,
                              height: 50.0,
                              child: RaisedButton(
                                onPressed: () {},
                                color: Colors.white,
                                child: SvgPicture.asset(
                                    'assets/images/maleicon.svg'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 25.0),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text(
                                  'How tall are you?',
                                  style: kSingTextStyle,
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                            SizedBox(height: 10.0),
                            Container(
                              width: MediaQuery.of(context).size.width * .4,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.white,
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 5.0,
                                        spreadRadius: 2.0,
                                        offset: Offset(3.0, 3.0))
                                  ]),
                              child: DropdownButtonHideUnderline(
                                child: ButtonTheme(
                                  alignedDropdown: true,
                                  child: DropdownButton(
                                    isExpanded: true,
                                    hint: Text(
                                      'cm',
                                    ),
                                    items: <String>['1', '2', '3']
                                        .map((String val) =>
                                            DropdownMenuItem<String>(
                                              value: val,
                                              child: Text(val),
                                            ))
                                        .toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        _dropDownButtonValue3 = value;
                                      });
                                    },
                                    style: TextStyle(color: Colors.grey),
                                    iconEnabledColor: primaryColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'How much do you weigh?',
                              style: kSingTextStyle,
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(height: 10),
                            Container(
                              width: MediaQuery.of(context).size.width * .45,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.white,
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 5.0,
                                        spreadRadius: 2.0,
                                        offset: Offset(3.0, 3.0))
                                  ]),
                              child: DropdownButtonHideUnderline(
                                child: ButtonTheme(
                                  alignedDropdown: true,
                                  child: DropdownButton(
                                    isExpanded: true,
                                    hint: Text(
                                      'lbs',
                                    ),
                                    items: <String>['1', '2', '3']
                                        .map((String val) =>
                                            DropdownMenuItem<String>(
                                              value: val,
                                              child: Text(val),
                                            ))
                                        .toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        _dropDownButtonValue3 = value;
                                      });
                                    },
                                    style: TextStyle(color: Colors.grey),
                                    iconEnabledColor: primaryColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'register_three');
        },
        child: Icon(
          Icons.arrow_forward,
          color: Colors.black,
        ),
        backgroundColor: primaryColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
