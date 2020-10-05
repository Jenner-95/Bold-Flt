import 'package:bold_app/src/utilities/constants.dart';
import 'package:flutter/material.dart';

class MealsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildListDelegate([
            Container(
              padding: EdgeInsets.symmetric(horizontal: 35.0, vertical: 10.0),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 10.0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          CardImage(),
                          Spacer(),
                          CardImage(),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          CardImage(),
                          Spacer(),
                          CardImage(),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ]),
        )
      ],
    );
  }
}

class CardImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, 'list_meals'),
              child: Container(
                width: 170,
                height: 180,
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage('assets/photos/comida(snacks).jpg'),
                            fit: BoxFit.cover)),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  elevation: 5,
                  margin: EdgeInsets.all(10),
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(0, -25),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                      color: greyColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                      )),
                  height: 30,
                  width: 120,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Breakfast',
                        style: TextStyle(
                            color: primaryColor,
                            fontSize: 16.0,
                            fontFamily: 'Avenir Bold'),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
