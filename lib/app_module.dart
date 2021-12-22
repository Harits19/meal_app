import 'package:flutter_modular/flutter_modular.dart';
import 'package:meal_app/favorite/views/favorite_page.dart';
import 'package:meal_app/repos/favorite_repository.dart';
import 'package:meal_app/views/meal_detail_page.dart';
import 'package:meal_app/meal/views/meal_page.dart';
import 'package:meal_app/repos/meal_repository.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => MealRepository()),
        Bind.singleton((i) => FavoriteRepository()),
      ];

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
