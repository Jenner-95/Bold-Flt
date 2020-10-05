import 'package:bold_app/src/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bold_app/src/widgets/all_challenges.dart';
import 'package:bold_app/src/widgets/completed_challenges.dart';

class ChallengePage extends StatefulWidget {
  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  List<Widget> childWidgets;
  int selectedIndex = 0;
  int cupertinoTabBarValue = 0;
  int cupertinoTabBarValueGetter() => cupertinoTabBarValue;

  @override
  void initState() {
    super.initState();
    loadChildWidgets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              title: Text(
                'Challenges',
                style: TextStyle(fontFamily: 'Avenir Bold'),
              ),
              centerTitle: true,
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              elevation: 1,
            )
          ];
        },
        body: Container(
          child: Column(
            children: <Widget>[
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
                            'All',
                            style: kSlidingTextStyle,
                          ),
                        ),
                        1: Padding(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          child: Text(
                            'Completed',
                            style: kSlidingTextStyle,
                          ),
                        )
                      },
                    ),
                  )

                      // ),
                      ),
                ],
              ),
              SizedBox(height: 20.0),
              Expanded(
                child: getChildWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void loadChildWidgets() {
    childWidgets = [
      AllChallenge(),
      CompletedChallenge(),
    ];
  }

  Widget getChildWidget() => childWidgets[selectedIndex];
}
