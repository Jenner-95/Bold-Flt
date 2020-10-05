import 'package:bold_app/src/utilities/constants.dart';
import 'package:flutter/material.dart';

class ListMeals extends StatelessWidget {
  List<String> imgs = [
    "assets/photos/comida(avocado_.jpg",
    "assets/photos/comida(bowl).jpg",
    "assets/photos/comidayogurt.jpg",
    "assets/photos/comida(desayuno).jpg",
    "assets/photos/comida(avocado_.jpg",
    "assets/photos/comida(bowl).jpg",
    "assets/photos/comidayogurt.jpg",
    "assets/photos/comida(desayuno).jpg",
  ];

  List<String> items = [
    "Avocado on Toast",
    "Banana Salad",
    "Chia Yogurt & Fruits",
    "Fruit Sandwich",
    "Avocado on Toast",
    "Banana Salad",
    "Chia Yogurt & Fruits",
    "Fruit Sandwich"
  ];
  List<String> subs = [
    "500 cal",
    "500 cal",
    "500 cal",
    "500 cal",
    "500 cal",
    "500 cal",
    "500 cal",
    "500 cal"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: greyColor,
        centerTitle: true,
        title: Text(
          'Breakfast',
          style: TextStyle(
            color: primaryColor,
            fontFamily: 'Avenir Light',
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: primaryColor,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.separated(
          separatorBuilder: (context, index) => Divider(
                color: primaryColor,
              ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () => Navigator.pushNamed(context, 'detail_meal'),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
              leading: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage(imgs[index]),
              ),
              title: Text(
                '${items[index]}',
                style: TextStyle(
                  fontFamily: 'Avenir Bold',
                  fontSize: 18.0,
                ),
              ),
              subtitle: Text(
                '${subs[index]}',
                style: TextStyle(
                  color: Color(0xff9cc6e8),
                  fontFamily: 'Avenir Regular',
                  fontSize: 13.0,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: primaryColor,
              ),
            );
          }),
    );
  }
}
