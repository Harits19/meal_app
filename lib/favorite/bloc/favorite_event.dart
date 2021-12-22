part of 'favorite_bloc.dart';

@immutable
abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();
}

class FavoriteGetAllFavorite extends FavoriteEvent {
  @override
  List<Object> get props => [];
}

class FavoriteAdded extends FavoriteEvent {
  const FavoriteAdded(this.meal);

  final Meal meal;

  @override
  List<Object> get props => [meal];
}

class FavoriteRemoved extends FavoriteEvent {
  const FavoriteRemoved(this.idMeal);

  final String idMeal;

  @override
  List<Object> get props => [idMeal];
}
