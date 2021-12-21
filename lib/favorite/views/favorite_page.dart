import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_app/favorite/bloc/favorite_bloc.dart';
import 'package:meal_app/meal/models/meal.dart';
import 'package:meal_app/views/circular_progress_widget.dart';
import 'package:meal_app/views/empty_widget.dart';
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
        child: BlocBuilder<FavoriteBloc, FavoriteState>(
          builder: (context, state) {
            if (state is FavoriteLoading) {
              return const CircularProgressWidget();
            }
            if (state is FavoriteLoaded) {
              return ListView(
                children: [
                  ...state.favorite.map(
                    (e) => MealContainer(
                      isFavorite: true,
                      meal: Meal(
                        idMeal: e.idMeal,
                        strMeal: e.strMeal,
                        strMealThumb: e.strMealThumb,
                      ),
                      onTapDelete: () {
                        context.read<FavoriteBloc>().add(
                              FavoriteRemoved(e.idMeal),
                            );
                      },
                    ),
                  )
                ],
              );
            }
            return const EmptyWidget();
          },
        ),
      ),
    );
  }
}
