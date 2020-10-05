import 'package:bold_app/src/utilities/constants.dart';
import 'package:flutter/material.dart';

class DetailMeal extends StatefulWidget {
  @override
  _DetailMealState createState() => _DetailMealState();
}

class _DetailMealState extends State<DetailMeal> {
  String imageRoute = 'assets/photos/comida(avocado_.jpg';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.zero,
                height: MediaQuery.of(context).size.height / 2,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(imageRoute), fit: BoxFit.cover)),
              ),
              Padding(
                padding: EdgeInsets.only(top: 32),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    RawMaterialButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        // size: 35.0,
                      ),
                    ),
                  ],
                ),
              ),
              DraggableScrollableSheet(
                  initialChildSize: 0.55,
                  minChildSize: 0.55,
                  maxChildSize: 0.55,
                  builder: (BuildContext context, scrollController) {
                    return SingleChildScrollView(
                      controller: scrollController,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50),
                            )),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 40.0, right: 40.0, top: 50.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Avocado on Toast',
                                      style: TextStyle(
                                          fontSize: 22.0,
                                          color: Colors.black,
                                          fontFamily: 'Avenir Bold'),
                                    ),
                                    SizedBox(height: 5.0),
                                    Text(
                                      '500 cal',
                                      style: TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.black,
                                          fontFamily: 'Avenir Regular'),
                                    ),
                                    SizedBox(
                                      height: 15.0,
                                    ),
                                    Text(
                                      'Ingredients',
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        color: primaryColor,
                                        fontFamily: 'Avenir Bold',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Wrap(
                                children: <Widget>[
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        SizedBox(height: 10.0),
                                        Text(
                                          'Avocado',
                                          style: kDetailTextStyle,
                                        ),
                                        SizedBox(height: 10.0),
                                        Text('Lemon', style: kDetailTextStyle),
                                        SizedBox(height: 10.0),
                                        Text('Olive Oil',
                                            style: kDetailTextStyle),
                                        SizedBox(height: 10.0),
                                        Text(
                                          'Whole wheat bread',
                                          style: kDetailTextStyle,
                                        ),
                                        SizedBox(height: 10.0),
                                        Text(
                                          'Salt & Pepper',
                                          style: kDetailTextStyle,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        SizedBox(height: 10.0),
                                        Text(
                                          '1',
                                          style: kDetailTextStyle,
                                        ),
                                        SizedBox(height: 10.0),
                                        Text(
                                          '1',
                                          style: kDetailTextStyle,
                                        ),
                                        SizedBox(height: 10.0),
                                        Text(
                                          '1 tsp',
                                          style: kDetailTextStyle,
                                        ),
                                        SizedBox(height: 10.0),
                                        Text(
                                          '2 pieces',
                                          style: kDetailTextStyle,
                                        ),
                                        SizedBox(height: 10.0),
                                        Text(
                                          'to taste',
                                          style: kDetailTextStyle,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 30.0),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'How to cook',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      color: primaryColor,
                                      fontFamily: 'Avenir Bold',
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  })
            ],
          )),
    );
  }
}
