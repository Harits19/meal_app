import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_app/base_constanta.dart';
import 'package:meal_app/meal/bloc/meal_bloc.dart';
import 'package:meal_app/meal/views/meal_page.dart';
import 'package:meal_app/shopping_repository.dart';

class App extends StatelessWidget {
  const App({Key? key, required this.shoppingRepository}) : super(key: key);

  final ShoppingRepository shoppingRepository;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
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
      ],
      child: MaterialApp(
        title: 'Meal App',
        initialRoute: '/',
        routes: {
          '/': (_) => const MealPage(),
        },
      ),
    );
  }
}
