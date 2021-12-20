import 'package:flutter/material.dart';
import 'package:meal_app/meal/models/meal.dart';
import 'package:meal_app/views/meal_container.dart';

class MealFavoritePage extends StatefulWidget {
  const MealFavoritePage({Key? key}) : super(key: key);

  @override
  _MealFavoritePageState createState() => _MealFavoritePageState();
}

class _MealFavoritePageState extends State<MealFavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            ...List.generate(
                20,
                (index) => MealContainer(
                      meal: Meal(),
                    )),
          ],
        ),
      ),
    );
  }
}
