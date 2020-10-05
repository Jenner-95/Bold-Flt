import 'package:bold_app/src/utilities/constants.dart';
import 'package:bold_app/src/widgets/calendar_progress.dart';
import 'package:bold_app/src/widgets/calendar_weight.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProgressPage extends StatefulWidget {
  @override
  _ProgressPageState createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  // final Map<int, Widget> map = const <int, Widget>{
  //   0: Text('Calendar'),
  //   1: Text('Weight'),
  // };

  List<Widget>
      childWidgets; //The Widgets that has to be loaded when a tab is selected.
  int selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    loadChildWidgets(); //Method to add the Children as user selected.
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'Progress',
            style: TextStyle(fontFamily: 'Avenir Bold'),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          // backgroundColor: Color.fromRGBO(255, 255, 255, 0.9),
          elevation: 1,
        ),
        body: Container(
          child: Column(children: <Widget>[
            SizedBox(height: 20.0),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: CupertinoSlidingSegmentedControl(
                      thumbColor: primaryColor,
                      backgroundColor: Colors.grey[50],
                      onValueChanged: (value) {
                        setState(() {
                          selectedIndex = value;
                        });
                      },
                      groupValue: selectedIndex,
                      children: {
                        0: Padding(
                          padding: EdgeInsets.symmetric(vertical: 6),
                          child: Text(
                            'Calendar',
                            style: kSlidingTextStyle,
                          ),
                        ),
                        1: Padding(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          child: Text(
                            'Weight',
                            style: kSlidingTextStyle,
                          ),
                        )
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: getChildWidget(),
            )
          ]),
        ),
      ),
    );
  }

  void loadChildWidgets() {
    childWidgets = [
      CalendarProgress(),
      CalendarWeight(),
    ];
  }

  Widget getChildWidget() => childWidgets[selectedIndex];
}
