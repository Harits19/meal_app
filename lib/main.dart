import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:meal_app/app.dart';
import 'package:meal_app/favorite/views/favorite_page.dart';
import 'package:meal_app/meal/views/meal_detail_page.dart';
import 'package:meal_app/meal/views/meal_page.dart';
import 'package:meal_app/repos/favorite_repository.dart';
import 'package:meal_app/simple_bloc_observer.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(
      ModularApp(module: AppModule(), child: const App()),
    ),
    blocObserver: SimpleBlocObserver(),
  );
}

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          MealPage.routeName,
          child: (context, args) => const MealPage(),
        ),
        ChildRoute(
          MealDetailPage.routeName,
          child: (context, args) => MealDetailPage(
            meal: args.data["meal"],
            isFavorite: args.data["isFavorite"],
          ),
        ),
        ChildRoute(
          FavoritePage.routeName,
          child: (context, args) => const FavoritePage(),
        ),
      ];
}
