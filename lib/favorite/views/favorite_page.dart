import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_app/favorite/bloc/favorite_bloc.dart';
import 'package:meal_app/meal/models/meal.dart';
import 'package:meal_app/views/circular_progress_widget.dart';
import 'package:meal_app/views/empty_widget.dart';
import 'package:meal_app/views/meal_container.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  static const routeName = "/favorite";

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
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
