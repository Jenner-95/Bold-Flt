import 'package:bold_app/src/utilities/constants.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilePage extends StatelessWidget {
  List<String> items = [
    "Height",
    "Starting Weight",
    "Current Weight",
    "Goal Weight",
  ];
  List<String> properties = [
    "Workout Reminder",
    "Payment Options",
    "Support",
    "Restore Purchase Options",
    "Privacy Policy & Terms of use",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              floating: true,
              elevation: 0,
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              title: Text(
                'HELLO!',
                style: TextStyle(
                    fontSize: 23.0,
                    color: Colors.grey,
                    fontFamily: 'Avenir Bold'),
              ),
            )
          ];
        },
        body: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                          padding: EdgeInsets.only(top: 45, left: 45),
                          child: ClipOval(
                            child: Material(
                              color: greyColor,
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
                    SizedBox(height: 15.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 10.0),
                      child: Text(
                        'Monica',
                        style: TextStyle(
                            fontFamily: 'Avenir Regular',
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 3,
                                offset: Offset(0, 1))
                          ]),
                      height: MediaQuery.of(context).size.height * 0.35,
                      child: ListView.separated(
                        physics: BouncingScrollPhysics(),
                        separatorBuilder: (context, index) => Divider(
                          color: primaryColor,
                        ),
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            dense: true,
                            contentPadding:
                                EdgeInsets.only(left: 30.0, right: 30.0),
                            title: Text(
                              '${items[index]}',
                              style: TextStyle(
                                  fontSize: 17.0, fontFamily: 'Avenir Regular'),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: greyColor,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 3,
                                offset: Offset(0, 1))
                          ]),
                      height: MediaQuery.of(context).size.height * 0.44,
                      child: ListView.separated(
                        physics: BouncingScrollPhysics(),
                        separatorBuilder: (context, index) =>
                            Divider(color: Colors.white),
                        itemCount: properties.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            dense: true,
                            contentPadding:
                                EdgeInsets.only(left: 30.0, right: 30.0),
                            title: Text(
                              '${properties[index]}',
                              style: TextStyle(
                                  fontSize: 17.0,
                                  color: primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Avenir Regular'),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
