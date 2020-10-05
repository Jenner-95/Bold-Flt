import 'package:bold_app/src/utilities/constants.dart';
import 'package:flutter/material.dart';

class CalendarProgress extends StatelessWidget {
  List<String> items = [
    "Jun 06 - 6pm",
    "Jun 06 - 6pm",
    "Jun 06 - 6pm",
    "Jun 06 - 6pm",
    "Jun 06 - 6pm",
    "Jun 06 - 6pm",
    "Jun 06 - 6pm",
    "Jun 06 - 6pm",
  ];
  List<String> trail = [
    "45min",
    "45min",
    "45min",
    "45min",
    "45min",
    "45min",
    "45min",
    "45min",
  ];
  List<String> subs = [
    "Barre Workout",
    "Barre Workout",
    "Barre Workout",
    "Barre Workout",
    "Barre Workout",
    "Barre Workout",
    "Barre Workout",
    "Barre Workout",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Table(
              // border: TableBorder.all(color: Colors.yellow),
              columnWidths: {
                0: FractionColumnWidth(.5),
                1: FractionColumnWidth(.5),
              },
              children: [
                TableRow(
                  decoration: BoxDecoration(color: primaryColor),
                  children: [
                    Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 25.0, vertical: 6.0),
                        child: Text(
                          'Totals',
                          style: kTableTextStyle,
                        )),
                    Column(children: []),
                  ],
                ),
                TableRow(
                    decoration: BoxDecoration(color: primaryColor),
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25.0, vertical: 6.0),
                        child: Text('Workouts', style: kTableTextStyle),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25.0, vertical: 6.0),
                        child: Text(
                          '0',
                          textAlign: TextAlign.center,
                          style: kTableTextStyle,
                        ),
                      ),
                    ]),
                TableRow(
                    decoration: BoxDecoration(color: primaryColor),
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25.0, vertical: 6.0),
                        child: Text(
                          'Minutes',
                          style: kTableTextStyle,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25.0, vertical: 6.0),
                        child: Text(
                          '0',
                          textAlign: TextAlign.center,
                          style: kTableTextStyle,
                        ),
                      ),
                    ]),
                TableRow(
                    decoration: BoxDecoration(color: primaryColor),
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25.0, vertical: 6.0),
                        child: Text(
                          'Calories',
                          style: kTableTextStyle,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25.0, vertical: 6.0),
                        child: Text(
                          '0',
                          textAlign: TextAlign.center,
                          style: kTableTextStyle,
                        ),
                      ),
                    ]),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Text(
                'Workout History',
                style: kTableTextStyle,
              ),
            ),
            Material(
              elevation: 5.0,
              child: Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height * 0.3,
                child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                    color: primaryColor,
                  ),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      contentPadding: EdgeInsets.only(left: 30.0, right: 210.0),
                      title: Text(
                        '${items[index]}',
                        style: TextStyle(
                          fontFamily: 'Avenir Regular',
                          fontSize: 18.0,
                        ),
                      ),
                      subtitle: Text(
                        '${subs[index]}',
                        style: TextStyle(
                          color: Color(0xff9cc6e8),
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Avenir Regular',
                        ),
                      ),
                      trailing: Text(
                        '${trail[index]}',
                        style: TextStyle(
                          fontFamily: 'Avenir Regular',
                          fontSize: 15.0,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 50.0),
            Table(
              // border: TableBorder.all(color: Colors.yellow),
              columnWidths: {
                0: FractionColumnWidth(.5),
                1: FractionColumnWidth(.5),
              },
              children: [
                TableRow(
                    decoration: BoxDecoration(color: greyColor),
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 8.0),
                        child: Text(
                          'Current Streak',
                          style: kTableYTextStyle,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25.0, vertical: 8.0),
                        child: Text(
                          '0',
                          textAlign: TextAlign.center,
                          style: kTableWTextStyle,
                        ),
                      ),
                    ]),
                TableRow(
                    decoration: BoxDecoration(color: greyColor),
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 8.0),
                        child: Text(
                          'Best Streak',
                          style: kTableYTextStyle,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25.0, vertical: 8.0),
                        child: Text(
                          '0',
                          textAlign: TextAlign.center,
                          style: kTableWTextStyle,
                        ),
                      ),
                    ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
