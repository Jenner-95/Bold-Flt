import 'package:bold_app/src/utilities/constants.dart';
import 'package:bold_app/src/widgets/meals.dart';
import 'package:bold_app/src/widgets/workouts.dart';
import 'package:flutter/material.dart';
import 'package:md2_tab_indicator/md2_tab_indicator.dart';

class HomePage extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> with SingleTickerProviderStateMixin {
  TabController _controller;

  String title = '"BE MENTALLY\n';
  String title2 = '  STRONGER\n';
  String title3 = '  THAN WHAT YOU\n';
  String title4 = '  PHYSICALLY\n';
  String title5 = '  FEEL"';

  String imageRoute = 'assets/photos/home_workout.png';
  int indexPage = 0;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsSrolled) {
            return <Widget>[
              SliverAppBar(
                automaticallyImplyLeading: false,
                actions: <Widget>[
                  RawMaterialButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'profile_page');
                    },
                    child: Icon(
                      Icons.account_circle,
                      color: Colors.white,
                      size: 45.0,
                    ),
                  ),
                ],
                title: Text(
                  'Hi\nMonica!',
                  style: TextStyle(
                      fontFamily: 'Avenir Bold',
                      fontSize: 20.0,
                      color: Colors.white),
                ),
                expandedHeight: 400,
                flexibleSpace: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0x99000000),
                        image: DecorationImage(
                          image: AssetImage(imageRoute),
                          fit: BoxFit.cover,
                        ),
                      ),
                      constraints: BoxConstraints.expand(),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: indexPage == 0
                            ? Color(0x99000000)
                            : Colors.transparent,
                      ),
                    ),
                    FlexibleSpaceBar(
                      titlePadding: EdgeInsets.only(
                        left: 30.0,
                        bottom: 70.0,
                      ),
                      title: RichText(
                        text: TextSpan(
                          style: TextStyle(
                              fontFamily: 'Avenir Regular',
                              fontSize: 13.0,
                              color: indexPage == 0
                                  ? primaryColor
                                  : Color(0xff1a1a1b)),
                          children: <TextSpan>[
                            TextSpan(text: title),
                            TextSpan(
                                text: title2,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: title3),
                            TextSpan(
                                text: title4,
                                style: TextStyle(
                                    fontWeight: indexPage == 0
                                        ? FontWeight.bold
                                        : FontWeight.normal)),
                            TextSpan(
                                text: title5,
                                style: TextStyle(
                                    fontWeight: indexPage == 1
                                        ? FontWeight.bold
                                        : FontWeight.normal)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(30.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60.0),
                          topRight: Radius.circular(60.0)),
                      color: Colors.white,
                    ),
                    child: TabBar(
                      onTap: (index) {
                        print(index);
                        if (index == 0) {
                          setState(() {
                            title = '"BE MENTALLY\n';
                            title2 = '  STRONGER\n';
                            title3 = '  THAN WHAT YOU\n';
                            title4 = '  PHYSICALLY\n';
                            title5 = '  FEEL"';
                            imageRoute = 'assets/photos/home_workout.png';
                            indexPage = 0;
                          });
                        } else {
                          setState(() {
                            title = '\n\n';
                            title2 = '\n';
                            title3 = '\n\n';
                            title4 = '"EAT\n';
                            title5 = '  MINDFULLY"';
                            imageRoute = 'assets/photos/home_meals.png';
                            indexPage = 1;
                          });
                        }
                      },
                      controller: _controller,
                      labelStyle: TextStyle(
                        fontFamily: 'Avenir Regular',
                        fontWeight: FontWeight.w900,
                        fontSize: 15.0,
                      ),
                      indicatorSize: TabBarIndicatorSize.label,
                      labelPadding: EdgeInsets.symmetric(
                        horizontal: 60,
                      ),
                      labelColor: primaryColor,
                      unselectedLabelColor: Color(0xff43444c),
                      isScrollable: false,
                      indicator: MD2Indicator(
                        indicatorHeight: 5,
                        indicatorColor: primaryColor,
                        indicatorSize: MD2IndicatorSize.full,
                      ),
                      tabs: <Widget>[
                        Tab(
                          text: 'Workouts',
                        ),
                        Tab(
                          text: 'Meals',
                        )
                      ],
                    ),
                  ),
                ),
              )
            ];
          },
          body: TabBarView(
            controller: _controller,
            children: <Widget>[
              WorkoutsPage(),
              MealsPage(),
            ],
          ),
        ));
  }
}
