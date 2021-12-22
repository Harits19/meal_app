import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meal_app/meal/models/meal.dart';
import 'package:meal_app/repos/favorite_repository.dart';
import 'package:meta/meta.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc(this.favoriteRepo) : super(FavoriteLoading()) {
    on<FavoriteGetAllFavorite>(_onGetAllFavorite);
    on<FavoriteAdded>(_onItemAdded);
    on<FavoriteRemoved>(_onItemRemoved);
  }

  late final FavoriteRepository favoriteRepo;

  void _onGetAllFavorite(
      FavoriteGetAllFavorite event, Emitter<FavoriteState> emit) async {
    emit(FavoriteLoading());
    try {
      final favorite = await favoriteRepo.allFavorites;
      emit(FavoriteLoaded(favorite: favorite));
    } catch (_) {
      emit(FavoriteError());
    }
  }

  void _onItemAdded(FavoriteAdded event, Emitter<FavoriteState> emit) async {
    emit(FavoriteLoading());
    try {
      await favoriteRepo.addFavorite(event.meal);
      final favorite = await favoriteRepo.allFavorites;
      emit(FavoriteLoaded(favorite: favorite));
    } catch (_) {
      emit(FavoriteError());
    }
  }

  void _onItemRemoved(
      FavoriteRemoved event, Emitter<FavoriteState> emit) async {
    emit(FavoriteLoading());
    try {
      favoriteRepo.removeFavorite(event.idMeal);
      final favorite = await favoriteRepo.allFavorites;
      emit(FavoriteLoaded(favorite: favorite));
    } catch (_) {
      emit(FavoriteError());
    }
  }
}
