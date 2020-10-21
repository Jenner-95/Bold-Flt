import 'package:bold_app/src/widgets/register_liquid.dart';
import 'package:flutter/material.dart';
import 'package:bold_app/src/bloc/provider.dart';
import 'package:bold_app/src/preferences/user_preferences.dart';
import 'package:bold_app/src/pages/auth/splash_screen.dart';
import 'package:bold_app/src/pages/challenges/detail_challenge.dart';
import 'package:bold_app/src/pages/home/detail_meal.dart';
import 'package:bold_app/src/pages/home/detail_workout.dart';
import 'package:bold_app/src/pages/home/home.dart';
import 'package:bold_app/src/pages/profile/profile.dart';
import 'package:bold_app/src/pages/tabbar/tabbar.dart';
import 'package:bold_app/src/widgets/list_meals.dart';
import 'package:bold_app/src/pages/auth/sign_in.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new UserPreferences();
  await prefs.initPrefs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final prefs = new UserPreferences();
    print(prefs.token);
    print('token');

    return Provider(
      child: MaterialApp(
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.grey,
          accentColor: Color(0xfffcde43),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: 'splash_screen',
        routes: {
          'splash_screen': (BuildContext context) => SplashScreen(),
          'sign_in': (BuildContext context) => SignIn(),
          'register': (BuildContext context) => SamplePage(),
          'tabbar': (BuildContext context) => TabsPage(),
          'home_page': (BuildContext context) => HomePage(),
          'profile_page': (BuildContext context) => ProfilePage(),
          'detail_workout': (BuildContext context) => SamplePlayer(),
          'list_meals': (BuildContext context) => ListMeals(),
          'detail_meal': (BuildContext context) => DetailMeal(),
          'detail_challenge': (BuildContext context) => DetailChallenge(),
        },
      ),
    );
  }
}
