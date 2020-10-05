import 'package:bold_app/src/utilities/constants.dart';
import 'package:bold_app/src/widgets/chart.dart';
import 'package:flutter/material.dart';

class CalendarWeight extends StatefulWidget {
  @override
  _CalendarWeightState createState() => _CalendarWeightState();
}

class _CalendarWeightState extends State<CalendarWeight> {
  PageController views = PageController(initialPage: 0);

  List<String> items = [
    "July 6, 2020",
    "June 15, 2020",
    "June 1, 2020",
    "May 25, 2020",
    "May 10, 2020",
    "Apr 25, 2020",
  ];

  List<String> trail = [
    "135 lbs",
    "165 lbs",
    "175 lbs",
    "185 lbs",
    "187 lbs",
    "190 lbs",
  ];
  int indexPage = 0;
  bool stopSelling = true;

  List<Widget> containers = [
    ChartWid(),
    ChartWid(),
    ChartWid(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  child: Column(
                children: <Widget>[
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 4.0,
                                  color: stopSelling
                                      ? Colors.black
                                      : Colors.white)),
                        ),
                        child: FlatButton(
                          child: Text(
                            "Week",
                            style: TextStyle(
                                fontSize: 18.0,
                                fontFamily: 'Avenir Regular',
                                color:
                                    stopSelling ? Colors.black : Colors.grey),
                          ),
                          onPressed: () {
                            setState(() {
                              indexPage = 0;
                              stopSelling = !stopSelling;
                            });
                          },
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 4.0,
                                  color: stopSelling
                                      ? Colors.white
                                      : Colors.black)),
                        ),
                        child: FlatButton(
                          child: Text(
                            "Month",
                            style: TextStyle(
                                fontSize: 18.0,
                                fontFamily: 'Avenir Regular',
                                color:
                                    stopSelling ? Colors.grey : Colors.black),
                          ),
                          onPressed: () {
                            setState(() {
                              indexPage = 1;
                              stopSelling = !stopSelling;
                            });
                          },
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(width: 4.0, color: Colors.white)),
                        ),
                        child: FlatButton(
                          child: Text(
                            "Year",
                            style: TextStyle(
                                fontSize: 18.0,
                                fontFamily: 'Avenir Regular',
                                color: Colors.grey),
                          ),
                          onPressed: () {
                            setState(() {
                              indexPage = 1;
                              // stopSelling = !stopSelling;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  containers[indexPage]
                ],
              )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  'Weight History',
                  style: kTableTextStyle,
                ),
              ),
              SizedBox(height: 10.0),
              Material(
                elevation: 5.0,
                child: Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height * 0.27,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => Divider(
                      color: primaryColor,
                    ),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        contentPadding:
                            EdgeInsets.only(left: 30.0, right: 40.0),
                        title: Text(
                          '${items[index]}',
                          style: TextStyle(
                              fontSize: 18, fontFamily: 'Avenir Regular'),
                        ),
                        trailing: Text(
                          '${trail[index]}',
                          style: TextStyle(
                              fontFamily: 'Avenir Bold', fontSize: 17.0),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(-25, -25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        FloatingActionButton(
                          mini: true,
                          onPressed: () {},
                          child: Icon(
                            Icons.add,
                            color: Colors.black,
                            // size: 35.0,
                          ),
                        ),
                        Text('Add Progress',
                            style: TextStyle(
                              fontSize: 12.0,
                              fontFamily: 'Avenir Regular',
                            )),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.0),
            ],
          ),
        ),
      ),
    );
  }
}
