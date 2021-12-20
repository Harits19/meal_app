import 'package:flutter/material.dart';
import 'package:meal_app/meal/models/meal.dart';
import 'package:meal_app/meal/views/meal_detail_page.dart';

class MealContainer extends StatelessWidget {
  const MealContainer({
    Key? key,
    required this.meal,
  }) : super(key: key);

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MealDetailPage(
                        meal: meal,
                      )));
        },
        child: Row(
          children: [
            Container(
              height: 100,
              width: 100,
              child: Image.network(meal.strMealThumb ?? ""),
            ),
            const SizedBox(
              width: 16,
            ),
            Text(meal.strMeal ?? ""),
            const Spacer(),
            IconButton(
              icon: const Icon(
                Icons.star,
              ),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
