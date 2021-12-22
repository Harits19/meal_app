import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meal_app/meal/models/meal.dart';
import 'package:meal_app/repos/favorite_repository.dart';
import 'package:meta/meta.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc(this.myDatabase) : super(FavoriteLoading()) {
    on<FavoriteStarted>(_onStarted);
    on<FavoriteAdded>(_onItemAdded);
    on<FavoriteRemoved>(_onItemRemoved);
  }

  late final MyDatabase myDatabase;

  void _onStarted(FavoriteStarted event, Emitter<FavoriteState> emit) async {
    emit(FavoriteLoading());
    try {
      final favorite = await myDatabase.allFavorites;
      emit(FavoriteLoaded(favorite: favorite));
    } catch (_) {
      emit(FavoriteError());
    }
  }

  void _onItemAdded(FavoriteAdded event, Emitter<FavoriteState> emit) async {
    final state = this.state;
    emit(FavoriteLoading());
    if (state is FavoriteLoaded) {
      try {
        await myDatabase.addFavorite(event.meal);
        final favorite = await myDatabase.allFavorites;
        emit(FavoriteLoaded(favorite: favorite));
      } catch (_) {
        emit(FavoriteError());
      }
    }
  }

  void _onItemRemoved(
      FavoriteRemoved event, Emitter<FavoriteState> emit) async {
    final state = this.state;
    emit(FavoriteLoading());
    if (state is FavoriteLoaded) {
      try {
        myDatabase.removeFavorite(event.idMeal);
        final favorite = await myDatabase.allFavorites;
        emit(FavoriteLoaded(favorite: favorite));
      } catch (_) {
        emit(FavoriteError());
      }
    }
  }
}
