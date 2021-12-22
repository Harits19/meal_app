import 'package:meal_app/meal/models/meal.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'favorite_repository.g.dart';

class Favorites extends Table {
  TextColumn? get idMeal => text().customConstraint('UNIQUE')();
  TextColumn? get strMeal => text().nullable()();
  TextColumn? get strMealThumb => text().nullable()();
}

@UseMoor(tables: [Favorites])
class MyDatabase extends _$MyDatabase {
  MyDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(path: 'db1.sqlite'));

  @override
  int get schemaVersion => 1;

  Future<List<Favorite>> get allFavorites => select(favorites).get();

  Future<void> addFavorite(Meal meal) async {
    final favorite = Favorite(
      idMeal: meal.idMeal!,
      strMeal: meal.strMeal,
      strMealThumb: meal.strMealThumb,
    );
    removeFavorite(meal.idMeal!); // remove data if duplicate
    await into(favorites).insert(favorite);
  }

  void removeFavorite(String i) =>
      (delete(favorites)..where((t) => t.idMeal.equals(i))).go();
}
