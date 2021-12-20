part of 'favorite_bloc.dart';

@immutable
abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();
}

class FavoriteStarted extends FavoriteEvent {
  @override
  List<Object> get props => [];
}

class FavoriteAdded extends FavoriteEvent {
  const FavoriteAdded(this.favorite);

  final Favorite favorite;

  @override
  List<Object> get props => [favorite];
}

class FavoriteRemoved extends FavoriteEvent {
  const FavoriteRemoved(this.favorite);

  final Favorite favorite;

  @override
  List<Object> get props => [favorite];
}
