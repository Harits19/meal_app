import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_app/constans/base_constanta.dart';
import 'package:meal_app/favorite/bloc/favorite_bloc.dart';
import 'package:meal_app/meal/bloc/meal_bloc.dart';
import 'package:meal_app/meal/views/meal_page.dart';
import 'package:meal_app/repos/favorites.dart';
import 'package:meal_app/repos/shopping_repository.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  // final ShoppingRepository shoppingRepository;

  @override
  Widget build(BuildContext context) {
    return Provider<MyDatabase>(
      create: (_) => MyDatabase(),
      child: MultiBlocProvider(
        providers: [
          // BlocProvider(
          //   create: (_) => CatalogBloc(
          //     shoppingRepository: shoppingRepository,
          //   )..add(CatalogStarted()),
          // ),
          // BlocProvider(
          //   create: (_) => CartBloc(
          //     shoppingRepository: shoppingRepository,
          //   )..add(CartStarted()),
          // ),
          BlocProvider(
            create: (_) => MealBloc()
              ..add(
                MealGetItemsByFirstLetter(
                  firstLetter: listAlphabet[initIndexLetter],
                ),
              ),
          ),

          BlocProvider(
            create: (_) => FavoriteBloc()..add(FavoriteStarted()),
          ),
        ],
        child: MaterialApp(
          title: 'Meal App',
          initialRoute: '/',
          routes: {
            '/': (_) => const MealPage(),
          },
        ),
      ),
    );
  }
}
