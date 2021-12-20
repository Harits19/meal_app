import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meal_app/repos/favorite_repository.dart';
import 'package:meta/meta.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(FavoriteLoading()) {
    on<FavoriteStarted>(_onStarted);
    on<FavoriteAdded>(_onItemAdded);
    on<FavoriteRemoved>(_onItemRemoved);
  }

  MyDatabase myDatabase = MyDatabase();

  void _onStarted(FavoriteStarted event, Emitter<FavoriteState> emit) async {
    emit(FavoriteLoading());
    try {
      final items = await myDatabase.allFavorites;
      emit(FavoriteLoaded(favorite: items));
    } catch (_) {
      emit(FavoriteError());
    }
  }

  void _onItemAdded(FavoriteAdded event, Emitter<FavoriteState> emit) async {
    final state = this.state;
    if (state is FavoriteLoaded) {
      try {
        // shoppingRepository.addItemToCart(event.favorite);
        // emit(FavoriteLoaded(
        //     favorite: Cart(items: [...state.favorite.items, event.favorite])));
      } catch (_) {
        emit(FavoriteError());
      }
    }
  }

  void _onItemRemoved(FavoriteRemoved event, Emitter<FavoriteState> emit) {
    final state = this.state;
    if (state is FavoriteLoaded) {
      try {
        // shoppingRepository.removeItemFromCart(event.favorite);
        // emit(
        //   FavoriteLoaded(
        //     favorite: Cart(
        //       items: [...state.favorite.items]..remove(event.favorite),
        //     ),
        //   ),
        // );
      } catch (_) {
        emit(FavoriteError());
      }
    }
  }
}
