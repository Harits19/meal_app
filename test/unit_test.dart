import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meal_app/meal/bloc/meal_bloc.dart';
import 'package:meal_app/repos/meal_repository.dart';

void main() {
  group('MealBloc', () {
    blocTest(
      'MealGetItemsByFirstLetter',
      build: () => MealBloc(
        MealRepository(),
      ),
      act: (MealBloc bloc) => bloc.add(
        const MealGetItemsByFirstLetter(firstLetter: "a"),
      ),
      wait: const Duration(seconds: 5),
      expect: () => [
        MealLoading(),
        isA<MealLoaded>(),
      ],
    );
  });
}
