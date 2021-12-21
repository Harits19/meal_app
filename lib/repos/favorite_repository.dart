// import 'package:meal_app/repos/article.dart';
import 'package:meal_app/meal/models/meal.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'favorite_repository.g.dart';

// this will generate a table called "todos" for us. The rows of that table will
// be represented by a class called "Todo".
class Favorites extends Table {
  // article id
  TextColumn? get idMeal => text().customConstraint('UNIQUE')();
  TextColumn? get strMeal => text().nullable()();
  TextColumn? get strMealThumb => text().nullable()();
}

// this annotation tells moor to prepare a database class that uses both of the
// tables we just defined. We'll see how to use that database class in a moment.
@UseMoor(tables: [Favorites])
class MyDatabase extends _$MyDatabase {
  // we tell the database where to store the data with this constructor
  MyDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(path: 'db1.sqlite'));

  // you should bump this number whenever you change or add a table definition. Migrations
  // are covered later in this readme.
  @override
  int get schemaVersion => 1;

  Future<List<Favorite>> get allFavorites => select(favorites).get();

  Future<void> addFavorite(Meal meal) async {
    var favorite = Favorite(
      idMeal: meal.idMeal!,
      strMeal: meal.strMeal,
      strMealThumb: meal.strMealThumb,
    );
    removeFavorite(meal.idMeal!); // remove data if duplicate
    await into(favorites).insert(favorite);
  }

  void removeFavorite(String i) =>
      (delete(favorites)..where((t) => t.idMeal.equals(i))).go();

  // watches all todo entries in a given category. The stream will automatically
  // emit new items whenever the underlying data changes.
  Stream<bool> isFavorite(String id) {
    // TODO: is there a count for Moor ? MOAR APIS?!
    // https://github.com/simolus3/moor/issues/55#issuecomment-507808555
    return select(favorites).watch().map((favoritesList) =>
        favoritesList.any((favorite) => favorite.idMeal == id));
    // return (select(favorites)..where((favorite) => favorite.id.equals(id)))
    //    .watch()
    //    .map((favoritesList) => favoritesList.length >= 1);
  }
}
