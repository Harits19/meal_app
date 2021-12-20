part of 'meal_bloc.dart';

abstract class MealState extends Equatable {
  const MealState();

  @override
  List<Object> get props => [];
}

class MealLoading extends MealState {}

class MealLoaded extends MealState {
  const MealLoaded(this.meal);

  final List<Meal> meal;

  @override
  List<Object> get props => [meal];
}

class MealError extends MealState {}
