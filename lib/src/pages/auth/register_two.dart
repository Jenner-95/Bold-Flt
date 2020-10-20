import 'package:bold_app/src/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterForm2 extends StatefulWidget {
  @override
  _RegisterForm2State createState() => _RegisterForm2State();
}

class _RegisterForm2State extends State<RegisterForm2> {
  String _dropDownButtonValue = 'MM';
  String _dropDownButtonValue2 = 'DD';
  String _dropDownButtonValue3 = 'YYYY';
  String selected = '';
  var _selectedValue;
  String dropdownValue = 'Masculino';
  String gender = '';

  List<String> days1 = <String>[
    '01',
    '02',
    '03',
    '04',
    '05',
    '06',
    '07',
    '08',
    '09',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '23',
    '24',
    '25',
    '26',
    '27',
    '28',
    '29',
    '30',
  ];
  List<String> days2 = <String>[
    '01',
    '02',
    '03',
    '04',
    '05',
    '06',
    '07',
    '08',
    '09',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '23',
    '24',
    '25',
    '26',
    '27',
    '28',
    '29',
    '30',
    '31'
  ];
  List<String> days3 = <String>[
    '01',
    '02',
    '03',
    '04',
    '05',
    '06',
    '07',
    '08',
    '09',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '23',
    '24',
    '25',
    '26',
    '27',
    '28',
  ];
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
                        child: DropdownButtonFormField<String>(
                          isExpanded: true,
                          icon:
                              Icon(Icons.arrow_drop_down, color: primaryColor),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(5.0),
                          ),
                          value: _selectedValue,
                          hint: Text(
                            'MM',
                          ),
                          onChanged: (String newValue) {
                            setState(() {
                              dropdownValue = newValue;
                              gender = dropdownValue;
                              print('Este es el gender $gender');
                            });
                          },
                          validator: (String value) {
                            if (value == null) {
                              return 'Seleccione su género';
                            }
                            return null;
                          },
                          items: <String>[
                            '01',
                            '02',
                            '03',
                            '04',
                            '05',
                            '06',
                            '07',
                            '08',
                            '09',
                            '10',
                            '11',
                            '12'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                              ),
                            );
                          }).toList(),
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
                        child: DropdownButtonFormField<String>(
                            isExpanded: true,
                            icon: Icon(Icons.arrow_drop_down,
                                color: primaryColor),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(5.0),
                            ),
                            value: _selectedValue,
                            hint: Text(
                              'DD',
                            ),
                            onChanged: (String newValue) {
                              setState(() {
                                dropdownValue = newValue;
                                gender = dropdownValue;
                              });
                            },
                            validator: (String value) {
                              if (value == null) {
                                return 'Seleccione su género';
                              }
                              return null;
                            },
                            items: gender == '04' ||
                                    gender == '06' ||
                                    gender == '09' ||
                                    gender == '11'
                                ? days1.map<DropdownMenuItem<String>>(
                                    (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                      ),
                                    );
                                  }).toList()
                                : gender == '01' ||
                                        gender == '03' ||
                                        gender == '05' ||
                                        gender == '07' ||
                                        gender == '08' ||
                                        gender == '10' ||
                                        gender == '12'
                                    ? days2.map<DropdownMenuItem<String>>(
                                        (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(
                                            value,
                                          ),
                                        );
                                      }).toList()
                                    : days3.map<DropdownMenuItem<String>>(
                                        (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(
                                            value,
                                          ),
                                        );
                                      }).toList()),
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
                        child: DropdownButtonFormField<String>(
                          isExpanded: true,
                          icon:
                              Icon(Icons.arrow_drop_down, color: primaryColor),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(5.0),
                          ),
                          value: _selectedValue,
                          hint: Text(
                            'YYYY',
                          ),
                          onChanged: (String newValue) {
                            setState(() {
                              dropdownValue = newValue;
                              gender = dropdownValue;
                              print(dropdownValue);
                              print(gender);
                            });
                          },
                          validator: (String value) {
                            if (value == null) {
                              return 'Seleccione su género';
                            }
                            return null;
                          },
                          items: <String>[
                            '01',
                            '02',
                            '03',
                            '04',
                            '05',
                            '06',
                            '07',
                            '08',
                            '09',
                            '10',
                            '11',
                            '12'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                              ),
                            );
                          }).toList(),
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
                                  contentPadding: EdgeInsets.all(12.0),
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
                    children: <Widget>[
                      ChoiceChip(
                        elevation: 3,
                        selectedColor: Color(0xff43444c),
                        backgroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 12.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        label: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset('assets/images/femaleicon.svg'),
                          ],
                        ),
                        onSelected: (value) {
                          setState(() {
                            selected = '1';
                          });
                          print(selected);
                        },
                        selected: selected.contains('1'),
                      ),
                      SizedBox(width: 10.0),
                      ChoiceChip(
                        elevation: 3,
                        selectedColor: Color(0xff43444c),
                        backgroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 10.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        label: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset('assets/images/maleicon.svg'),
                          ],
                        ),
                        onSelected: (value) {
                          setState(() {
                            selected = '2';
                          });
                          print(selected);
                        },
                        selected: selected.contains('2'),
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
        onPressed: () async {
          SharedPreferences sharedPreferences =
              await SharedPreferences.getInstance();
          String name = sharedPreferences.getString('names');
          String email = sharedPreferences.getString('emails');
          String password = sharedPreferences.getString('passwords');
          String plan = sharedPreferences.getString('selected');
          print(name);
          print(email);
          print(password);
          print(plan);
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
