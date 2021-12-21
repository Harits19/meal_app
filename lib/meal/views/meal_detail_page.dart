import 'package:flutter/material.dart';
import 'package:meal_app/favorite/bloc/favorite_bloc.dart';
import 'package:meal_app/meal/bloc/meal_bloc.dart';
import 'package:meal_app/meal/models/meal.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_app/repos/meal_repository.dart';
import 'package:meal_app/views/circular_progress_widget.dart';

class MealDetailPage extends StatefulWidget {
  const MealDetailPage({
    Key? key,
    required this.meal,
    this.isFavorite = false,
  }) : super(key: key);
  final Meal meal;
  final bool isFavorite;

  @override
  State<MealDetailPage> createState() => _MealDetailPageState();
}

class _MealDetailPageState extends State<MealDetailPage> {
  late Meal meal;
  @override
  void initState() {
    super.initState();
    meal = widget.meal;
    if (widget.isFavorite) updateData();
  }

  updateData() async {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      showDialog(
          context: context,
          builder: (context) {
            return const CircularProgressWidget();
          });
      final updatedMeal = await MealRepository.loadMealItemsById(meal.idMeal!);
      meal = updatedMeal;
      setState(() {});
      Navigator.pop(context);
    });
  }

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
              SizedBox(
                height: 200,
                width: 200,
                child: (meal.strMealThumb?.isEmpty ?? true)
                    ? null
                    : Image.network(meal.strMealThumb!),
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
                  if (!widget.isFavorite) ...[
                    ElevatedButton(
                      child: Text(
                        "Add Favorite",
                      ),
                      onPressed: () {
                        if (meal.idMeal == null) return;
                        context.read<FavoriteBloc>().add(
                              FavoriteAdded(meal),
                            );
                      },
                    ),
                    SizedBox(
                      width: 16,
                    ),
                  ] else
                    ElevatedButton(
                      child: Text(
                        "Delete Favorite",
                      ),
                      onPressed: () {
                        if (meal.idMeal == null) return;
                        context.read<FavoriteBloc>().add(
                              FavoriteRemoved(meal.idMeal!),
                            );
                      },
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
