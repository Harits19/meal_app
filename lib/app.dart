import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_app/constans/base_constanta.dart';
import 'package:meal_app/favorite/bloc/favorite_bloc.dart';
import 'package:meal_app/meal/bloc/meal_bloc.dart';
import 'package:meal_app/meal/views/meal_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:meal_app/repos/favorite_repository.dart';
import 'package:meal_app/repos/meal_repository.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => MealBloc(Modular.get<MealRepository>())
            ..add(
              MealGetItemsByFirstLetter(
                firstLetter: listAlphabet[initIndexLetter],
              ),
            ),
        ),
        BlocProvider(
          create: (_) => FavoriteBloc(MyDatabase())..add(FavoriteStarted()),
        ),
      ],
      child: MaterialApp(
        title: 'Meal App',
        initialRoute: '/',
        routes: {
          '/': (_) => const MealPage(),
        },
      ).modular(),
    );
  }
}
