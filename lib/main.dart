import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_app/app.dart';
import 'package:meal_app/shopping_repository.dart';
import 'package:meal_app/simple_bloc_observer.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(
      App(
        shoppingRepository: ShoppingRepository(),
      ),
    ),
    blocObserver: SimpleBlocObserver(),
  );
}
