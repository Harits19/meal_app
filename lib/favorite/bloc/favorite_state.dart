part of 'favorite_bloc.dart';

@immutable
abstract class FavoriteState extends Equatable {
  const FavoriteState();
}

class FavoriteLoading extends FavoriteState {
  @override
  List<Object> get props => [];
}

class FavoriteLoaded extends FavoriteState {
  const FavoriteLoaded({required this.favorite});

  final List<Favorite> favorite;

  @override
  List<Object> get props => [favorite];
}

class FavoriteError extends FavoriteState {
  @override
  List<Object> get props => [];
}
