import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:meal_app/meal/models/meal.dart';

class MealRepository {
  // final _items = <Meal>[];
  static const domain = "https://www.themealdb.com/api/json/v1/1";

  Future<List<Meal>> loadMealItemsByFirstLetter(String firstLetter) async {
    log("called load meal item");
    final response = await Dio().get(
      domain + '/search.php',
      queryParameters: {
        "f": firstLetter,
      },
    );
    final List<dynamic> data = response.data["meals"];
    final result = data.map((e) => Meal.fromJson(e)).toList().cast<Meal>();
    return result;
  }

  // void addItemToCart(Meal item) => _items.add(item);

  // void removeItemFromCart(Meal item) => _items.remove(item);
}
