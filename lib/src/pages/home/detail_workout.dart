import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bold_app/src/utilities/constants.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:video_player/video_player.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';

class SamplePlayer extends StatefulWidget {
  @override
  _SamplePlayerState createState() => _SamplePlayerState();
}

class _SamplePlayerState extends State<SamplePlayer> {
  void displayBottomSheet(BuildContext context) {
    showModalBottomSheet(
      isDismissible: false,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0), topRight: Radius.circular(25.0))),
      backgroundColor: Colors.transparent,
      context: context,
      builder: (ctx) {
        return Container(
          decoration: BoxDecoration(
            color: greyColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
          ),
          height: MediaQuery.of(context).size.height * 0.47,
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 15.0),
                    child: Text("Schedule Workout",
                        style: TextStyle(
                          fontFamily: 'Avenir Bold',
                          fontSize: 17.0,
                          color: primaryColor,
                        )),
                  ),
                  Divider(color: Colors.white),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 40.0, vertical: 5.0),
                        // height: 80,
                        child: DatePicker(
                          DateTime.now(),
                          dayTextStyle: TextStyle(color: Colors.white),
                          dateTextStyle: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                          monthTextStyle: TextStyle(color: Colors.white),
                          initialSelectedDate: _selectedValue,
                          selectionColor: Colors.white,
                          selectedTextColor: Colors.blueAccent,
                          onDateChange: (date) {
                            // New date selected
                            setState(() {
                              _selectedValue = date;
                            });
                          },
                        ),
                      ),
                      Divider(color: Colors.white),
                      SizedBox(
                        height: 100,
                        child: CupertinoTheme(
                          data: CupertinoThemeData(
                            textTheme: CupertinoTextThemeData(
                                dateTimePickerTextStyle:
                                    TextStyle(fontSize: 15)),
                            brightness: Brightness.dark,
                          ),
                          child: CupertinoDatePicker(
                              initialDateTime: _dateTime,
                              mode: CupertinoDatePickerMode.time,
                              onDateTimeChanged: (datetime) {
                                setState(() {
                                  _dateTime = datetime;
                                });
                              }),
                        ),
                      ),
                      SizedBox(height: 20),
                      ButtonTheme(
                        minWidth: 260,
                        height: 40.0,
                        child: RaisedButton(
                          elevation: 6,
                          textColor: greyColor,
                          color: primaryColor,
                          padding: EdgeInsets.all(8.0),
                          onPressed: () {},
                          child: Text(
                            'Schedule',
                            style: TextStyle(fontSize: 13.0),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Transform.translate(
                offset: Offset(350, -25),
                child: FloatingActionButton(
                  mini: true,
                  onPressed: () => Navigator.pop(context),
                  shape: CircleBorder(),
                  child: Icon(
                    Icons.clear,
                    color: greyColor,
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  DateTime _selectedValue = DateTime.now();
  DateTime _dateTime = DateTime.now();
  String circuits = '4 circuits';
  String reps = '8 reps';

  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    _controller = VideoPlayerController.network(
        "https://github.com/GeekyAnts/flick-video-player-demo-videos/blob/master/example/rio_from_above_compressed.mp4?raw=true");
    _initializeVideoPlayerFuture = _controller.initialize();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                leading: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
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
                backgroundColor: Colors.grey[30],
                expandedHeight: 400,
                flexibleSpace: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0x99000000),
                        image: DecorationImage(
                          image: AssetImage('assets/photos/work_detail.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      constraints: BoxConstraints.expand(),
                    ),
                    Container(
                      decoration: BoxDecoration(color: Color(0x99000000)),
                    ),
                    FlexibleSpaceBar(
                      // background: FutureBuilder(
                      //   future: _initializeVideoPlayerFuture,
                      //   builder: (context, snapshot) {
                      //     if (snapshot.connectionState == ConnectionState.done) {
                      //       return AspectRatio(
                      //         aspectRatio: _controller.value.aspectRatio,
                      //         child: VideoPlayer(_controller),
                      //       );
                      //     } else {
                      //       return Center(
                      //         child: CircularProgressIndicator(),
                      //       );
                      //     }
                      //   },
                      // ),
                      titlePadding: EdgeInsets.only(bottom: 180.0),
                      centerTitle: true,
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          RawMaterialButton(
                            onPressed: () {
                              setState(() {
                                if (_controller.value.isPlaying) {
                                  _controller.pause();
                                } else {
                                  _controller.play();
                                }
                              });
                            },
                            shape: CircleBorder(),
                            child: Icon(
                              _controller.value.isPlaying
                                  ? Icons.pause
                                  : Icons.play_arrow,
                              color: Colors.white,
                              size: 50.0,
                            ),
                          ),
                          SizedBox(height: 5.0),
                          _controller.value.isPlaying
                              ? Text(
                                  '',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12.0),
                                )
                              : Text(
                                  'Workout Preview',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12.0),
                                )
                        ],
                      ),
                    ),
                  ],
                ),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(20.0),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(left: 40.0, top: 15.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60.0),
                          topRight: Radius.circular(60.0)),
                      color: Colors.white,
                    ),
                    child: Text(
                      'Legs & Abs',
                      style: TextStyle(
                        fontFamily: 'Avenir Bold',
                        fontSize: 23.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ];
          },
          body: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40.0, vertical: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Get lean and strong with this 30 min. Workout',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 13.0,
                              color: Colors.black,
                              fontFamily: 'Avenir Light',
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            '$circuits - $reps',
                            style: TextStyle(
                                fontSize: 11.0,
                                color: primaryColor,
                                fontFamily: 'Avenir Bold'),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Equipment',
                            style: TextStyle(
                                fontSize: 17.0, fontFamily: 'Avenir Bold'),
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              ButtonTheme(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                minWidth: 90.0,
                                height: 90.0,
                                child: RaisedButton(
                                    // elevation: 0,
                                    onPressed: () {},
                                    color: Colors.white,
                                    child: Column(
                                      children: <Widget>[
                                        SvgPicture.asset(
                                          'assets/images/pesasicon.svg',
                                          fit: BoxFit.cover,
                                          width: 50,
                                        ),
                                        SizedBox(height: 10.0),
                                        Text(
                                          'Dumbbell(s)',
                                          style: kCardTextStyle,
                                        )
                                      ],
                                    )),
                              ),
                              SizedBox(width: 30.0),
                              ButtonTheme(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                minWidth: 90.0,
                                height: 90.0,
                                child: RaisedButton(
                                    // elevation: 3,
                                    onPressed: () {},
                                    color: Colors.white,
                                    child: Column(
                                      children: <Widget>[
                                        SvgPicture.asset(
                                          'assets/images/jumpropeicon.svg',
                                          fit: BoxFit.cover,
                                          width: 25,
                                        ),
                                        SizedBox(height: 10.0),
                                        Text(
                                          'Jump Rope',
                                          style: kCardTextStyle,
                                        )
                                      ],
                                    )),
                              ),
                              SizedBox(width: 30.0),
                              ButtonTheme(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                minWidth: 90.0,
                                height: 90.0,
                                child: RaisedButton(
                                    // elevation: 3,
                                    onPressed: () {},
                                    color: Colors.white,
                                    child: Column(
                                      children: <Widget>[
                                        SvgPicture.asset(
                                          'assets/images/yogamaticon.svg',
                                          fit: BoxFit.cover,
                                          width: 55,
                                        ),
                                        SizedBox(height: 20.0),
                                        Text(
                                          'Yoga Mat',
                                          style: kCardTextStyle,
                                        ),
                                        SizedBox(height: 5.0)
                                      ],
                                    )),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 40.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          ButtonTheme(
                            minWidth: double.infinity,
                            height: 45.0,
                            child: RaisedButton(
                              elevation: 3,
                              textColor: greyColor,
                              color: primaryColor,
                              padding: EdgeInsets.all(8.0),
                              onPressed: () {},
                              child: Text(
                                'Start Workout',
                                style: TextStyle(
                                  fontSize: 13.0,
                                  fontFamily: 'Avenir Bold',
                                ),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          ButtonTheme(
                            minWidth: double.infinity,
                            height: 45.0,
                            child: RaisedButton(
                              elevation: 3,
                              textColor: primaryColor,
                              color: Colors.white,
                              padding: EdgeInsets.all(8.0),
                              onPressed: () => displayBottomSheet(context),
                              child: Text(
                                'Schedule Workout',
                                style: TextStyle(
                                  fontSize: 13.0,
                                  fontFamily: 'Avenir Bold',
                                ),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                            ),
                          ),
                          SizedBox(height: 10.0),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
