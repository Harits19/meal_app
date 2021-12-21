import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:meal_app/favorite/bloc/favorite_bloc.dart';
import 'package:meal_app/meal/models/meal.dart';
import 'package:meal_app/meal/views/meal_detail_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_app/repos/favorite_repository.dart';

class MealContainer extends StatefulWidget {
  const MealContainer({
    Key? key,
    required this.meal,
    this.onTapDelete,
    this.onTapFavorite,
    this.isFavorite = false,
  }) : super(key: key);

  final Meal meal;
  final VoidCallback? onTapDelete;
  final VoidCallback? onTapFavorite;
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
            if (widget.onTapFavorite != null)
              IconButton(
                icon: const Icon(
                  Icons.star,
                ),
                onPressed: widget.onTapFavorite,
              ),
            if (widget.onTapDelete != null)
              IconButton(
                icon: const Icon(
                  Icons.delete,
                ),
                onPressed: widget.onTapDelete,
              ),
          ],
        ),
      ),
    );
  }
}
