import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:meal_app/meal/models/meal.dart';

class MealRepository {
  static const _domain = "https://www.themealdb.com/api/json/v1/1";

  MealRepository._();

  static Future<List<Meal>> loadMealItemsByFirstLetter(
      String firstLetter) async {
    log("called load meal item");
    final response = await Dio().get(
      _domain + '/search.php',
      queryParameters: {
        "f": firstLetter,
      },
    );
    final List<dynamic> data = response.data["meals"];
    final result = data.map((e) => Meal.fromJson(e)).toList().cast<Meal>();
    return result;
  }

  static Future<Meal> loadMealItemsById(String id) async {
    log("called load meal item");
    final response = await Dio().get(
      _domain + '/lookup.php',
      queryParameters: {
        "i": id,
      },
    );
    final List<dynamic> data = response.data["meals"];
    final result =
        data.map((e) => Meal.fromJson(e)).toList().cast<Meal>().first;
    return result;
  }
}
