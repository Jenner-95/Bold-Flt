import 'package:flutter/material.dart';

const kSingTextStyle = TextStyle(
  fontFamily: 'Avenir Regular',
  fontSize: 15.0,
  fontWeight: FontWeight.bold,
);

const kSlidingTextStyle = TextStyle(
  fontSize: 18,
  fontFamily: 'Avenir Bold',
);

const kDetailTextStyle = TextStyle(
  fontSize: 12.0,
  color: Colors.black,
  fontFamily: 'Avenir Regular',
);

const kTableTextStyle = TextStyle(
  fontFamily: 'Avenir Bold',
  fontSize: 17.0,
);

const kTableYTextStyle = TextStyle(
  fontFamily: 'Avenir Bold',
  fontSize: 17.0,
  color: primaryColor,
);

const kTableWTextStyle = TextStyle(
  fontFamily: 'Avenir Bold',
  fontSize: 17.0,
  color: primaryColor,
);

const primaryColor = Color(0xfffcde43);

const greyColor = Color(0xff43444c);

const kCardTextStyle = TextStyle(
  fontSize: 10,
  fontWeight: FontWeight.bold,
  fontFamily: 'Avenir Regular',
);

const kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(
    Icons.location_city,
    color: Colors.white,
  ),
  hintText: 'Enter City Name',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
    borderSide: BorderSide.none,
  ),
);
