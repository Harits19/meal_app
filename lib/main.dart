import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:meal_app/app.dart';
import 'package:meal_app/app_module.dart';
import 'package:meal_app/simple_bloc_observer.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(
      ModularApp(module: AppModule(), child: const App()),
    ),
    blocObserver: SimpleBlocObserver(),
  );
}
