part of 'meal_bloc.dart';

abstract class MealEvent extends Equatable {
  const MealEvent();
}

class MealGetItemsByFirstLetter extends MealEvent {
  const MealGetItemsByFirstLetter({required this.firstLetter});
  final String firstLetter;
  @override
  List<Object> get props => [];
}

class MealGetItemsById extends MealEvent {
  const MealGetItemsById({required this.id});
  final String id;
  @override
  List<Object> get props => [];
}
