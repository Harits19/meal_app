import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:meal_app/meal/models/meal.dart';
import 'package:meal_app/views/meal_detail_page.dart';

class MealContainer extends StatefulWidget {
  const MealContainer({
    Key? key,
    required this.meal,
    this.isFavorite = false,
  }) : super(key: key);

  final Meal meal;
  final bool isFavorite;

  @override
  State<MealContainer> createState() => _MealContainerState();
}

class _MealContainerState extends State<MealContainer> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Modular.to.pushNamed(
            MealDetailPage.routeName,
            arguments: {
              "meal": widget.meal,
              "isFavorite": widget.isFavorite,
            },
          );
        },
        child: Row(
          children: [
            SizedBox(
              height: 100,
              width: 100,
              child: (widget.meal.strMealThumb?.isEmpty ?? true)
                  ? null
                  : Image.network(widget.meal.strMealThumb!),
            ),
            const SizedBox(
              width: 16,
            ),
            Text(widget.meal.strMeal ?? ""),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
