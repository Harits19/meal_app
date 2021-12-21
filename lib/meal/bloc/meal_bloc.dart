import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meal_app/meal/models/meal.dart';
import 'package:meal_app/repos/meal_repository.dart';

part 'meal_event.dart';
part 'meal_state.dart';

class MealBloc extends Bloc<MealEvent, MealState> {
  MealBloc() : super(MealLoading()) {
    on<MealGetItemsByFirstLetter>(_onGetItemByFirstLetter);
  }

  void _onGetItemByFirstLetter(
    MealGetItemsByFirstLetter event,
    Emitter<MealState> emit,
  ) async {
    emit(MealLoading());
    try {
      final meal =
          await MealRepository.loadMealItemsByFirstLetter(event.firstLetter);
      emit(MealLoaded(meal));
    } catch (_) {
      emit(MealError());
    }
  }
}
