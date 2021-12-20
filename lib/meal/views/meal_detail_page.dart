import 'package:flutter/material.dart';
import 'package:meal_app/meal/models/meal.dart';

class MealDetailPage extends StatelessWidget {
  const MealDetailPage({Key? key, required this.meal}) : super(key: key);
  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textBold(meal.strMeal ?? ""),
              const Divider(),
              Container(
                height: 200,
                width: 200,
                child: Image.network(meal.strMealThumb ?? ""),
              ),
              const Divider(),
              Text("Kategori : ${meal.strCategory}"),
              Text("Area : ${meal.strArea}"),
              Text("Tag : ${meal.strTags}"),
              const Divider(),
              textBold("Ingredient"),
              Row(
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...meal.listIngredient.map((e) =>
                            (e.measure?.isEmpty ?? true)
                                ? const SizedBox()
                                : Text(e.ingredient!))
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...meal.listIngredient.map((e) =>
                            (e.measure?.isEmpty ?? true)
                                ? const SizedBox()
                                : Text(" : " + e.measure!))
                      ],
                    ),
                  ),
                ],
              ),
              const Divider(),
              Row(
                children: [
                  ElevatedButton(
                    child: Text(
                      "Add Favorite",
                    ),
                    onPressed: () {},
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  ElevatedButton(
                    child: Text(
                      "Delete Favorite",
                    ),
                    onPressed: () {},
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget textBold(String text) => Text(
        text,
        style: const TextStyle(
          backgroundColor: Colors.yellow,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      );
}
